source("scripts/raw/analysis.R")
library(car)

# anova test
fit2 <- lm(mpg ~ disp * factor(am), data=analysis)
fit3 <- update(fit2, mpg ~ (disp + hp) * factor(am))
fit4 <- update(fit2, mpg ~ (disp + qsec + hp) * factor(am))
anova(fit2,fit3,fit4)

sqrt(vif(fit2))
sqrt(vif(fit3))
sqrt(vif(fit4))

plot(fit3)

plot(resid(lm(factor(analysis$am) ~ analysis$disp)),resid(lm(analysis$mpg ~ analysis$disp)))

# leverage
testfit <- lm(mpg ~ disp, data=transm) 
hatvalues <- round(hatvalues(testfit),2)
# remove two outliers
transm <- transm[-12,]
transm <- transm[-10,]
testfit <- lm(mpg ~ disp, data=transm) 

ggplot(transm) + geom_point(aes(x=disp,y=mpg)) +
  geom_abline(intercept=coef(testfit)[1], slope=coef(testfit)[2])
