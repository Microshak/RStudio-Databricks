library(RJDBC)
library(DBI)
library(rJava)
options(java.parameters = "-Xmx16g")

driver <- JDBC("com.databricks.client.jdbc.Driver","/app/DatabricksJDBC42.jar")
               
conn = RJDBC::dbConnect(
 driver,
 glue::glue(
   "jdbc:databricks://<url>:443/default;transportMode=http;ssl=1;AuthMech=3;httpPath=<httpPath>;PWD=<token>;UID=token"
 )
)

dbGetQuery(conn, "SELECT * from myTable limit 1")
