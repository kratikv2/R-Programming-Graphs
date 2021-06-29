library(leaflet)
library(magrittr)
map <- leaflet() %>%
  addTiles() %>%
  setView(75.8577,22.7196,zoom = 13)%>%
  addMarkers(75.8577,22.7196,popup = "Indore")
map


library(readr)
college <- read.csv("indore-colleges.csv")
head(college)
map <- leaflet(college) %>% addProviderTiles(providers$CartoDB.DarkMatter) %>% 
  setView(75.8577,22.7196, zoom = 7) %>% 
  addMarkers(~Longitude, ~Latitude, popup=college$type, weight = 3, radius=40, 
             color="#ffa500", stroke = TRUE, fillOpacity = 0.8) 

map <- leaflet(college) %>% addProviderTiles(providers$CartoDB.DarkMatter) %>% 
  setView(75.8577,22.7196, zoom = 7) %>% 
  addMarkers(~Longitude, ~Latitude, popup=~College_name) 
map


library(osrm)

route = osrmRoute(c(75.7885,23.1765), c(75.8577,22.7196), overview = 'full')
# route_simple = osrmRoute(c(75.7885,23.1765), c(75.8577,22.7196), overview = 'simplified')
route_summary = osrmRoute(c(75.7885,23.1765), c(75.8577,22.7196), overview = FALSE)

leaflet() %>% addTiles() %>% 
  addMarkers(c(75.7885,75.8577), c(23.1765,22.7196)) %>% 
  addPolylines(route$lon,route$lat, 
               label = paste(round(route_summary[1]/60), 'hr - ', round(route_summary[2]), 'km'), 
               labelOptions = labelOptions(noHide = TRUE))

leaflet() %>% addTiles() %>% 
  addMarkers(c(75.7885,75.8577), c(23.1765,22.7196)) %>% 
  addPolylines(route$lon,route$lat, 
               popup = paste(round(route_summary[1]/60), 'hr', br(), round(route_summary[2]), 'km'))