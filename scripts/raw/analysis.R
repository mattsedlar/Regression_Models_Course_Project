library(ggplot2)

# Reading in data

data(mtcars)

# am is the predictor, mpg the outcome
# for am, 0 = automatic, 1 = manual
p <- ggplot(mtcars) + geom_point(aes(x=am,y=mpg), color="purple", alpha="0.5")
p
