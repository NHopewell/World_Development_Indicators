### inequality

#GINI.index.data
#contraceptive.data

# correlate contraceptive and disease
fem.disease.data <- fem.disease.data %>%
                                select(Country.Name, `2015`)

fem.disease.data <- fem.disease.data[1:217, ]

#africa.disease <- fem.disease.data %>%
#                        filter(Country.Name %in% subSaharan.africa)

# dot plot with dotted segment
#ggplot(africa.disease, aes(x=reorder(Country.Name, `2015`), y=`2015`)) + 
#        geom_point(col="chartreuse4", size=3) +   
#        geom_segment(aes(x=Country.Name,     # draw actual dots across
#                         xend=Country.Name, 
#                         y=min(`2015`)-5, 
#                         yend=max(`2015`)+5), 
#                     linetype="dotted", 
#                     size=0.15,
#                     color = "darkgrey") +   # Draw dashed lines
#        labs(title="Female death rates from communicable diseases",
#             subtitle = "ages 15 - 34",
#             x="",
#             y = "\nDeaths due to disease (% of age group)") +  
#        theme_tufte()+
#        theme(plot.title = element_text(size=14,  family = "Calibri (Body)"),
#              plot.subtitle = element_text(size=10,  family = "Calibri (Body)"),
#              plot.caption = element_text(size=8,  family = "Calibri (Body)"),
#              axis.text.x = element_text(size=10,  family = "Calibri (Body)"),
#              axis.text.y = element_text(size=10,  family = "Calibri (Body)"),
#              axis.title = element_text(size=11,  family = "Calibri (Body)"),
#              legend.position = "none") +
#        coord_flip() # flip coords



low.income.disease <- fem.disease.data %>%
        filter(Country.Name %in% low.income)

# dot plot with dotted segment
ggplot(low.income.disease, aes(x=reorder(Country.Name, `2015`), y=`2015`)) + 
        geom_point(col="red2", size=3) +   
        geom_segment(aes(x=Country.Name,     # draw actual dots across
                         xend=Country.Name, 
                         y=min(`2015`)-5, 
                         yend=max(`2015`)+5), 
                     linetype="dotted", 
                     size=0.15,
                     color = "darkgrey") +   # Draw dashed lines
        labs(title="Female death rates from communicable diseases in low income countries",
             subtitle = "ages 15 - 34",
             x="",
             y = "\nDeaths due to disease (% of age group)") +  
        theme_tufte()+
        theme(plot.title = element_text(size=14,  family = "Calibri (Body)"),
              plot.subtitle = element_text(size=10,  family = "Calibri (Body)"),
              plot.caption = element_text(size=8,  family = "Calibri (Body)"),
              axis.text.x = element_text(size=10,  family = "Calibri (Body)"),
              axis.text.y = element_text(size=10,  family = "Calibri (Body)"),
              axis.title = element_text(size=11,  family = "Calibri (Body)"),
              legend.position = "none") +
        coord_flip() # flip coords


#fem.employers.data
# use high income countries

fem.employers.data <- fem.employers.data %>%
                        select(Country.Name, `2008`, `2017`) %>%
                        filter(Country.Name %in% eu.centralAsia) %>%
                        drop_na()

# to drop
drop.counts <- c("Tajikistan",
                 "Moldova",
                 "Romania",
                 "Georgia",
                 "Cyprus",
                 "Albania",
                 "Macedonia, FYR",
                 "Uzbekistan",
                 "Slovak Republic",
                 "Channel Islands",
                 "Kyrgyz Republic",
                 "Turkmenistan",
                 "Belarus")
# drop
fem.employers.data<- fem.employers.data %>% 
                        filter(!is.element(Country.Name, drop.counts))
fem.employers.data2<- fem.employers.data %>%
                        arrange(`2017`) %>%
                        mutate(Country.Name = factor(Country.Name, Country.Name))

big.changes <- c("Bosnia and Herzegovina", "Ukraine")
big.changes2 <- c("Azerbaijan", "Luxembourg")

# 2008
fem.employers.data3 <- fem.employers.data %>%
        arrange(`2008`) %>%
        mutate(Country.Name = factor(Country.Name, Country.Name))


#fem.employers.data3$Country.Name <- reorder(fem.employers.data3$Country.Name,fem.employers.data3$`2008`)

ggplot(fem.employers.data3, aes(x=Country.Name, y=`2008`)) +
        geom_segment( aes(x=Country.Name, 
                          xend=Country.Name, 
                          y=0,
                          yend=`2008`), 
                      color=ifelse(fem.employers.data3$Country.Name %in% big.changes | fem.employers.data3$Country.Name %in% big.changes2, "orange", "grey70"), 
                      size=ifelse(fem.employers.data3$Country.Name %in% big.changes | fem.employers.data3$Country.Name %in% big.changes2, 1.3, 0.7) ) +
        geom_point( color=ifelse(fem.employers.data3$Country.Name %in% big.changes | fem.employers.data3$Country.Name %in% big.changes2, "orange", "grey70"), 
                    size=ifelse(fem.employers.data3$Country.Name %in% big.changes | fem.employers.data3$Country.Name %in% big.changes2, 5, 2) ) +
        labs(title = "Proportion of female employers of all working females - 2008",
             subtitle = "Europe and Central Asia",
             x= "",
             y= "Female employers (% of female employment)") +
        theme_light() +
        coord_flip() +
        theme(
                legend.position="none",
                panel.grid.major.y = element_blank(),
                panel.border = element_blank(),
                axis.ticks.y = element_blank()
        )


fem.employers.data3 <- fem.employers.data %>%
      arrange(`2017`)

#2017
ggplot(fem.employers.data2, aes(x=Country.Name,`2017`, y=`2017`)) +
        geom_segment( aes(x=Country.Name, 
                          xend=Country.Name, 
                          y=0, 
                          yend=`2017` ), 
                      color=ifelse(fem.employers.data2$Country.Name %in% big.changes2, "chartreuse4", 
                                   ifelse(fem.employers.data2$Country.Name %in% big.changes, "tomato", "grey70")), 
                      size=ifelse(fem.employers.data2$Country.Name %in% big.changes | fem.employers.data2$Country.Name %in% big.changes2, 1.3, 0.7) ) +
        geom_point( color=ifelse(fem.employers.data2$Country.Name %in% big.changes2, "chartreuse4", 
                                 ifelse(fem.employers.data2$Country.Name %in% big.changes, "tomato", "grey70")), 
                    size=ifelse(fem.employers.data2$Country.Name %in% big.changes | fem.employers.data2$Country.Name %in% big.changes2, 5, 2) ) +
        labs(title = "Proportion of female employers of all working females - 2017",
             subtitle = "Europe and Central Asia",
             x= "",
             y= "Female employers (% of female employment)") +
        theme_light() +
        coord_flip() +
        theme(
                legend.position="none",
                panel.grid.major.y = element_blank(),
                panel.border = element_blank(),
                axis.ticks.y = element_blank()
        )

grid.arrange(p3, p4, ncol = 1)


#male.employers.data