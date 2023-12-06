library(data.table)
library(dplyr)
library(tidyr)
library(stringr)

# Files
# In
path_cands <- "wmpcand_101422_wmpid.csv"
# Out
path_out <- "opponents_2022.csv"

# Load
df <- fread(path_cands, encoding = "UTF-8")
df <- df %>% 
  filter(genelect_cd == 1) %>%
  select(wmpid, full_name, cand_office, cand_office_st, cand_office_dist)

# Senate cand_office_dist is not reliable
# Just set it 0 for all and then manually adjust Oklahoma
df$cand_office_dist[df$cand_office == "S"] <- as.integer(0)
df$cand_office_dist[df$wmpid %in% c("WMPID834", "WMPID1214", "WMPID1518", "WMPID5129")] <- as.integer(1)

# Determine opponents based on shared office
df$office <- paste(df$cand_office, df$cand_office_st, df$cand_office_dist, sep = "_")
df2 <- aggregate(list(df$wmpid, df$full_name), by = list(df$office), c)
names(df2) <- c("office", "opponents", "opponent_names")
df <- left_join(df, df2, by = "office")
for(i in 1:nrow(df)){
  df$opponents[[i]] <- df$opponents[[i]][!df$opponents[[i]] %in% df$wmpid[i]]
  df$opponent_names[[i]] <- df$opponent_names[[i]][!df$opponent_names[[i]] %in% df$cand_name[i]]
}

df <- df %>% select(wmpid, full_name, opponents, opponent_names)
fwrite(df, path_out)
