# GoT_Battles
Analyze predictors of battle success

Goal: Analyze relative army size as a predictor of attacker success in battles featured in Game of Thrones.

Data Source: data.world. Link: https://data.world/data-society/game-of-thrones

What the code does:
- Reads in, converts to data frame, and cleans Battles dataset.
- Manipulates data by calculating ratio of attacker and defender sizes, creating binary variable indicating whether attacker size was greater than or equal to defender, and converting binary variables to 1 or 0.
- Performs logistic regressions using "attacker win" as the dependent variable.
- Plots regressions.

Results:

The below logistic regression uses a binary varible "battles_cleaned$comp" to indicate whether the attacking army was comparatively larger than the defending army. A negative relationship was found between this variable and log odds of an attacker win. However, it was not statistically significant.

![image](https://github.com/CompassRose1/GoT_Battles/assets/63609420/8ef0813f-3216-446c-a967-0ab192a63674)
