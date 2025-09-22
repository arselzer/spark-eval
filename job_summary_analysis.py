#!/usr/bin/env python3
import os
import re
from collections import defaultdict, Counter
from typing import Dict, List, Set, Tuple

def parse_sql_file(filepath: str) -> Dict:
    """Parse a SQL file and extract join information."""
    with open(filepath, 'r') as f:
        content = f.read()

    # Extract table names from FROM and JOIN clauses
    tables = set()

    # Find FROM clause
    from_match = re.search(r'FROM\s+(.*?)(?:WHERE|$)', content, re.DOTALL | re.IGNORECASE)
    if from_match:
        from_clause = from_match.group(1)
        # Extract table aliases
        table_patterns = re.findall(r'(\w+)\s+AS\s+(\w+)', from_clause, re.IGNORECASE)
        for full_name, alias in table_patterns:
            tables.add((full_name, alias))

    # Extract WHERE clause
    where_match = re.search(r'WHERE\s+(.*?)(?:GROUP BY|ORDER BY|LIMIT|$)', content, re.DOTALL | re.IGNORECASE)
    where_clause = where_match.group(1) if where_match else ""

    # Find all equality join conditions (exclude constant comparisons)
    join_conditions = []

    # Pattern to match table.column = table.column
    equality_pattern = r'(\w+)\.(\w+)\s*=\s*(\w+)\.(\w+)'

    for match in re.finditer(equality_pattern, where_clause):
        left_table, left_col, right_table, right_col = match.groups()
        join_conditions.append((f"{left_table}.{left_col}", f"{right_table}.{right_col}"))

    return {
        'tables': tables,
        'join_conditions': join_conditions,
        'where_clause': where_clause
    }

def find_equivalence_classes(join_conditions: List[Tuple[str, str]]) -> List[Set[str]]:
    """Find equivalence classes of join attributes using Union-Find."""
    # Build adjacency list
    graph = defaultdict(set)
    all_attrs = set()

    for left, right in join_conditions:
        graph[left].add(right)
        graph[right].add(left)
        all_attrs.add(left)
        all_attrs.add(right)

    # Find connected components using DFS
    visited = set()
    equivalence_classes = []

    for attr in all_attrs:
        if attr not in visited:
            component = set()
            stack = [attr]

            while stack:
                current = stack.pop()
                if current not in visited:
                    visited.add(current)
                    component.add(current)
                    for neighbor in graph[current]:
                        if neighbor not in visited:
                            stack.append(neighbor)

            if component:
                equivalence_classes.append(component)

    return equivalence_classes

def main():
    job_dir = "/home/as/git/spark-eval-groupagg/benchmark/job"

    # Find all *a.sql files except schema.sql
    sql_files = []
    for file in os.listdir(job_dir):
        if file.endswith('a.sql') and file != 'schema.sql':
            sql_files.append(os.path.join(job_dir, file))

    sql_files.sort()

    print("# JOB Benchmark Summary Analysis")
    print()

    # Statistics collection
    table_usage = Counter()
    attribute_patterns = Counter()
    hypergraph_sizes = []
    equivalence_class_counts = []

    query_data = []

    for filepath in sql_files:
        filename = os.path.basename(filepath)
        parsed = parse_sql_file(filepath)

        # Count table usage
        for full_name, alias in parsed['tables']:
            table_usage[full_name] += 1

        # Analyze join patterns
        equivalence_classes = find_equivalence_classes(parsed['join_conditions'])
        equivalence_class_counts.append(len(equivalence_classes))

        # Count hypergraph size (number of tables)
        hypergraph_sizes.append(len(parsed['tables']))

        # Store query data
        query_data.append({
            'filename': filename,
            'num_tables': len(parsed['tables']),
            'num_joins': len(parsed['join_conditions']),
            'num_eq_classes': len(equivalence_classes),
            'tables': {alias for _, alias in parsed['tables']},
            'eq_classes': equivalence_classes
        })

    # Summary statistics
    print("## Overall Statistics")
    print(f"- Total queries analyzed: {len(sql_files)}")
    print(f"- Average number of tables per query: {sum(hypergraph_sizes) / len(hypergraph_sizes):.1f}")
    print(f"- Min/Max tables per query: {min(hypergraph_sizes)}/{max(hypergraph_sizes)}")
    print(f"- Average equivalence classes per query: {sum(equivalence_class_counts) / len(equivalence_class_counts):.1f}")
    print()

    # Most frequently used tables
    print("## Most Frequently Used Tables")
    for table, count in table_usage.most_common(10):
        print(f"- {table}: {count} queries")
    print()

    # Query complexity breakdown
    print("## Query Complexity Breakdown")
    complexity_bins = defaultdict(list)
    for qd in query_data:
        if qd['num_tables'] <= 5:
            complexity_bins['Simple (≤5 tables)'].append(qd['filename'])
        elif qd['num_tables'] <= 8:
            complexity_bins['Medium (6-8 tables)'].append(qd['filename'])
        elif qd['num_tables'] <= 12:
            complexity_bins['Complex (9-12 tables)'].append(qd['filename'])
        else:
            complexity_bins['Very Complex (>12 tables)'].append(qd['filename'])

    for complexity, queries in complexity_bins.items():
        print(f"- **{complexity}**: {len(queries)} queries")
        print(f"  - {', '.join(sorted(queries))}")
        print()

    # Common join patterns
    print("## Common Join Patterns")
    print()
    print("### Frequent Movie-centric Patterns")
    movie_centric = 0
    person_centric = 0
    company_centric = 0

    for qd in query_data:
        has_movie_star = any('movie' in str(ec) for ec in qd['eq_classes']
                           if len([attr for attr in ec if 'movie_id' in attr]) >= 2)
        has_person_star = any('person' in str(ec) for ec in qd['eq_classes']
                            if len([attr for attr in ec if 'person_id' in attr]) >= 2)
        has_company_star = any('company' in str(ec) for ec in qd['eq_classes']
                             if len([attr for attr in ec if 'company_id' in attr]) >= 1)

        if has_movie_star:
            movie_centric += 1
        if has_person_star:
            person_centric += 1
        if has_company_star:
            company_centric += 1

    print(f"- Movie-centric joins (multiple tables joined via movie_id): {movie_centric} queries")
    print(f"- Person-centric joins (multiple tables joined via person_id): {person_centric} queries")
    print(f"- Company-related joins: {company_centric} queries")
    print()

    # Largest equivalence classes
    print("## Largest Equivalence Classes by Query")
    print()
    largest_classes = []
    for qd in query_data:
        if qd['eq_classes']:
            max_class = max(qd['eq_classes'], key=len)
            largest_classes.append((qd['filename'], len(max_class), max_class))

    largest_classes.sort(key=lambda x: x[1], reverse=True)

    for filename, size, eq_class in largest_classes[:10]:
        attrs = sorted(list(eq_class))
        print(f"- **{filename}**: {size} attributes")
        print(f"  - {{{', '.join(attrs)}}}")
        print()

if __name__ == "__main__":
    main()