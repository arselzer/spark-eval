#!/usr/bin/env python3
import os
import re
from collections import defaultdict, deque
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

def build_hypergraph(tables: Set[Tuple[str, str]], join_conditions: List[Tuple[str, str]]) -> Dict:
    """Build hypergraph representation."""
    # Map table aliases to full names
    alias_to_table = {alias: full_name for full_name, alias in tables}

    # Nodes are table aliases
    nodes = set(alias for _, alias in tables)

    # Group join conditions by equivalence classes
    equivalence_classes = find_equivalence_classes(join_conditions)

    # Each equivalence class becomes a hyperedge
    hyperedges = []
    for eq_class in equivalence_classes:
        # Extract tables involved in this equivalence class
        tables_in_edge = set()
        for attr in eq_class:
            table_alias = attr.split('.')[0]
            tables_in_edge.add(table_alias)

        if len(tables_in_edge) > 1:  # Only include if it connects multiple tables
            hyperedges.append({
                'tables': tables_in_edge,
                'attributes': eq_class
            })

    return {
        'nodes': nodes,
        'hyperedges': hyperedges
    }

def analyze_query_file(filepath: str) -> Dict:
    """Analyze a single query file."""
    filename = os.path.basename(filepath)
    parsed = parse_sql_file(filepath)

    equivalence_classes = find_equivalence_classes(parsed['join_conditions'])
    hypergraph = build_hypergraph(parsed['tables'], parsed['join_conditions'])

    return {
        'filename': filename,
        'tables': parsed['tables'],
        'join_conditions': parsed['join_conditions'],
        'equivalence_classes': equivalence_classes,
        'hypergraph': hypergraph
    }

def main():
    job_dir = "/home/as/git/spark-eval-groupagg/benchmark/job"

    # Find all *a.sql files except schema.sql
    sql_files = []
    for file in os.listdir(job_dir):
        if file.endswith('a.sql') and file != 'schema.sql':
            sql_files.append(os.path.join(job_dir, file))

    sql_files.sort()

    print("# JOB Benchmark Query Analysis")
    print("## Join Equivalence Classes and Hypergraphs")
    print()

    for filepath in sql_files:
        result = analyze_query_file(filepath)

        print(f"### Query: {result['filename']}")
        print()

        # Tables
        print("**Tables:**")
        for full_name, alias in sorted(result['tables']):
            print(f"- {full_name} AS {alias}")
        print()

        # Join conditions
        print("**Join Conditions:**")
        if result['join_conditions']:
            for left, right in result['join_conditions']:
                print(f"- {left} = {right}")
        else:
            print("- None")
        print()

        # Equivalence classes
        print("**Equivalence Classes:**")
        if result['equivalence_classes']:
            for i, eq_class in enumerate(result['equivalence_classes'], 1):
                attrs = sorted(list(eq_class))
                print(f"- Class {i}: {{{', '.join(attrs)}}}")
        else:
            print("- None")
        print()

        # Hypergraph
        print("**Hypergraph:**")
        print(f"- Nodes (tables): {{{', '.join(sorted(result['hypergraph']['nodes']))}}}")
        if result['hypergraph']['hyperedges']:
            print("- Hyperedges:")
            for i, edge in enumerate(result['hypergraph']['hyperedges'], 1):
                tables = sorted(list(edge['tables']))
                attrs = sorted(list(edge['attributes']))
                print(f"  - Edge {i}: Tables {{{', '.join(tables)}}} via attributes {{{', '.join(attrs)}}}")
        else:
            print("- Hyperedges: None")
        print()
        print("---")
        print()

if __name__ == "__main__":
    main()