#############################
##### Data vis project  ##### 
##### Part 2 - edication#####
##### Nicholas Hopewell #####     
##### 0496633           #####     
#############################

library(ggplot2)
library(plotly)
library(tidyverse)
require(tidyr)
library(ggthemes)
library(scales)
library(extrafont)


### groups for subsetting:

## income groups:
# "low.income"
# "uprMid.income"
# "high.income"
# "lowMid.income" 

## world regions:
# "south.asia"
# "eu.centralAsia"
# "midEast.northAfr"
# "eastAsia.pacific"
# "subSaharan.africa"
# "latinAm.caribbean"
# "north.America"

# function to assign region labels to each country (see first script for regions)
get.regions <- function (first.col, second.col) {
        
        if (is.element(first.col, south.asia)) {
                second.col = "South Asia"
        } else if (is.element(first.col, eu.centralAsia)) {
                second.col = "Europe & Central Asia" 
        } else if (is.element(first.col, midEast.northAfr)) {
                second.col = "Middle East & North Africa" 
        } else if (is.element(first.col, eastAsia.pacific)) {
                second.col = "East Asia & Pacific" 
        } else if (is.element(first.col, subSaharan.africa)) {
                second.col = "Sub-Saharan Africa" 
        } else if (is.element(first.col, latinAm.caribbean)) {
                second.col = "Latin America & Caribbean" 
        } else if (is.element(first.col, north.America)) {
                second.col = "North America" 
        } else {
                second.col = NA
        }
        return (second.col)
}


### World populations

world.pop.data




### Human development index







### Life expectancy 







### Education

#ed.expend.data

# create empty region column
ed.expend.data <- ed.expend.data %>%
                        mutate(region = NA) 


# subset out columns and rows not needed
ed.expend.countries <- ed.expend.data[1:217, c(3, 5:ncol(ed.expend.data)-2, 
                                               ncol(ed.expend.data))]

# subet further
ed.expend.countries <- ed.expend.countries[, c(1, 3:ncol(ed.expend.countries))]

# apply the custom function to assign regions
ed.expend.countries$region <- sapply(
                                        ed.expend.countries$Country.Name, ed.expend.data$region, 
                                        FUN = get.regions
                                    )

# convert region to factor for grouping and aggregation
ed.expend.countries$region <- as.factor(ed.expend.countries$region)


## take the wide data frame and make it long for visualization:

# gather on year columns
region.long <- ed.expend.countries  %>% 
        gather(year, ed.expend, `1990`:`2016`) 

# aggregate 
region.summary <- aggregate(ed.expend ~ year + region, 
                            FUN=mean, region.long)
# refined bar plot
region.summary %>%
        filter(year == 1990 | year == 2000 | year == 2015) %>%
        ggplot(., aes(y = ed.expend, 
                      x = year, fill = region)) +
                geom_bar(colour="darkgrey", stat = "identity", position = "dodge") +
                geom_text(
                           aes(label = sprintf("%.1f", ed.expend), y = ed.expend, group = region),
                           size = 3, position = position_dodge(width=0.9), vjust=-0.40
                         ) +
                labs( 
                      fill = 'region\n',
                      x = "\n\nyear\n",
                      y = "mean expenditure as % of GNI\n(Gross National Income)\n", 
                      title = "Mean regional education expenditure: \n\n1990, 2000, & 2015\n\n"
                    ) +
                theme_tufte() + 
                theme( 
                       text = element_text(size=11,  family="Calibri (Body)"),
                       plot.title = element_text(hjust = 0)
                     ) +
                scale_fill_few()
                

# nice table for stats:
region.table <- with(region.long, tapply(ed.expend,
                                         INDEX = list(region, year), 
                                         FUN = mean, na.rm = TRUE))





# female school enrollment:

#fem.pre.data

fem.pre.data <- fem.pre.data %>%
        mutate(region = NA) 

# subset out columns and rows not needed
fem.pre.countries <- fem.pre.data[1:264, c(3, 5:ncol(fem.pre.data)-2, 
                                               ncol(fem.pre.data))]

fem.pre.countries <- fem.pre.countries[, c(1, 3:ncol(fem.pre.countries))]


# apply the custom function to assign regions
fem.pre.countries$region <- sapply(
        fem.pre.countries$Country.Name, fem.pre.countries$region, 
        FUN = get.regions
)

# convert region to factor for grouping and aggregation
fem.pre.countries$region <- as.factor(fem.pre.countries$region)


## take the wide data frame and make it long for visualization:

# gather on year columns
fem.region.long <- fem.pre.countries  %>% 
        gather(year, enrollment, `1980`:`2016`) 

# aggregate 
fem.pre.summary <- aggregate(enrollment ~ year + region, 
                            FUN=mean, fem.region.long)


##>> filter data set
fem.pre.summary<- fem.pre.summary %>%
                        filter(year == 2015) %>%
                        select(-one_of("year")) %>%
                        mutate(ed.level = "Pre-Primary")

fem.pre.summary$ed.level <- as.factor(fem.pre.summary$ed.level)


# fem.primary.data

fem.primary.data <- fem.primary.data %>%
        mutate(region = NA) 

# subset out columns and rows not needed
fem.primary.countries <- fem.primary.data[1:264, c(3, 5:ncol(fem.primary.data)-2, 
                                           ncol(fem.primary.data))]

fem.primary.countries <- fem.primary.countries[, c(1, 3:ncol(fem.primary.countries))]


# apply the custom function to assign regions
fem.primary.countries$region <- sapply(
        fem.primary.countries$Country.Name, fem.primary.countries$region, 
        FUN = get.regions
)

# convert region to factor for grouping and aggregation
fem.primary.countries$region <- as.factor(fem.primary.countries$region)


## take the wide data frame and make it long for visualization:

# gather on year columns
fem.primary.long <- fem.primary.countries  %>% 
        gather(year, enrollment, `1980`:`2016`) 

# aggregate 
fem.primary.summary <- aggregate(enrollment ~ year + region, 
                             FUN=mean, fem.primary.long)


##>> filter data set
fem.primary.summary<- fem.primary.summary %>%
        filter(year == 2015) %>%
        select(-one_of("year")) %>%
        mutate(ed.level = "Primary")

fem.primary.summary$ed.level <- as.factor(fem.primary.summary$ed.level)


# fem.secondary.data

fem.secondary.data <- fem.secondary.data %>%
        mutate(region = NA) 

# subset out columns and rows not needed
fem.secondary.countries <- fem.secondary.data[1:264, c(3, 5:ncol(fem.secondary.data)-2, 
                                                   ncol(fem.secondary.data))]

fem.secondary.countries <- fem.secondary.countries[, c(1, 3:ncol(fem.secondary.countries))]


# apply the custom function to assign regions
fem.secondary.countries$region <- sapply(
        fem.secondary.countries$Country.Name, fem.secondary.countries$region, 
        FUN = get.regions
)

# convert region to factor for grouping and aggregation
fem.secondary.countries$region <- as.factor(fem.secondary.countries$region)


## take the wide data frame and make it long for visualization:

# gather on year columns
fem.secondary.long <- fem.secondary.countries  %>% 
        gather(year, enrollment, `1980`:`2016`) 

# aggregate 
fem.secondary.summary <- aggregate(enrollment ~ year + region, 
                                 FUN=mean, fem.secondary.long)


##>> filter data set
fem.secondary.summary <- fem.secondary.summary %>%
        filter(year == 2015) %>%
        select(-one_of("year")) %>%
        mutate(ed.level = "Secondary")

fem.secondary.summary$ed.level <- as.factor(fem.secondary.summary$ed.level)


# fem.tertiary.data

fem.tertiary.data <- fem.tertiary.data %>%
        mutate(region = NA) 

# subset out columns and rows not needed
fem.tertiary.countries <- fem.tertiary.data[1:264, c(3, 5:ncol(fem.tertiary.data)-2, 
                                                       ncol(fem.tertiary.data))]

fem.tertiary.countries <- fem.tertiary.countries[, c(1, 3:ncol(fem.tertiary.countries))]


# apply the custom function to assign regions
fem.tertiary.countries$region <- sapply(
        fem.tertiary.countries$Country.Name, fem.tertiary.countries$region, 
        FUN = get.regions
)

# convert region to factor for grouping and aggregation
fem.tertiary.countries$region <- as.factor(fem.tertiary.countries$region)


## take the wide data frame and make it long for visualization:

# gather on year columns
fem.tertiary.long <- fem.tertiary.countries  %>% 
        gather(year, enrollment, `1980`:`2016`) 

# aggregate 
fem.tertiary.summary <- aggregate(enrollment ~ year + region, 
                                   FUN=mean, fem.tertiary.long)


##>> filter data set
fem.tertiary.summary  <- fem.tertiary.summary  %>%
        filter(year == 2015) %>%
        select(-one_of("year")) %>%
        mutate(ed.level = "Tertiary")


fem.tertiary.summary$ed.level <- as.factor(fem.tertiary.summary$ed.level)



# bind 4 data sets by rows into one master set:
all.fem.education <- rbind(fem.pre.summary,fem.primary.summary,
                           fem.secondary.summary,fem.tertiary.summary)




## Circular bar plot of female education:

# Set a number of 'empty bar' to add at the end of each group
empty_bar=3
to_add = data.frame( matrix(NA, empty_bar*nlevels(all.fem.education$ed.level), ncol(all.fem.education)) )
colnames(to_add) = colnames(all.fem.education)
to_add$ed.level=rep(levels(all.fem.education$ed.level), each=empty_bar)
data=rbind(all.fem.education, to_add)
data=data %>% arrange(ed.level, enrollment)
data$id=seq(1, nrow(data))

# Order data:
data = data %>% arrange(group, value)

# Get the name and the y position of each label
label_data=data
number_of_bar=nrow(label_data)
angle= 90 - 360 * (label_data$id-0.5) /number_of_bar     # I substract 0.5 because the letter must have the angle of the center of the bars. Not extreme right(1) or extreme left (0)
label_data$hjust<-ifelse( angle < -90, 1, 0)
label_data$angle<-ifelse(angle < -90, angle+180, angle)

# prepare a data frame for base lines
base_data=data %>% 
        group_by(ed.level) %>% 
        summarize(start=min(id), end=max(id) - empty_bar) %>% 
        rowwise() %>% 
        mutate(title=mean(c(start, end)))

# prepare a data frame for grid (scales)
grid_data = base_data
grid_data$end = grid_data$end[ c( nrow(grid_data), 1:nrow(grid_data)-1)] + 1
grid_data$start = grid_data$start - 1
grid_data=grid_data[-1,]

# Make the plot
ggplot(data, aes(x=as.factor(id), y=enrollment, fill=ed.level)) +     
        
        geom_bar(aes(x=as.factor(id), y=enrollment, fill=ed.level), stat="identity", alpha=0.5, colour="darkgrey") +
        
        # Add a val=100/75/50/25 lines. I do it at the beginning to make sure barplots are OVER it.
        geom_segment(data=grid_data, aes(x = end, y = 80, xend = start, yend = 80), 
                     colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
        geom_segment(data=grid_data, aes(x = end, y = 60, xend = start, yend = 60), 
                     colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
        geom_segment(data=grid_data, aes(x = end, y = 40, xend = start, yend = 40), 
                     colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
        geom_segment(data=grid_data, aes(x = end, y = 20, xend = start, yend = 20), 
                     colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
        
        # Add text showing the value of each 100/75/50/25 lines
        annotate("text", x = rep(max(data$id),4), y = c(20, 40, 60, 80), label = c("20", "40", "60", "80") , 
                 color="grey", size=3 , angle=0, fontface="bold", hjust=1) +
        
        geom_bar(aes(x=as.factor(id), y=enrollment, fill=ed.level), stat="identity", alpha=0.5) +
        ylim(-100,120) +
        theme_minimal() +
        theme(
                legend.position = "none",
                axis.text = element_blank(),
                axis.title = element_blank(),
                panel.grid = element_blank(),
                plot.margin = unit(rep(-1,4), "cm") 
             ) +
        coord_polar() + 
        geom_text(data=label_data, aes(x=id, y=enrollment+10, label=region, hjust=hjust), color="black", fontface="bold",alpha=0.6, size=2.5, angle= label_data$angle, inherit.aes = FALSE ) +
        
        # Add base line information
        geom_segment(data=base_data, aes(x = start, y = -5, xend = end, yend = -5), 
                     colour = "black", alpha=0.8, size=0.6 , inherit.aes = FALSE )  +
        geom_text(data=base_data, aes(x = title, y = -18, label=ed.level), hjust=c(1,1,0,0), 
                  colour = "black", alpha=0.8, size=4, fontface="bold", inherit.aes = FALSE) +
        scale_fill_few()




# compare female to male tertiary education in north america and europe


southAsia.fem <- fem.secondary.long %>%
                        filter(year == 2015 & region == "South Asia") %>%
                        mutate(gender = "Female")

#fem.secondary.long %>%
#        filter(year == 2005 & region == "South Asia")




# male.secondary.data


male.secondary.data <- male.secondary.data %>%
        mutate(region = NA) 

# subset out columns and rows not needed
male.secondary.countries <- male.secondary.data[1:264, c(3, 5:ncol(male.secondary.data)-2, 
                                                     ncol(male.secondary.data))]

male.secondary.countries <- male.secondary.countries[, c(1, 3:ncol(male.secondary.countries))]


# apply the custom function to assign regions
male.secondary.countries$region <- sapply(
        male.secondary.countries$Country.Name, male.secondary.countries$region, 
        FUN = get.regions
)

# convert region to factor for grouping and aggregation
male.secondary.countries$region <- as.factor(male.secondary.countries$region)


## take the wide data frame and make it long for visualization:

# gather on year columns
male.secondary.long <- male.secondary.countries  %>% 
        gather(year, enrollment, `1980`:`2016`) 


# filter 
southAsia.male <- male.secondary.long %>%
                      filter(year == 2015 & region == "South Asia") %>%
                      mutate(gender = "Male")


# rbind into super set
all.sAsia.secondary <- rbind(southAsia.fem, southAsia.male) %>%
        filter(Country.Name != "Maldives" & Country.Name != "Sri Lanka" )


# plot
ggplot(all.sAsia.secondary, aes(y = enrollment, 
              x = Country.Name, fill = gender)) +
        geom_bar(colour="darkgrey", stat = "identity", position = "dodge") +
        geom_text(
                aes(label = sprintf("%.1f", enrollment), y = enrollment, group = gender),
                size = 3, position = position_dodge(width=0.9), vjust=-0.40
        ) +
        labs( 
                fill = 'gender\n',
                x = "",
                y = "total enrollment (% gross)\n", 
                title = "Secondary education enrollment - males and females: \n\nSouth Asia, 2015\n\n"
        ) +
        theme_tufte() + 
        theme( 
                text = element_text(size=11,  family="Calibri (Body)"),
                plot.title = element_text(hjust = 0)
        ) +
        scale_fill_few()







