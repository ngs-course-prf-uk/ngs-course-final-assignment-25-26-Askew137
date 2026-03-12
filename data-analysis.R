library(tidyverse)

# Load data
setwd("~/final")
d <- read_tsv('data/qual_af.tsv', col_names = c('QUAL', 'AF'))

# Graph
p_scatter <- ggplot(d, aes(x = AF, y = QUAL)) +
  geom_point(alpha = 0.05, size = 0.3, color = "midnightblue") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  scale_y_log10() +
  labs(title = "Scatterplot: PHRED Quality vs Allele Frequency",
       x = "Allele Frequency (AF)",
       y = "PHRED Quality (log10 scale)") +
  theme_minimal()

print(p_scatter)

ggsave("plots/qual_af_scatter.png", p_scatter)
