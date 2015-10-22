source("scripts/raw/analysis.R")

y <- mtcars$mpg
x1 <- mtcars$am
x2 <- mtcars$cyl
x3 <- mtcars$hp
x4 <- mtcars$disp
x5 <- mtcars$carb
x6 <- mtcars$wt

fit.hp <- lm(y ~ x3)
fit.disp <- lm(y ~ x4)
fit.wt <- lm(y ~ x6)

# Residual analysis for horsepower
plot(x=x3,y=fit.hp$residuals)
hist(x=fit.hp$residuals)

d.hp <- density(fit.hp$residuals)
plot(d.hp)

# Residual analysis for weight
plot(x=x6,y=fit.wt$residuals)
hist(x=fit.wt$residuals)
d.wt <- density(fit.wt$residuals)
# skewed right
plot(d.wt)

# Residual analysis for displacement
plot(x=x4,y=fit.disp$residuals)
hist(x=fit.disp$residuals)
d.disp <- density(fit.disp$residuals)
# skewed right
plot(d.disp)

# test mean = median = mode on disp residuals

mean.disp <- mean(fit.disp$residuals)
median.disp <- median(fit.disp$residuals)
table_data <- table(signif(fit.disp$residuals,1))
samplemode <- subset(table_data, table_data==max(table_data))
samplemode <- as.numeric(names(samplemode))

# testing assumption of strong correlation between disp and wt, hp
# disp v wt
plot(x=x4,y=x6)
cor(x4,x6)
disp.wt <- lm(x4 ~ x6)
plot(x=x4,y=disp.wt$residuals)
hist(disp.wt$residuals)

# disp v hp
plot(x=x4,y=x3)
cor(x4,x3)
disp.hp <- lm(x4 ~ x3)
plot(x=x4,y=disp.hp$residuals)
hist(disp.hp$residuals)
