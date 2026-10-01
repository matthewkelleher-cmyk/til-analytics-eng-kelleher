import duckdb

con = duckdb.connect("exercises.db")
con.execute(open("sql_code.sql").read())
print(con.sql("select * from merge_target"))