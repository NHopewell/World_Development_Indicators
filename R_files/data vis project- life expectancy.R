

### Life expectancy 


# new file
life.expectancy <- read.csv("C:\\Desktop\\Data vis project\\Data_vis_project\\world bank data\\world development indicators\\life-expectancy-globally-since-1770.csv", header = T)
# fix names
life.names <- c("Country", "Code", "Year", "L.expectancy")
names(life.expectancy) <- life.names
# subset
life.expectancy <- life.expectancy[ , c(1,3,4)]

life.expectancy <- life.expectancy[1:134, ]

ggplot(life.expectancy, aes(x=Year, y=L.expectancy, group=Country, color = Country)) +
        geom_line(size = 0.8) + 
        scale_y_continuous(limits = c(26, 100), breaks = seq(25, 85, 15)) +
        scale_x_continuous( breaks = c(1800, 1850, 1900, 1950, 2000)) +
        labs( title = "Global life expectancy",
              subtitle = "1770 - 2015\n",
              x = "", 
              y = "Life expectancy (in years)\n") +
        theme_hc() + scale_colour_few() +
        theme( text = element_text(size=11,  family="Calibri (Body)")) 


# distribution plot

country.life.expectancy <- read.csv("life-expectancy.csv", header = T)
life.names <- c("Country", "Code", "Year", "L.expectancy")
names(country.life.expectancy) <- life.names


# "south.asia"
# "eu.centralAsia"
# "midEast.northAfr"
# "eastAsia.pacific"
# "subSaharan.africa"
# "latinAm.caribbean"
# "north.America"

country.life.expectancy <- country.life.expectancy %>%
                                        filter(Year == 2015,
                                               Country %in% south.asia | Country %in% eu.centralAsia | Country %in% midEast.northAfr |
                                               Country %in%  eastAsia.pacific |  Country %in% subSaharan.africa |  Country %in% latinAm.caribbean)

# apply the custom function to assign regions
country.life.expectancy$region <- sapply(
        country.life.expectancy$Country, country.life.expectancy$region, 
        FUN = get.regions
)


ggplot(country.life.expectancy, aes(x=reorder(region, L.expectancy), y=L.expectancy, fill=region)) +
        geom_violin(alpha=0.6) +
        labs( x = "",
              fill = "Region\n",
              y = "Life expectancy (in years)\n",
              title = "Regional life expectancy") +
        theme_minimal()+ 
        theme(text = element_text(size=11,  family="Calibri (Body)"))
        scale_color_few()   
        
        
        
        
### Human development index

#  do the scatters with bubbles
        
human.development <- read.csv("C:\\Desktop\\Data vis project\\Data_vis_project\\world bank data\\world development indicators\\hdi-vs-gdp-per-capita.csv", header = T)        

human.names<- c("Country.Name", "Code", "Year", "HDI", "GDP", "Population")

names(human.development) <- human.names
        
# firx encoding
human.development$Country.Name <- sub("â€™", "'", human.development$Country.Name)

# apply the custom function to assign regions
human.development$region <- sapply(
      human.development$Country.Name, human.development2$region, 
      FUN = get.regions
)        

# make factor
human.development$region <- as.factor(human.development$region)
# drop na
human.development <- human.development %>%
                        drop_na(region)
      
      
human.development <- human.development %>% 
      filter(Year == 2010) %>%
      drop_na()
      
      
options(scipen = 999)


# log GDP axis
hd_1 <- ggplot(human.development, aes(log(GDP), HDI, size = Population, color = region)) +
      geom_point(alpha=0.6) +
      scale_size_continuous(breaks=c(1000000, 10000000, 100000000, 500000000, 1000000000), 
                            labels = c("1 million", "10 million", "100 million","500 million", "1 billion"), 
                            range=c(1, 20)) +
      labs( size = "population",
            x = "\nlog GDP per capita (international-$)\n",
            y = "Human Development Index (HDI)\n",
            title = "Human Development Index (HDI) vs. log GDP per capita",
            subtitle = "2015\n") +
      theme_minimal() +
      theme(
            text = element_text(size=10,  family="Calibri (Body)"),
            title = element_text(size=14,  family = "Calibri (Body)"),
            axis.text.x = element_text(size=10,  family = "Calibri (Body)"),
            axis.text.y = element_text(size=10,  family = "Calibri (Body)"),
            axis.title = element_text(size=12,  family = "Calibri (Body)"),
            panel.border = element_blank()
      ) +
      guides(colour = guide_legend(override.aes = list(size=10)))+ 
      #scale_size_manual(values=c(1000000,500000000,1000000000), labels = c("1 million","500 million","1 billion")) +
      scale_color_few()



# linear GDP axis
hd_2 <- ggplot(human.development, aes(GDP, HDI, size = Population, color = region)) +
      geom_point(alpha=0.6) +
      scale_size_continuous(breaks=c(1000000, 10000000, 100000000, 500000000, 1000000000), 
                            labels = c("1 million", "10 million", "100 million","500 million", "1 billion"), 
                            range=c(1, 20)) +
      labs( size = "population",
            x = "\nlog GDP per capita (international-$)\n",
            y = "Human Development Index (HDI)\n",
            title = "Human Development Index (HDI) vs. log GDP per capita",
            subtitle = "2015\n") +
      theme_minimal() +
      theme(
            text = element_text(size=10,  family="Calibri (Body)"),
            title = element_text(size=14,  family = "Calibri (Body)"),
            axis.text.x = element_text(size=10,  family = "Calibri (Body)"),
            axis.text.y = element_text(size=10,  family = "Calibri (Body)"),
            axis.title = element_text(size=12,  family = "Calibri (Body)"),
            panel.border = element_blank()
      ) +
      guides(colour = guide_legend(override.aes = list(size=10)))+ 
      #scale_size_manual(values=c(1000000,500000000,1000000000), labels = c("1 million","500 million","1 billion")) +
      scale_color_few()


# arrgange horizontally:

grid.arrange(hd_1, hd_2, ncol = 1)





## dot plots of HDI regionally 


# north america
d1 <- human.development %>%
      filter(Country.Name %in% north.America) %>%
      ggplot(., aes(x = HDI, y = 1, label = Country.Name)) +
      geom_point(color = "purple", position = "dodge") +
      geom_text_repel(
            nudge_y      = 0.05,
            #direction    = "x",
            angle        = 90,
            #vjust        = 0,
            segment.size = 0.2
      ) +
      annotate("text", x = 0.1, y = 0.81, label = "North America", size = 5, colour = "grey35") +
      labs(x = NULL) +
      xlim(0, 1) +
      ylim(1, 0.8) +
      theme_tufte()+
      theme(
            text = element_text(size=12,  family="Calibri (Body)"),
            axis.line.y  = element_blank(),
            axis.ticks.y = element_blank(),
            axis.text.y  = element_blank(),
            axis.title.y = element_blank()
      )



# europe and central asia
d2<- human.development %>%
      filter(Country.Name %in% eu.centralAsia) %>%
      ggplot(., aes(x = HDI, y = 1, label = Country.Name)) +
      geom_point(color = "dodgerblue2", position = "dodge", size = 2.5) +
      geom_text_repel(
            size = 4,
            nudge_y      = 0.07,
            #direction    = "x",
            angle        = 90,
            #vjust        = 0,
            segment.size = 0.2,
            segment.alpha = 0.5
      ) +
      annotate("text", x = 0.1, y = 0.81, label = "EU and Central Asia", size = 5, colour = "grey35") +
      labs(x = NULL) +
      xlim(0, 1) +
      ylim(1, 0.8) +
      theme_tufte()+
      theme(
            text = element_text(size=12,  family="Calibri (Body)"),
            axis.line.y  = element_blank(),
            axis.ticks.y = element_blank(),
            axis.text.y  = element_blank(),
            axis.title.y = element_blank()
      )


# east asia and pacific
d3 <- human.development %>%
      filter(Country.Name %in% eastAsia.pacific) %>%
      ggplot(., aes(x = HDI, y = 1, label = Country.Name)) +
      geom_point(color = "palegreen3", position = "dodge", size = 2.5) +
      geom_text_repel(
            size = 4,
            nudge_y      = 0.07,
            #direction    = "x",
            angle        = 90,
            #vjust        = 0,
            segment.size = 0.2,
            segment.alpha = 0.5
      ) +
      annotate("text", x = 0.1, y = 0.81, label = "East Asia and Pacific", size = 5, colour = "grey35") +
      labs(x = NULL) +
      xlim(0, 1) +
      ylim(1, 0.8) +
      theme_tufte()+
      theme(
            text = element_text(size=12,  family="Calibri (Body)"),
            axis.line.y  = element_blank(),
            axis.ticks.y = element_blank(),
            axis.text.y  = element_blank(),
            axis.title.y = element_blank()
      )

# latin america and caribean
d4 <- human.development %>%
      filter(Country.Name %in% latinAm.caribbean) %>%
      ggplot(., aes(x = HDI, y = 1, label = Country.Name)) +
      geom_point(color = "tomato", position = "dodge") +
      geom_text_repel(
            size = 4,
            nudge_y      = 0.07,
            #direction    = "x",
            angle        = 90,
            #vjust        = 0,
            segment.size = 0.2,
            segment.alpha = 0.5
      ) +
      annotate("text", x = 0.2, y = 0.81, label = "Latin America and Caribbean", size = 5, colour = "grey35") +
      labs(x = NULL) +
      xlim(0, 1) +
      ylim(1, 0.8) +
      theme_tufte()+
      theme(
            text = element_text(size=12,  family="Calibri (Body)"),
            axis.line.y  = element_blank(),
            axis.ticks.y = element_blank(),
            axis.text.y  = element_blank(),
            axis.title.y = element_blank()
      )


# "midEast.northAfr"

d5 <- human.development %>%
      filter(Country.Name %in% midEast.northAfr) %>%
      ggplot(., aes(x = HDI, y = 1, label = Country.Name)) +
      geom_point(color = "darkgoldenrod4", position = "dodge") +
      geom_text_repel(
            size = 4,
            nudge_y      = 0.07,
            #direction    = "x",
            angle        = 90,
            #vjust        = 0,
            segment.size = 0.2,
            segment.alpha = 0.5
      ) +
      annotate("text", x = 0.2, y = 0.81, label = "Middle East and North Africa", size = 5, colour = "grey35") +
      labs(x = NULL) +
      xlim(0, 1) +
      ylim(1, 0.8) +
      theme_tufte()+
      theme(
            text = element_text(size=12,  family="Calibri (Body)"),
            axis.line.y  = element_blank(),
            axis.ticks.y = element_blank(),
            axis.text.y  = element_blank(),
            axis.title.y = element_blank()
      )


# "south.asia"

d6 <- human.development %>%
      filter(Country.Name %in% south.asia) %>%
      ggplot(., aes(x = HDI, y = 1, label = Country.Name)) +
      geom_point(color = "red3", position = "dodge") +
      geom_text_repel(
            size = 4,
            nudge_y      = 0.07,
            #direction    = "x",
            angle        = 90,
            #vjust        = 0,
            segment.size = 0.2,
            segment.alpha = 0.5
      ) +
      annotate("text", x = 0.1, y = 0.81, label = "South Asia", size = 5, colour = "grey35") +
      labs(x = "\n\nHuman Development Index (HDI)\n") +
      xlim(0, 1) +
      ylim(1, 0.8) +
      theme_tufte()+
      theme(
            text = element_text(size=12,  family="Calibri (Body)"),
            axis.line.y  = element_blank(),
            axis.ticks.y = element_blank(),
            axis.text.y  = element_blank(),
            axis.title.y = element_blank(),
            axis.title.x = element_text(size = 14, face="bold")
      )



# grid.arrange vertically
grid.arrange(d1, d2, d3, d4, nrow = 6)
