# Is an Automatic or Manual Transmission Better for Miles per Gallon?
Matthew Sedlar  
October 19, 2015  

## Executive Summary

## Exploratory Analysis

I started by looking at simple box plot of miles per gallon by automatic and manual transmission types. As figure 1 shows, the interquartile range for automatic transmissions is below the interquartile range of manual transmissions. There certainly appears to be a relationship between better mpg and manual transmissions.

#### Figure 1

<img src="Report_files/figure-html/unnamed-chunk-1-1.png" title="" alt="" style="display: block; margin: auto;" />

While the difference between the average mpg for the transmission types is statistically significant (see Appendix A), a simple categorical variable cannot fully explain _why_ there is a difference. We have to explore other variables that can help explain why.

There are several candidates to choose from, including weight, number of cylinders, horsepower, displacement, and number of carburetors (see Appendix B). Several of these variables have something in common: the size and power of the engine. 

## Fitting a Model

Displacement is [defined](http://askcars.com/2008/07/what-does-engin.html) as the volume of an engine's cylinders, generally an indicator of the engine's size and power. The displacement variable not only covaries with the weight of a car (0.8879799), but also shares a correlation with the number of cylinders (0.9020329) and horsepower (0.7909486). For this reason I chose to fit a model using displacement to explain the advantage manual cars appear to have over automatic transmissions.

A residual analysis (see Appendix C) shows that the model fit is an appropriate model and the equal variability and normality assumptions have not been violated. 

As the coefficients below show, each decrease in miles per gallon is accompanied by an increase in displacement, 0.02758360 cubic inches and 0.031455482 cubic inches for automatic and manual transmissions respectively.


```
##           (Intercept)                  disp      factor(am)manual 
##           25.15706407           -0.02758360            7.70907298 
## disp:factor(am)manual 
##           -0.03145482
```

This is illustrated in Figure 2, which also shows that very few cars with manual transmissions exist beyond the average displacement and the two that do have leverage on the regression line (see Appendix D).

#### Figure 2

<img src="Report_files/figure-html/unnamed-chunk-3-1.png" title="" alt="" style="display: block; margin: auto;" />

## Conclusion

The model I picked infers that manual transmissions have better miles per gallon because of the relationship between gas usage and the size and power of the engine. As the displacement (in cubic inches) increases, the efficiency drops for both transmission types. Essentially, big cars have larger engines and generally have worse mpg.

My outcomes are based on the assumption that larger displacement equals a bigger car. You would assume a small car modified with a large engine would be an outlier. A greater sample size would help in testing this theory.

\pagebreak

# Appendix

### A: Automatic vs. Manual Hypothesis Testing

$$H_0: \bar{X} = \bar{Y}$$
$$H_1: \bar{X} \neq \bar{Y}$$


```
## 
## 	Welch Two Sample t-test
## 
## data:  transa$mpg and transm$mpg
## t = -3.7671, df = 18.332, p-value = 0.001374
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -11.280194  -3.209684
## sample estimates:
## mean of x mean of y 
##  17.14737  24.39231
```

### B: Independent Variables by MPG, Faceted by Transmission Type

![](Report_files/figure-html/unnamed-chunk-5-1.png) 

### C: Residual Analysis

Figure C1 shows the fitted values of the model plotted against the residuals and finds no apparent relationship or pattern between the two. The residuals appear to be evenly spread above and below 0.  

#### Figure C1
<img src="Report_files/figure-html/unnamed-chunk-6-1.png" title="" alt="" style="display: block; margin: auto;" />

Figure C2 shows the distribution of residuals to be approximately normal; however, the small sample size should be noted. 

#### Figure C2
<img src="Report_files/figure-html/unnamed-chunk-7-1.png" title="" alt="" style="display: block; margin: auto;" />

### D: Leverage

Two cars in the manual transmission group, the Maserati Bora and Ford Pantera L, exert a significant amount of leverage on the regression line. As the hat values below show, both are considerable outliers.


---------------  -----
Mazda RX4         0.08
Mazda RX4 Wag     0.08
Datsun 710        0.09
Fiat 128          0.12
Honda Civic       0.13
Toyota Corolla    0.13
Fiat X1-9         0.12
Porsche 914-2     0.08
Lotus Europa      0.10
Ford Pantera L    0.55
Ferrari Dino      0.08
Maserati Bora     0.35
Volvo 142E        0.08
---------------  -----

By removing the two, and resetting the regression model, the coefficients now show each decrease in miles per gallon is accompanied by an increase in displacement by 0.1352438 cubic inches (as illustrated in Figure D1).

<img src="Report_files/figure-html/unnamed-chunk-9-1.png" title="" alt="" style="display: block; margin: auto;" />