library(dplyr)
library(ggplot2)

battles <- read.csv('battles.csv')


# Print summary statistics for battles dataset.
summary(battles)

# Convert to data frame and remove rows that do not have data for attacker or defender size or outcome.
battles_df = as.data.frame(battles)

battles_cleaned <- battles_df[(!is.na(battles_df$attacker_size) & !is.na(battles_df$defender_size) & !is.na(battles_df$attacker_outcome)), ]


# Add column and calculate ratio for difference in attacker and defender sizes.
for (row in battles_cleaned){
  battles_cleaned$army_ratio <- battles_cleaned$attacker_size / battles_cleaned$defender_size
}

# Add column for binary variable indicating whether attacker size was greater than or equal to defender.
battles_cleaned$comp[which(battles_cleaned$attacker_size >= battles_cleaned$defender_size)] <- 1
battles_cleaned$comp[which(battles_cleaned$attacker_size < battles_cleaned$defender_size)] <- 0


# Change Binary Attacker Outcome to 1 or 0.
battles_cleaned$attacker_outcome[which(battles_cleaned$attacker_outcome == "win")] <- 1
battles_cleaned$attacker_outcome[which(battles_cleaned$attacker_outcome == "loss")] <- 0
battles_cleaned$attacker_outcome <- as.numeric(battles_cleaned$attacker_outcome)

print(head(battles_cleaned))

# Run logistic regression to find log odds of attacker win based on whether attacker size is greater than defender size.
battles_glm1 <- glm(battles_cleaned$attacker_outcome ~ battles_cleaned$comp, data = battles_cleaned, family = binomial())

summary(battles_glm1)

# Run logistic regression to find log odds of attacker win based on ratio of attacker size to defender size.

battles_glm1 <- glm(battles_cleaned$attacker_outcome ~ battles_cleaned$army_ratio, data = battles_cleaned, family = binomial())

summary(battles_glm1)

# Plot regression.
ggplot(battles_cleaned, aes(x=army_ratio, y= attacker_outcome)) + geom_point() +
  stat_smooth(method="glm", color="green", se=FALSE, 
              method.args = list(family=binomial))

# Try regression again with outlier removed.
battles_outlier_removed <- battles_cleaned[which(battles_cleaned$name != "Battle of Castle Black"),]

# Run logistic regression to find log odds of attacker win based on ratio of attacker size to defender size with outlier removed.

battlesnew_glm1 <- glm(battles_outlier_removed$attacker_outcome ~ battles_outlier_removed$army_ratio, data = battles_outlier_removed, family = binomial())

summary(battlesnew_glm1)

# Plot regression with outlier removed.
ggplot(battles_outlier_removed, aes(x=army_ratio, y= attacker_outcome)) + geom_point() +
  stat_smooth(method="glm", color="green", se=FALSE, 
              method.args = list(family=binomial))


