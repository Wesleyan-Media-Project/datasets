library(data.table)
library(dplyr)
library(tidyr)
library(stringr)

df <- fread("old_person_files/person_2022_cd012523.csv", data.table = F)
max_wmpid <- max(as.numeric(str_remove(df$wmpid, "WMPID")))
n_rows <- nrow(df)
person_categories <- c("supcourt_2022", "supcourt_former", "currsen_2022", "prompol", "former_uspres", "intl_leaders", "gov2022_gencd")

# ----
# 2022-02-09
# Add incumbent governors not up for reelection
new_persons <- fread("../../face_url_scraper_2022/incumbent_governor_2022.csv", data.table = F)
new_persons$first_name <- str_extract(new_persons$full_name, "^([\\w]+)")
new_persons$last_name <- str_extract(new_persons$full_name, "([\\w]+)$")
# Fix James Justice
new_persons$last_name[new_persons$full_name == "James C. Justice, II"] <- "Justice"
new_persons <- select(new_persons, c(full_name, first_name, last_name))
# Add to persons file
df <- bind_rows(df, new_persons)
# Add WMPIDs
df$wmpid[(n_rows+1):nrow(df)] <- paste0("WMPID", (max_wmpid+1):(max_wmpid+nrow(new_persons)))
# Set their person_category variables to 0
df[(n_rows+1):nrow(df), person_categories] <- 0
# Add a new incumbent governor person variable that's 0 except for them
df <- mutate(df, .after = gov2022_gencd, gov2022_noelect = 0)
df$gov2022_noelect[(n_rows+1):nrow(df)] <- 1

# Save
fwrite(df, "person_2022.csv")

# ----
# 2023-04-17

df <- fread("person_2022.csv")

# Fixes
df$full_name[df$wmpid == "WMPID1859"] <- "Aaron David Trevino"
df$name_fec[df$wmpid == "WMPID1859"] <- "TREVINO, AARON DAVID"
df$last_name[df$wmpid == "WMPID1859"] <- "Trevino"

df$name_fec[df$wmpid == "WMPID4836"] <- "SOBOCINSKI, GREGORY"

df$name_fec[df$wmpid == "WMPID3063"] <- "WALLACE, DAVID D. II"

df$name_fec[df$wmpid == "WMPID21"] <- "CARL, JERRY LEE JR"

df$name_fec[df$wmpid == "WMPID5112"] <- "CRAVENS, MAURICE RANDALL, II"

# Save
fwrite(df, "person_2022.csv")
