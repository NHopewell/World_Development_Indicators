### birth, fertility and growth

### stunting.data

# create empty region column
#stunting.data <- stunting.data %>%
#        mutate(region = NA) 


# subset out columns and rows not needed
stunting.countries <- stunting.data[1:264, c(3, 5:ncol(stunting.data)-1)]

# subet further
stunting.countries  <- stunting.countries [, c(1, 3:ncol(stunting.countries))]

# apply the custom function to assign regions
#stunting.countries $region <- sapply(
#        stunting.countries $Country.Name, stunting.countries$region, 
#        FUN = get.regions
#)

# convert region to factor for grouping and aggregation
#stunting.countries$region <- as.factor(stunting.countries$region)

# convert region to factor for grouping and aggregation
#stunting.countries$region <- as.factor(stunting.countries$region)


## take the wide data frame and make it long for visualization:

# gather on year columns
stunting.long <- stunting.countries  %>% 
        gather(year, stunting, `1980`:`2016`) 

# aggregate 
stunting.summary <- aggregate(stunting ~ year + Country.Name, 
                            FUN=mean, na.rm = TRUE, stunting.long)

# fiter for intervals required
world <- c('North America', 'Sub-Saharan Africa', 'South Asia', 'East Asia & Pacific', 
  'Europe & Central Asia','Middle East & North Africa', 'Latin America & Caribbean')

stunting.summary <- stunting.long %>%
        filter(   ( Country.Name %in% world)
                  & ( year %in% c('2000', '2005', '2010', '2015' ))
)


# manually fill missing data from worldbank.org reference
# eu
stunting.summary[2,3] <- 6.6
stunting.summary[9,3] <- 5.2
stunting.summary[16,3] <- 4.4
stunting.summary[23,3] <- 3.7
# na
stunting.summary[5,3] <- 0.7
stunting.summary[12,3] <- 0.6
stunting.summary[19,3] <- 0.6
stunting.summary[26,3] <- 0.5


# below 2 functions taken from https://github.com/jkeirstead/r-slopegraph

tufte_sort <- function(df, x="year", y="value", group="group", method="tufte", min.space=0.05) {
        ## First rename the columns for consistency
        ids <- match(c(x, y, group), names(df))
        df <- df[,ids]
        names(df) <- c("x", "y", "group")
        
        ## Expand grid to ensure every combination has a defined value
        tmp <- expand.grid(x=unique(df$x), group=unique(df$group))
        tmp <- merge(df, tmp, all.y=TRUE)
        df <- mutate(tmp, y=ifelse(is.na(y), 0, y))
        
        ## Cast into a matrix shape and arrange by first column
        require(reshape2)
        tmp <- dcast(df, group ~ x, value.var="y")
        ord <- order(tmp[,2])
        tmp <- tmp[ord,]
        
        min.space <- min.space*diff(range(tmp[,-1]))
        yshift <- numeric(nrow(tmp))
        ## Start at "bottom" row
        ## Repeat for rest of the rows until you hit the top
        for (i in 2:nrow(tmp)) {
                ## Shift subsequent row up by equal space so gap between
                ## two entries is >= minimum
                mat <- as.matrix(tmp[(i-1):i, -1])
                d.min <- min(diff(mat))
                yshift[i] <- ifelse(d.min < min.space, min.space - d.min, 0)
        }
        
        
        tmp <- cbind(tmp, yshift=cumsum(yshift))
        
        scale <- 1
        tmp <- melt(tmp, id=c("group", "yshift"), variable.name="x", value.name="y")
        ## Store these gaps in a separate variable so that they can be scaled ypos = a*yshift + y
        
        tmp <- transform(tmp, ypos=y + scale*yshift)
        return(tmp)
        
}

# to make the plot look nice:
fixed.names <- c("South Asia ", "Sub-Saharan \nAfrica ", "East Asia & \nPacific ", "Middle East & \nNorth Africa ", 
                 "Latin America & \nCaribbean ", "Europe & \nCentral Asia ", "North America ")
# put fixed.names into labels = in below function:
plot_slopegraph <- function(df) {
        ylabs <- subset(df, x==head(x,1))$group
        yvals <- subset(df, x==head(x,1))$ypos
        fontSize <- 3
        gg <- ggplot(df,aes(x=x,y=ypos)) +
                geom_line(aes(group=group),colour="grey80") +
                geom_point(colour="white",size=20) +
                geom_text(aes(label=y), size=fontSize, family = "Calibri (Body)", fontface = "bold") +
                scale_y_continuous(name="", breaks=yvals, labels=rev(fixed.names)) # here - had to reverse order
        return(gg)
}

# call function on summary df
stunting.df <- tufte_sort(stunting.summary, 
                 x="year", 
                 y="stunting", 
                 group="Country.Name", 
                 method="tufte", 
                 min.space=0.05)
# transform years to factor and values rounded
stunting.df <- transform(stunting.df, 
                x=factor(x, levels=c(2000,2005,2010,2015), 
                         labels=c("2000","2005","2010", "2015")), 
                y=round(y, 1))


# plot the slope graph:
plot_slopegraph(stunting.df) + 
        labs(title="World stunting rates (2000 - 2015)",
             subtitle = "Number of children under 5 that are stunted (millions)\n") +
        theme(axis.title=element_blank(),
              axis.ticks = element_blank(),
              plot.title = element_text(hjust=0.5, family = "Calibri (Body)",
                                        face="bold"),
              plot.subtitle = element_text(hjust=0.5, family = "Calibri (Body)",
                                           face="bold"),
              axis.text = element_text(size = 10.5, face="bold", family = "Calibri (Body)"),
              panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
              panel.background = element_blank(), axis.line = element_line(colour = "black"),
              axis.line.x = element_line(color="black", size = 1),
              axis.line.y = element_line(color="black", size = 1))

