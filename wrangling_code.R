library(tidyr)
library(dplyr)

pol_rural <- read.csv("sp_rur_totl_zs.csv", header=T, check.names = FALSE)
pol_urban <- read.csv("sp_urb_totl_in_zs.csv", header=T, check.names = FALSE)
san_rural <- read.csv("at_least_basic_sanitation_rural_access_percent.csv", header=T, check.names = FALSE)
san_urban <- read.csv("at_least_basic_sanitation_urban_access_percent.csv", header=T, check.names = FALSE)

for (i in 1:ncol(pol_rural)) {
  pol_rural[,i] <- as.character( pol_rural[,i])
}
for (i in 1:ncol(pol_urban)) {
  pol_urban[,i] <- as.character( pol_urban[,i])
}
for (i in 1:ncol(san_rural)) {
  san_rural[,i] <- as.character( san_rural[,i])
}
for (i in 1:ncol(san_urban)) {
  san_urban[,i] <- as.character( san_urban[,i])
}

data_tidy <- bind_rows("pol_rural" = pol_rural,  "pol_urban"=pol_urban,"san_rural"=san_rural,"san_urban"=san_urban,.id= "id")

data_tidy <- gather(data_tidy, "year", "value", 3:ncol(data_tidy))

data_tidy <- spread(data_tidy, id, value)

data_tidy <- na.omit(data_tidy)

data_tidy1 <- filter(data_tidy, country == "Armenia"|country == "China")


