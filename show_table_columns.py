from pyspark.sql import SparkSession

def show_all_table_columns():
    spark = SparkSession.builder \
        .appName("ShowTableColumns") \
        .getOrCreate()

    # Get all databases
    databases = spark.sql("SHOW DATABASES").collect()

    for db_row in databases:
        database_name = db_row['namespace']
        print(f"\n=== Database: {database_name} ===")

        # Get all tables in the database
        tables = spark.sql(f"SHOW TABLES IN {database_name}").collect()

        for table_row in tables:
            table_name = table_row['tableName']
            full_table_name = f"{database_name}.{table_name}"

            print(f"\nTable: {full_table_name}")
            print("-" * 50)

            try:
                # Get column information
                columns = spark.sql(f"DESCRIBE TABLE {full_table_name}").collect()

                for col in columns:
                    col_name = col['col_name']
                    data_type = col['data_type']
                    comment = col['comment'] if col['comment'] else ''
                    print(f"  {col_name:<30} {data_type:<20} {comment}")

            except Exception as e:
                print(f"  Error describing table: {e}")

    spark.stop()

if __name__ == "__main__":
    show_all_table_columns()