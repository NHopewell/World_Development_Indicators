### employment

#participation.ratio.data



#unemploy.rates.data
# use the diverging lollipop


latin.unemploy <- unemploy.rates.data %>%
                        gather(year, unemploy.rates, `2000`:`2017`) %>%
                        filter(Country.Name %in% latinAm.caribbean,
                               year == '2015') %>%
                        select(Country.Name, unemploy.rates) %>%
                        drop_na()
               


# normalizaed unemplyment rates
latin.unemploy$unemploy.rates <- round((latin.unemploy$unemploy.rates - 
                                                mean(latin.unemploy$unemploy.rates))/sd(latin.unemploy$unemploy.rates), 2)
# make new col and arrage
latin.unemploy <- latin.unemploy %>%
                        mutate(relative = ifelse(unemploy.rates < 0, "below", "above")) %>%
                        arrange(unemploy.rates)
       
# factorize 
latin.unemploy$Country.Name <- factor(latin.unemploy$Country.Name, levels = latin.unemploy$Country.Name)
        


ggplot(latin.unemploy, aes(x = Country.Name, y = unemploy.rates, label = unemploy.rates)) + 
        geom_hline(yintercept = 0, color = "darkgrey", size=.2) +
        geom_point(stat='identity', aes(color = relative), size=7.5)  +
        geom_segment(aes(y = 0, 
                         x = Country.Name, 
                         yend = unemploy.rates*.95, 
                         xend = Country.Name,
                         color = relative)) +
        geom_text(color = "black", size = 2.5) +
        labs(title="Relative unemployment rates",
             subtitle = "Latin America and the Caribbean\n",
             y ="Normalized unemployment rates\n(% of total labour force)",
             x = "") + 
        ylim(-3.5, 3.5) +
        scale_color_few() +
        theme_hc() +
        theme(  legend.position="none",
                text = element_text(size=11,  family="Calibri (Body)")
        ) +
        coord_flip()





