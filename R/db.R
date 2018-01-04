connect_to_db <- function() {
  DBI::dbConnect(RMySQL::MySQL(),
                 host = "192.241.128.175",
                 port = 3306,
                 user = "foldit",
                 password = Sys.getenv("MYSQL_FOLDIT_PASSWORD"),
                 dbname = "Foldit")
}
