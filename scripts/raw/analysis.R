library(ggplot2)
library(gridExtra)

# Reading in data

data(mtcars)

analysis <- mtcars

analysis$am <- as.factor(analysis$am)

# am is the predictor, mpg the outcome
# for am, 0 = automatic, 1 = manual
p <- ggplot(analysis) + geom_boxplot(aes(x=am,y=mpg))
p

# looking for patterns in other variables
pairs(mtcars)

# wt, cyl, hp, disp, carb ?

p.wt <- ggplot(analysis) + geom_point(aes(x=wt,y=mpg)) + facet_grid(.~am) +
  ggtitle("Miles/gallon by weight")
p.wt

p.cyl <- ggplot(analysis) + geom_point(aes(x=cyl,y=mpg)) + facet_grid(.~am) +
  ggtitle("Miles/gallon by No. of Cylinders")
p.cyl

p.hp <- ggplot(analysis) + geom_point(aes(x=hp,y=mpg)) + facet_grid(.~am) +
  ggtitle("Miles/gallon by Horsepower")
p.hp

p.disp <- ggplot(analysis) + geom_point(aes(x=disp,y=mpg)) + facet_grid(.~am) +
  ggtitle("Miles/gallon by Displacement")
p.disp

p.carb <- ggplot(analysis) + geom_point(aes(x=carb,y=mpg)) + facet_grid(.~am) +
  ggtitle("Miles/gallon by No. of Carburetors")
p.carb

grid.arrange(p.wt,p.cyl,p.hp, p.disp,p.carb,ncol=3,nrow=2)
