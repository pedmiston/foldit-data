library(devtools)
library(dplyr)

con <- connect_to_db()

solutions <- tbl(con, "solution") %>%
  rename(solution_id = id) %>%
  left_join(tbl(con, "player_solutions")) %>%
  collect()

players <- tbl(con, "player") %>%
  rename(player_id = id) %>%
  left_join(tbl(con, "team")) %>%
  collect() %>%
  mutate(team_type = ifelse(grepl("no group", team_name), "soloist", "evolver"))

Solutions <- left_join(solutions, players)

use_data(Solutions, overwrite = TRUE)
