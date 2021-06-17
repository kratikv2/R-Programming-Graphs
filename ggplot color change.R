g <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point() + 
  geom_smooth(method="lm")  # set se=FALSE to turnoff confidence bands

# Zoom in without deleting the points outside the limits. 
# As a result, the line of best fit is the same as the original plot.
g1 <- g + 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))  # zooms in
plot(g1)


ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(col="steelblue", size=3) +   # Set static color and size for points
  geom_smooth(method="lm", col="green") +  # change the color of line
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")





gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
plot(gg)
gg + theme(legend.position="None")  # remove legend
