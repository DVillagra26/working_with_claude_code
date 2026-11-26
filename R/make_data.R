# Generate a made-up fish dataset (1000 observations)
# Run from the project root:  Rscript R/make_data.R
# Overwrites data/fish_lengths.csv

set.seed(42)  # same "random" data every time the script is run
n <- 1000

# Per species: mean length (cm), spread of length (sd), and a weight factor
species_info <- data.frame(
  species  = c("European Seabass", "Atlantic Cod", "Common Sole"),
  mean_len = c(42, 50, 30),
  sd_len   = c(5, 6, 3),
  a        = c(0.0132, 0.0109, 0.0098)  # weight = a * length^3
)

# Pick a species, location and sampling date for each fish
species  <- sample(species_info$species, n, replace = TRUE, prob = c(0.45, 0.25, 0.30))
location <- sample(c("Nieuwpoort", "Oostende", "Zeebrugge"), n, replace = TRUE)
dates    <- seq(as.Date("2025-03-01"), as.Date("2025-10-31"), by = "day")
date     <- sort(sample(dates, n, replace = TRUE))

# Look up each fish's species parameters
info <- species_info[match(species, species_info$species), ]

# Length: normal around the species mean; weight: length-weight relation plus noise
length_cm <- round(rnorm(n, info$mean_len, info$sd_len))
weight_g  <- round(info$a * length_cm^3 * exp(rnorm(n, 0, 0.08)))

fish <- data.frame(date, species, length_cm, weight_g, location)
write.csv(fish, "data/fish_lengths.csv", row.names = FALSE, quote = FALSE)

cat("Wrote", nrow(fish), "rows to data/fish_lengths.csv\n")
