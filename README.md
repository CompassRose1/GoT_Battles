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

The below logistic regression analyzes a binary varible "battles_cleaned$comp" to indicate whether the attacking army was comparatively larger than the defending army. A negative relationship was found between this variable and log odds of an attacker win. However, it was not statistically significant.

![image](https://github.com/CompassRose1/GoT_Battles/assets/63609420/8ef0813f-3216-446c-a967-0ab192a63674)


The below logistic regression analyzes the continuous varible "battles_cleaned$army_ratio" indicating the ratio of the size of the attacking army versus the defending army. A negative relationship was found between this variable and log odds of an attacker win. However, it was not statistically significant either.

![image](https://github.com/CompassRose1/GoT_Battles/assets/63609420/1fb36268-e44a-4a9c-8d66-558208454db0)

This regression is plotted below:

![image](https://github.com/CompassRose1/GoT_Battles/assets/63609420/475bdf85-80e4-422e-8478-c010e208f34c)

Analysis of this dataset suggested the data is skewed by a single battle, the "Battle of Castle Black," in which the attacking army of Mance Rayder laid seige to Castle Black unsuccessfully. I decided to evaluate this data without the outlier.

After removing the outlier,  I received these results:

![image](https://github.com/CompassRose1/GoT_Battles/assets/63609420/33256014-b11b-4dbf-96a0-693bcbce7e31)

Without the outlier, the logistic regression shows a positive relationship between the attacker size ratio and a predicted attacker win, which makes more intuitive sense. However, the results are still not significant.

Regression with outlier removed:

![image](https://github.com/CompassRose1/GoT_Battles/assets/63609420/90a6b4f0-2717-475f-9a34-b2fb3f356d84)


Limitations: 
Analysis is limited by the small number of battles in this dataset. Additionally, 60 percent of the battles were removed during processing due to lack of sufficient data. Further analysis would benefit from George R.R. Martin completing more books with additional battles to be analysed.

Author: Cheryl Anthoney, PhD

