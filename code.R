#Testing whether price is dependent on the colour

D=subset(data,colour=="D")
I=subset(data,colour=="I")
t.test(D$price,I$price)

Welch Two Sample t-test
data: D$price and I$price
t = 1.2982, df = 18.704, p-value = 0.21
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
  -1181.727 5031.427
sample estimates:
  mean of x mean of y
7099.875 5175.025

# From above test, the p value is higher than 0.05 so we failed to reject the null hypothesis and conclude that we don't have enough evidence to tell that price is dependent on colour.

# Testing whether price is dependent on the clarity using high and low clarity levels.

IF=subset(data,clarity=="IF")
VS2=subset(data,clarity=="VS2")
t.test(IF$price,alt="greater",VS2$price)

Welch Two Sample t-test
data: IF$price and VS2$price
t = -5.1172, df = 92.098, p-value = 1
alternative hypothesis: true difference in means is greater than 0
95 percent confidence interval:
  -4190.556 Inf
sample estimates:
  mean of x mean of y
2694.773 5858.170 

# From above test, the p value is higher than 0.05 so we failed to reject the null hypothesis and conclude that we don't have enough evidence to tell that price is dependent on clarity.


# We will test whether the average price is 6000.

t.test(price,alt="greater",mu=6000)

One Sample t-test
data: price
t = -5.0565, df = 307, p-value = 1
alternative hypothesis: true mean is greater than 6000
95 percent confidence interval:
  4699.564 Inf
sample estimates:
  mean of x
5019.484

# From above test, since p value is greater than 0.05 so we fail to reject the null hypothesis and we conclude that we don't have enough evidence to say that average price is greater than 6000.

# Constructing the 95% confidence interval for the price.

t.test(price,conf.level=0.95)

One Sample t-test
data: price
t = 25.886, df = 307, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
  4637.922 5401.046
sample estimates:
  mean of x
5019.484

# From above test, the 95% confidence interval is (4637.922, 5401.046).

# Model Building

model=lm(price~carat+factor(colour)+factor(clarity)+factor(certification))

summary(model)

anova(model)

summary(model)$r.squared
[1] 0.9581281

# From the summary of the model we got R square values as:

R-squared: 0.9581, and Adjusted R-squared: 0.9564.

# We build the Anova of the model and we conclude that certification is not a significant variable.

stepAIC = stepAIC(model,direction="both")

# Insignificant variable is found to be Certification

# Model improvement

model=lm(price~carat+factor(colour)+factor(clarity))

summary(model)

# The R square value is same as previous model R square value (Rsquared: 0.958, and Adjusted Rsquared: 0.9565). So we have to find better model.

# The residual plot has structured pattern that the data do not follow the underlying assumptions of the model.

# To improve the model we are using Box - Cox transformation

b=boxcox(model)

# From Box - Cox transformation, It appears that lambda should be approximately 0.5.

# Model Improvement

new_price=price^0.5

model3=lm(new_price ~ carat + factor(colour) + factor(clarity))

summary(model3)

# The R squared value has now increased to 0.9907 (R-squared: 0.9907, Adjusted R-squared: 0.9904) from (R-squared: 0.958, and Adjusted Rsquared: 0.9565).

# We can observe that the residual plots after the transformation is structure less and the coefficient of determination after the transformation is increased compared to before the transformation.
# Thus we can conclude that transformation helped to improve our model.

# We are predicting the price of a diamond by using carat = 0.75, colour = I and clarity = VS1.

predict(model3,data.frame(carat=0.75,colour="I",clarity="VS1"),type="resp")

1
67.45631

predict(model3,data.frame(carat=0.75,colour="I",clarity="VS1"),type="resp",interval="pred",level=0.95)
    fit       lwr     upr
1 67.45631 62.60827 72.30435

predict(model3,data.frame(carat=0.75,colour="I",clarity="VS1"),type="resp",interval="conf",level=0.95)
     fit      lwr     upr
1 67.45631 66.54805 68.36457

# The predicted diamond value is equal to (67.45631)^2 = 4550, the original diamond value in our data set is 4335.

# So our model is predicting approximately the real diamond value.



