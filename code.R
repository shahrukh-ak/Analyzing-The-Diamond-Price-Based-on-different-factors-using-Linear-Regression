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