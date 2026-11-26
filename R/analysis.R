# Simple example analysis: summarise fish lengths per species
# Run from the project root:  Rscript R/analysis.R

fish <- read.csv("data/fish_lengths.csv")

# Mean length and weight per species
summary_tbl <- aggregate(cbind(length_cm, weight_g) ~ species, data = fish, FUN = mean)
print(summary_tbl)

write.csv(summary_tbl, "output/summary_by_species.csv", row.names = FALSE)

# Boxplot of lengths per species
png("output/length_by_species.png", width = 800, height = 500)
boxplot(length_cm ~ species, data = fish,
        main = "Fish length by species", ylab = "Length (cm)", xlab = "")
dev.off()
