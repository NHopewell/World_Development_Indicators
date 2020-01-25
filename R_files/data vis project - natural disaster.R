### natural disaster

#disaster.damage.data



# add na col to be filled
disaster.deaths.data <- disaster.deaths.data %>%
                        mutate(decade = NA)


# function to return decases based off of years:

get.decades <- function(year.column, new.column) {
        
        dec.1950 <- seq(1950,1959)
        dec.1960 <- seq(1960,1969)
        dec.1970 <- seq(1970,1979)
        dec.1980 <- seq(1980,1989)
        dec.1990 <- seq(1990,1999)
        dec.2000<- seq(2000,2009)
        dec.2010 <- seq(2010, 2018)
        
        if (is.element(year.column, dec.1950)) {
                new.column = "1950's"
        } else if (is.element(year.column, dec.1960)) {
                new.column = "1960's"
        } else if (is.element(year.column, dec.1970)) {
                new.column = "1970's"
        } else if (is.element(year.column, dec.1980)) {
                new.column  = "1980's"
        } else if (is.element(year.column, dec.1990)) {
                new.column  = "1990's"
        } else if (is.element(year.column, dec.2000)) {
                new.column  = "2000's"
        } else if (is.element(year.column, dec.2010)) {
                new.column  = "2010's"
        } else {
                new.column  = "1900's"
        }
        
        return (new.column)
        
}

# apply decades function
disaster.deaths.data$decade <- sapply(
                                        disaster.deaths.data$Year, disaster.deaths.data$decade, 
                                        FUN = get.decades
)

# put deaths in millions
disaster.deaths.data$Total.deaths <- disaster.deaths.data$Total.deaths /1000000

# filter and plot:
disaster.deaths.data %>%
        filter( decade != "1900's" & 
                !is.element(Entity, c("All natural disasters", "Mass movement (dry)", "Volcanic activity", "Wildfire", "Landslide"))) %>%
        ggplot(., aes(x = decade, y = Total.deaths, fill = Entity)) + 
                geom_bar(stat = "identity") +
        labs( 
                fill = 'event\n',
                x = "",
                y = "total number of deaths (in millions)\n", 
                title = "Total number of global deaths from natural disaster, by decades \n"
        ) +
       # scale_y_discrete(limits = c(0, 500, 1000, 1500, 2000), labels=c("0.5","1","1.5","2")) +
        theme_tufte() + 
        theme( 
                text = element_text(size=11,  family="Calibri (Body)"),
                plot.title = element_text(hjust = 0)
        ) +
        scale_fill_few()



# re-read overwritten data:
disaster.deaths.data <- read.csv(paste(disaster.path, paste0(disaster.sets[3], ".csv"), sep = "/"), 
                                 header = TRUE)

disaster.damage.data %>%
        filter(Entity == "All natural disasters" & Year >= 1940) %>%
        ggplot(., aes(x=Year, y=Total.economic.damage)) + 
                geom_line(size= 1, colour = "dodgerblue")+
                geom_point(size = 2, colour = "dodgerblue4" ) +
                labs(
                      title="Total global cost of resulting damages from natural disasters (in billions):",
                      subtitle = "1940 - 2017\n",
                      y="",
                      x = ""
                    ) +  # title and caption
        annotate("text", x = 2011, y = 380000000000, label = "$364 Billion") +
        annotate("text", x = 2005, y = 226000000000, label = "$214 Billion") +
        annotate("text", x = 1995, y = 167000000000, label = "$155 Billion") +
        annotate("text", x = 1980, y = 45000000000, label = "$32 Billion") +
        scale_x_continuous(breaks = c(seq(1940,2017, by = 5))) +
        scale_y_continuous(
                            breaks = c(0, 50000000000, 100000000000, 150000000000, 
                                      200000000000, 250000000000, 300000000000, 350000000000 ),
                            labels = c("$0 ", "$50 B ", "$100 B ", "$150 B ", "$200 B ",
                                            "$250 B ", "$300 B ", "$350 B ")
                          ) +
        theme_hc()  + 
        theme( 
                text = element_text(size=11,  family="Calibri (Body)"),
                plot.title = element_text(hjust = 0),
                axis.text.x = element_text(angle = 70, hjust = 1)
             )




# displaced

# "south.asia"
# "eu.centralAsia"
# "midEast.northAfr"
# "eastAsia.pacific"
# "subSaharan.africa"
# "latinAm.caribbean"
# "north.America"

disaster.2016.locals <- disaster.displaced.data %>% 
                                filter( (Year == 2016 ) & 
                                    ( is.element(Entity, south.asia) | is.element(Entity, eu.centralAsia) | 
                                        is.element(Entity, midEast.northAfr) | is.element(Entity, eastAsia.pacific) |
                                        is.element(Entity, subSaharan.africa) | is.element(Entity, latinAm.caribbean) |
                                        is.element(Entity, north.America)) 
                                    ) 

library(tidyverse)
library(knitr)
library(broom)
library(stringr)
library(modelr)
library(forcats)
library(rgdal)
library(ggmap)
library(maps)
library(maptools)

world <- readOGR(dsn = "C:\\Desktop\\Data vis project\\Data_vis_project\\world bank data\\world geo files", 
                 layer = "ne_110m_admin_0_countries")

world2 <- fortify(world, region = "ISO_A3")

#disaster.2016.locals$Internally.displaced.persons <- as.numeric(disaster.2016.locals$Internally.displaced.persons)
disaster.2016.locals$Code <- as.character(disaster.2016.locals$Code)
disaster.2016.locals$Internally.displaced.persons <- as.numeric(disaster.2016.locals$Internally.displaced.persons)
        


ggplot(world2, aes(long,lat, group=group, fill= )) + 
        geom_polygon() + 
        geom_polygon(data=countries_robin_df, aes(long,lat, group=group, fill=hole))
        labs(title="World map (longlat)") + 
        coord_equal() + 
        ggthemes::theme_map() +
        coord_map(projection = "mollweide", xlim = c(-180, 180))
        
        
        
        theme_opts



ggplot(disaster.2016.locals , aes(map_id = 'Code')) +
        geom_map(aes(fill = Internally.displaced.persons), map = world2) +
        expand_limits(x = world2$long, y = world2$lat) +
        #scale_fill_brewer(palette = "BuGn") +
        labs(title = "Internally displaced persons",
             subtitle = '2016',
             fill = NULL) +
        ggthemes::theme_map() +
        coord_map(projection = "mollweide", xlim = c(-180, 180))



