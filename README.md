# Analyzing-The-Diamond-Price-Based-on-different-factors-using-Linear-Regression
The model predicts the price of the diamonds. Used linear regression and did several T-test to
conclude which factor affecting the price of the diamonds the most.
## Objective 
<p>The objective of our project is to analyze and model the price of the diamond based on carat, colour,
clarity and certification.</p>

## Data Sources
<ul>
  <li>Pricing the C’s of Diamond Stones –</li>
  (https://vincentarelbundock.github.io/Rdatasets/datasets.html)
  <li> Journal of Statistics Education's data archive</li>
  http://www.amstat.org/publications/jse/jse_data_archive.htm.
  <li> Chu, Singfat (2001) “Pricing the C's of Diamond Stones”, Journal of Statistics Education, 9(2).</li>
</ul>
<p>This data set consists of weight of diamond stones in carat unit, a factor with levels and
  certification body.</p>

## Attributes
It contains 5 variables with 4 regressor and 1 response.
<table>
  <tr>
    <th>Regressor Variable</th>
    <th>Response Variable</th>
  </tr>
  <tr>
    <td>Carat (Carat Unit)</td>
    <td>Price ($)</td>
  </tr>
  <tr>
    <td>Color (D,E,F,G,H,I)</td>
  </tr>
  <tr>
    <td>Clarity (IF,VVS1,VVS2,VS1,VS2)</td>
  </tr>
  <tr>
    <td>Certification (GIA,IGI,HRD)</td>
  </tr>
</table>

## Model Analysis

<p>
We are using the model to predict the price depending on the colour, clarity, certification and carat. Here we are using multiple linear regression model. Because we have multiple variables and price is a continiuos variable. We build the Anova of the model and we conclude that certification is not a significant
variable.
</p>

## Model Improvement

<p>
We ran stepAIC for our model to check for the insignificant variable. Insignificant variable is found to be Certification. <br>
The model is improved by making several residual plots and box cox transformation.
</p>

## Prediction of data using model
<p>
We predicted the price of a diamond by using carat = 0.75, colour = I and clarity = VS1. The predicted diamond value is equal to (67.45631)^2 = 4550, the original diamond value in our data set is 4335. So our model is predicting approximately the real diamond value. </p>

## Conclusion
<p>
In this project, we analyzed and modeled the price of a diamond based on carat, colour, clarity and certification.
Also we did the several T test to conclude which factor effecting the price of the diamond.
Using our model, we determined the price of diamond.
</p>




