library(devtools)
library(dplyr)

con <- connect_to_db()

solutions <- tbl(con, "solution") %>%
  rename(solution_id = id) %>%
  left_join(tbl(con, "association"))

players <- tbl(con, "player") %>%
  rename(player_id = id) %>%
  left_join(tbl(con, "team"))

Solutions <- left_join(solutions, players) %>%
  collect()

use_data(Solutions, overwrite = TRUE)
