install.packages("pacman")
 require(pacman)
library(pacman)

pacman::p_load(pacman , dpyr , GGally , ggplot2 , ggthemes , ggvis , httr , lubridate , plotly , rio , rmarkdown , shiny , stringr , tidyr)
library(datasets)
head(iris)

plot(iris$Species)
plot(iris$Petal.Length)
plot(iris$Species, iris$Petal.Width)
plot(iris$Petal.Length , iris$Petal.Width)
  plot(iris)
  
  
  #Plotting with options
  
plot(iris$Petal.Length, iris$Petal.Width,
  
    col= "#008cf0" , #for color
    pch = 19, # for circle points
    main = "Iris : Petal Length Vs Petal Width",
    xlab = "Petal Length",
    ylab = "Petal Width") 


#Plotting Formulas
plot(exp, 2 , 5)
plot(dnorm, -2 , +5)
plot(dnorm, -5 , +5 ,
     col = "#cc0000",
     lwd = 5,
     main = "Standard Normal Distribution",
     xlab = "z index",
     ylab = "Density")
