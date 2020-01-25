### environmental sustainability and pollution

## income groups:
# "low.income"
# "uprMid.income"
# "high.income"
# "lowMid.income" 


## View(co2.emiss.data)
# take data from 1995 to 2014

co2.emiss.data2 <- co2.emiss.data %>%
        gather(year, co2.emiss, `1960`:`2014`) %>%
        select(Country.Name, year, co2.emiss)

get.income <- function (first.col, second.col) {
        
        if (is.element(first.col, low.income)) {
                second.col = "Low Income"
        } else if (is.element(first.col, uprMid.income)) {
                second.col = "Upper-Middle Income" 
        } else if (is.element(first.col, high.income)) {
                second.col = "High Income" 
        } else if (is.element(first.col, lowMid.income)) {
                second.col = "Low-Middle Income" 
        } else {
                second.col = NA
        }
        return (second.col)
}
# firx encoding
co2.emiss.data2$Country.Name <- sub("â???T", "'", co2.emiss.data2$Country.Name)

# apply the custom function to assign regions
co2.emiss.data2$Income <- sapply(
        co2.emiss.data2$Country.Name, co2.emiss.data2$Income, 
        FUN = get.income
)

# convert region to factor for grouping and aggregation
co2.emiss.data2$Income <- factor(co2.emiss.data2$Income, levels = c("Low Income", "Low-Middle Income", 
                                                                        "Upper-Middle Income", "High Income"),
                                                             labels = c("Low Income", "Low-Middle Income", 
                                                                        "Upper-Middle Income", "High Income")
                                    )

co2.emiss.data2 <- co2.emiss.data2 %>%
        group_by(year, Income) %>%
        summarize(mean.co2.emiss = mean(co2.emiss, na.rm = T)) %>%
        select(Income, mean.co2.emiss, year) %>%
                drop_na()
        

# co2.emiss.data2 =co2.emiss.data2[order(co2.emiss.data2$Income, decreasing=T) , ]


year.fixed<- (rep(1960:2014, each = 4))
co2.emiss.data2$year <- year.fixed
co2.emiss.data2 <- as.data.frame(co2.emiss.data2)

library(scales)
ggplot(co2.emiss.data2, aes(x=year, y= mean.co2.emiss, fill=Income)) +
        geom_area(colour="grey50", size=.1, alpha=.6) +
        scale_fill_brewer(type = "seq", palette = "Set2", direction = -1) +
        scale_x_continuous(limits= c(1960, 2014), breaks = c(seq(1960, 2014, by = 5), 2014)) +
        scale_y_continuous(limits= c(0, 600000), breaks = seq(0, 600000, by = 100000)) +
        labs( title = "Global CO2 emission by income category",
              subtitle = "1960 - 2014\n",
              x = "\nYear", 
              y = "CO2 emissions (metric tons per capita)\n") +
        theme_hc() +
        theme( text = element_text(size=11,  family="Calibri (Body)"))



#resource.depletion.data
#renewable.consume.data

resource.depletion.data$Country.Name <- sub("â???T", "'", resource.depletion.data$Country.Name)
#renewable.consume.data$Country.Name <- sub("â???T", "'", renewable.consume.data$Country.Name)

resource.depletion.data<- resource.depletion.data%>%
                                select(Country.Name, `2016`)


# apply the custom function to assign regions
resource.depletion.data$Income <- sapply(
        resource.depletion.data$Country.Name, resource.depletion.data$Income, 
        FUN = get.income
)

# ass regions
resource.depletion.data$region <- sapply(
        resource.depletion.data$Country.Name, resource.depletion.data$region, 
        FUN = get.regions
)

resource.depletion.data <- resource.depletion.data[1:217, ]

resource.depletion.data <- resource.depletion.data  %>% drop_na()

library(ggridges)
# plot the ridgeplot to compare distributions
ggplot(resource.depletion.data, aes(x = `2016`, y = Income, fill = Income)) +
        geom_density_ridges() +
        labs(title="Global natural resource depletion", 
             subtitle=" by income category\n",
             caption="GNI: Gross National Income",
             x = "\nResource depletion (% of GNI)",
             y = "") +
        theme_hc() +
        theme(plot.title = element_text(size=14,  family = "Calibri (Body)"),
              plot.subtitle = element_text(size=10,  family = "Calibri (Body)"),
              plot.caption = element_text(size=8,  family = "Calibri (Body)"),
              axis.text.x = element_text(size=10,  family = "Calibri (Body)"),
              axis.text.y = element_text(size=10,  family = "Calibri (Body)"),
              axis.title = element_text(size=11,  family = "Calibri (Body)"),
              legend.position = "none") +
        scale_x_continuous(breaks = seq(0, 35, by = 5)) +
        scale_fill_few()


resource.depletion.data %>%
        filter(region != "North America") %>%
        ggplot(aes(x = `2016`, y = region, fill = region)) +
                geom_density_ridges() +
                labs(title="Global natural resource depletion", 
                     subtitle=" by region\n",
                     caption="GNI: Gross National Income",
                     x = "\nResource depletion (% of GNI)",
                     y = "")  +
                theme_hc() +
                theme(plot.title = element_text(size=14,  family = "Calibri (Body)"),
                      plot.subtitle = element_text(size=10,  family = "Calibri (Body)"),
                      axis.text.x = element_text(size=10,  family = "Calibri (Body)"),
                      axis.text.y = element_text(size=10,  family = "Calibri (Body)"),
                      axis.title = element_text(size=11,  family = "Calibri (Body)"),
                      legend.position = "none") +
                scale_x_continuous(breaks = seq(0, 35, by = 5)) +
                scale_fill_few()



# greenhouse.emiss.data


greenhouse.emiss.data2 <- greenhouse.emiss.data %>%
        gather(year, greenhouse.emiss, `1980`:`2014`) %>%
        select(Country.Name, year, greenhouse.emiss)

# fix encoding
greenhouse.emiss.data2$Country.Name <- sub("â???T", "'", greenhouse.emiss.data2$Country.Name)

# assign regions
greenhouse.emiss.data2$region <- sapply(
        greenhouse.emiss.data2$Country.Name, greenhouse.emiss.data2$region, 
        FUN = get.regions
)

# apply the custom function to assign regions
greenhouse.emiss.data2$Income <- sapply(
        greenhouse.emiss.data2$Country.Name, greenhouse.emiss.data2$Income, 
        FUN = get.income
)

greenhouse.emiss.data2 <- greenhouse.emiss.data2%>%
        group_by(year, Income) %>%
        summarize(mean.greenhouse.emiss = mean(greenhouse.emiss, na.rm = T)) %>%
        drop_na()

library(ggTimeSeries)
# plot time series
#ggplot(greenhouse.emiss.data2, aes(x=year, y = mean.greenhouse.emiss, group = Income)) + 
#        geom_line(aes(color=Income))+
#        geom_point(aes(color=Income))

only.upper <- greenhouse.emiss.data2 %>% 
                        filter(Income == "Upper-Middle Income")

ggplot_waterfall(
        dtData = only.upper ,'year', 'mean.greenhouse.emiss',
        nArrowSize = 0.2) +
        scale_color_manual(values = c("green4", "red2"))+
        theme_minimal() +
        theme(plot.title = element_text(size=14,  family = "Calibri (Body)"),
              plot.subtitle = element_text(size=10,  family = "Calibri (Body)"),
              axis.text.x = element_text(size=10,  family = "Calibri (Body)"),
              axis.text.y = element_text(size=10,  family = "Calibri (Body)"),
              axis.title = element_text(size=11,  family = "Calibri (Body)"),
              legend.position = "none") +
        labs(title = "Global greenhouse gas emissions (upper-middle income nations)",
             subtitle = "1980 - 2011",
             y = "gas emissions (metric tons per capita)\n")
