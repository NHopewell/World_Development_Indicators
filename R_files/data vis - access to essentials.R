### Access to essentials

library(ggalt)

#latin.unemploy <- unemploy.rates.data %>%
africa.electricity <- essentials.data %>%
        filter(Country.Name %in% subSaharan.africa) %>%
        select(Country.Name, `2010`, `2015`)

# to order the plot correctly
africa.electricity$Country.Name <- factor(africa.electricity$Country.Name , 
                                          levels=as.character(africa.electricity$Country.Name )) 

# drop the outliers
to.drop <- c("Mauritius",
             "Seychelles",'Gabon',
             "South Africa", "Cabo Verde")
africa.electricity <- africa.electricity %>%
                                filter(!is.element(Country.Name, to.drop))

# reorder y axis reverse x 
ggplot(africa.electricity, aes(x=`2010`, xend=`2015`, y=reorder(Country.Name, -`2010`) , group=Country.Name )) + 
        geom_dumbbell(color="deepskyblue", 
                      colour_xend="deepskyblue4",
                      size_x = 2,
                      size_xend = 2) + 
        scale_x_continuous() + 
        labs(x="\n% of population", 
             y="", 
             title="Access to electricity in Sub-Saharan Africa", 
             subtitle="Percent Change: 2010 vs 2015") +
        theme_minimal() +
        theme( text = element_text(size=11,  family="Calibri (Body)"))
