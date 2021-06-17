library (datasets)
library(ggplot2)
head(midwest)

#hk<- ggplot(midwest,aes(x=area, y=poptotal))+geom_point(col="steelblue",size=3)+ 
# geom_smooth(method="lm" , col="firebrick" , size = 3)+
#coord_cartesian(xlim=c(0,0.1), ylim=c(0,250000))+
#labs(title="Area VS POp", subtitle ="From Midwest Dataset" , y="Population", x="Area", caption = "Midwest Demographics")+
#scale_color_brewer(palette = "Set1")
#scale_x_continuous(breaks=seq(0,0.1,0.01) , labels  = letters[1:11])

#hk+scale_y_reverse()


gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

# Reverse X Axis Scale
#gg + scale_x_reverse()
#theme_set(theme_classic())
#gg + theme_bw() + labs(subtitle="BW Theme")
#gg + theme_classic() + labs(subtitle="Classic Theme")

gg+ theme(plot.title = element_text(size=16, face = "bold" , color = "tomato" , hjust = 0.5 , lineheight= 1.2) , 
          plot.subtitle = element_text(size = 18 , face="bold"),
          plot.caption = element_text(size = 10),
          axis.title = element_text(size = 12),
          axis.title.x = element_text(angle=180),
          axis.title.y = element_text(angle=180)
)





#Method
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

gg+labs(color ="State" , size = "Density")


installed.packages(ggalt)
library(ggalt)
library (datasets)
library(ggplot2)
library(ggalt)
head(midwest)
midwest_select<- midwest[midwest$poptotal > 350000 
                         & midwest$poptotal <= 500000 
                         & midwest$area > 0.01 
                         & midwest$area< 0.1]



options(scipen = 999)
library(ggplot2)
library(ggalt)
midwest_select <- midwest[midwest$poptotal > 350000 & 
                            midwest$poptotal <= 500000 & 
                            midwest$area > 0.01 & 
                            midwest$area < 0.1, ]

# Plot
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) +   # draw points
  geom_smooth(method="loess", se=F) + 
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000)) +   # draw smoothing line
  geom_encircle(aes(x=area, y=poptotal), 
                data=midwest_select, 
                color="red", 
                size=2, 
                expand=0.08) +   # encircle
  labs(subtitle="Area Vs Population", 
       y="Population", 
       x="Area", 
       title="Scatterplot + Encircle", 
       caption="Source: midwest")