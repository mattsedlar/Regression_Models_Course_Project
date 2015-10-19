source("scripts/raw/analysis.R")

y <- mtcars$mpg
x1 <- mtcars$am
x2 <- mtcars$cyl
x3 <- mtcars$hp
x4 <- mtcars$disp
x5 <- mtcars$carb
x6 <- mtcars$wt

fit <- lm(y ~ as.factor(x1) + as.factor(x2) + x3 + x4 + as.factor(x5) + x6)

# Multiple R-squared 0.8777 means 88% of the variation in mpg can be explained by
# variation in the independent X variables

# Residual analysis

plot(x=predict(fit),y=fit$residuals)
# transmission type
plot(x=x1,y=fit$residuals)
# cylinders
plot(x=x2,y=fit$residuals)
# horsepower
plot(x=x3,y=fit$residuals)
# displacement
plot(x=x4,y=fit$residuals)
# carburetors
plot(x=x5,y=fit$residuals)
# weight
plot(x=x6,y=fit$residuals)

# checking normality
hist(x=fit$residuals)

# T TEST
# critical value on df 20 with 95% sig. is 2.0860


