library(datasets)
head(mtcars)

barplot(mtcars$cyl)

cylinder<- table(mtcars$cyl)
barplot(cylinder)
plot(cylinder)


head(iris)
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)
hist(iris$Petal.Width)
