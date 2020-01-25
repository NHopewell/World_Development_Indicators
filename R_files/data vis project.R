#############################
##### Data vis project  #####
##### Part 1            #####
##### Nicholas Hopewell #####
##### 0496633           #####
#############################

### >>> Income brackets - countries - according to World Bank <<<

low.income <- c("Afghanistan", "Benin", "Burkina Faso", "Burundi", 
                "Central African Republic", "Chad",  "Comoros", 
                "Congo Dem. Rep.", "Eritrea", "Ethiopia", "Gambia, The", 
                "Guinea", "Guinea-Bissau", "Haiti", "Korea Dem. People’s Rep.", 
                "Liberia", "Madagascar", "Malawi", "Mali", "Mozambique", 
                "Nepal", "Niger", "Rwanda", "Senegal", "Sierra Leone", 
                "Somalia", "South Sudan", "Tanzania", "Togo", 
                "Uganda", "Zimbabwe")

uprMid.income <- c("Albania", "Algeria", "American Samoa", "Argentina", 
                   "Azerbaijan", "Belarus", "Belize", "Bosnia and Herzegovina", 
                   "Botswana", "Brazil", "Bulgaria", "China", "Colombia", 
                   "Costa Rica", "Croatia", "Cuba", "Dominica", "Dominican Republic",
                   "Ecuador", "Equatorial Guinea", "Fiji", "Gabon", "Grenada", 
                   "Guyana", "Iran, Islamic Rep.", "Iraq", "Jamaica", "Kazakhstan", 
                   "Lebanon", "Libya", "Macedonia, FYR", "Malaysia", "Maldives", 
                   "Marshall Islands", "Mauritius", "Mexico", "Montenegro", 
                   "Namibia", "Nauru", "Panama", "Paraguay", "Peru", "Romania", 
                   "Russian Federation", "Samoa", "Serbia", "South Africa", 
                   "St. Lucia", "St. Vincent and the Grenadines", "Suriname", 
                   "Thailand", "Tonga", "Turkey", "Turkmenistan", "Tuvalu", 
                   "Venezuela, RB")

high.income <- c("Andorra", "Antigua and Barbuda", "Aruba", "Australia", 
                 "Austria", "Bahamas, The", "Bahrain", "Barbados", "Belgium", 
                 "Bermuda", "British Virgin Islands", "Brunei Darussalam", "Canada",
                 "Cayman Islands", "Channel Islands", "Chile", "Curacao", "Cyprus", 
                 "Czech Republic", "Denmark", "Estonia", "Faroe Islands", "Finland", 
                 "France", "French Polynesia", "Germany", "Gibraltar", "Greece",
                 "Greenland", "Guam", "Hong Kong SAR, China", "Hungary", "Iceland", 
                 "Ireland", "Isle of Man", "Israel", "Italy", "Japan", "Korea, Rep.", 
                 "Kuwait", "Latvia", "Liechtenstein", "Lithuania", "Luxembourg", 
                 "Macao SAR, China", "Malta", "Monaco", "Netherlands", "New Caledonia", 
                 "New Zealand", "Northern Mariana Islands", "Norway", "Oman", "Palau", 
                 "Poland", "Portugal", "Puerto Rico", "Qatar", "San Marino", "Saudi Arabia", 
                 "Seychelles", "Singapore", "Sint Maarten (Dutch part)", "Slovak Republic", 
                 "Slovenia", "Spain", "St. Kitts and Nevis", "St. Martin (French part)",
                 "Sweden", "Switzerland", "Trinidad and Tobago", "Turks and Caicos Islands", 
                 "United Arab Emirates","United Kingdom", "United States", "Uruguay", 
                 "Virgin Islands (U.S.)")

lowMid.income <- c("Angola", "Armenia", "Bangladesh", "Bhutan", "Bolivia", "Cabo Verde",
                   "Cambodia", "Cameroon", "Congo, Rep.", "Cote d'Ivoire", "Djibouti", 
                   "Egypt, Arab Rep.", "El Salvador", "Georgia", "Ghana", "Guatemala", 
                   "Honduras", "India", "Indonesia", "Jordan", "Kenya", "Kiribati", 
                   "Kosovo", "Kyrgyz Republic", "Lao PDR", "Lesotho", "Mauritania", 
                   "Micronesia, Fed. Sts.", "Moldova", "Mongolia", "Morocco", "Myanmar", 
                   "Nicaragua", "Nigeria", "Pakistan", "Papua New Guinea", "Philippines", 
                   "Sao Tome and Principe", "Solomon Islands", "Sri Lanka", "Sudan", 
                   "Swaziland", "Syrian Arab Republic", "Tajikistan", "Timor-Leste", 
                   "Tunisia", "Ukraine", "Uzbekistan", "Vanuatu", "Vietnam", "West Bank and Gaza", 
                   "Yemen, Rep.", "Zambia")



#### >>> World regions <<<

south.asia <- c("Afghanistan", "Bangladesh", "Bhutan", "India", "Maldives", "Nepal", 
                "Pakistan", "Sri Lanka")
        
eu.centralAsia <- c("Albania", "Andorra", "Armenia", "Austria", "Azerbaijan", "Belarus", 
                    "Belgium", "Bosnia and Herzegovina", "Bulgaria", "Channel Islands", 
                    "Croatia", "Cyprus", "Czech Republic", "Denmark", "Estonia", "Faroe Islands", 
                    "Finland", "France", "Georgia", "Germany", "Gibraltar", "Greece", "Greenland", 
                    "Hungary", "Iceland", "Ireland", "Isle of Man", "Italy", "Kazakhstan", "Kosovo", 
                    "Kyrgyz Republic", "Latvia", "Liechtenstein", "Lithuania", "Luxembourg", 
                    "Macedonia, FYR", "Moldova", "Monaco", "Montenegro", "Netherlands", "Norway", 
                    "Poland", "Portugal", "Romania", "Russian Federation", 
                    "San Marino", "Serbia", "Slovak Republic", "Slovenia", "Spain", "Sweden", 
                    "Switzerland", "Tajikistan", "Turkey", "Turkmenistan", "Ukraine", "United Kingdom", 
                    "Uzbekistan")

midEast.northAfr <- c("Algeria", "Bahrain", "Djibouti", "Egypt, Arab Rep.", "Iran, Islamic Rep.", 
                      "Iraq", "Israel", "Jordan", "Kuwait", "Lebanon", "Libya", "Malta", 
                      "Morocco", "Oman", "Qatar", "Saudi Arabia", "Syrian Arab Republic", "Tunisia", 
                      "United Arab Emirates", "West Bank and Gaza", "Yemen, Rep.")
        
eastAsia.pacific <- c("American Samoa", "Australia", "Brunei Darussalam", "Cambodia", "China", 
                      "Fiji", "French Polynesia", "Guam", "Hong Kong SAR, China", "Indonesia", 
                      "Japan", "Kiribati", "Korea, Dem. People's Rep.", "Korea, Rep.", 
                      "Lao PDR", "Macao SAR, China", "Malaysia", "Marshall Islands", 
                      "Micronesia, Fed. Sts.", "Mongolia", "Myanmar", "Nauru", "New Caledonia", 
                      "New Zealand", "Northern Mariana Islands", "Palau", "Papua New Guinea", 
                      "Philippines", "Samoa", "Singapore", "Solomon Islands", "Thailand", 
                      "Timor-Leste", "Tonga", "Tuvalu", "Vanuatu", "Vietnam")
        
subSaharan.africa <- c("Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "Cabo Verde", 
                       "Cameroon", "Central African Republic", "Chad", "Comoros", "Congo, Dem. Rep.",
                       "Congo, Rep.", "Cote d'Ivoire", "Equatorial Guinea", "Eritrea", "Ethiopia", 
                       "Gabon", "Gambia, The", "Ghana", "Guinea", "Guinea-Bissau", "Kenya", "Lesotho", 
                       "Liberia", "Madagascar", "Malawi", "Mali", "Mauritania", "Mauritius", 
                       "Mozambique", "Namibia", "Niger", "Nigeria", "Rwanda", "Sao Tome and Principe", 
                       "Senegal", "Seychelles", "Sierra Leone", "Somalia", "South Africa", "South Sudan", 
                       "Sudan", "Swaziland", "Tanzania", "Togo", "Uganda", "Zambia", "Zimbabwe")
        
latinAm.caribbean <- c("Antigua and Barbuda", "Argentina", "Aruba", "Bahamas, The", "Barbados", 
                       "Belize", "Bolivia", "Brazil", "British Virgin Islands", "Cayman Islands", 
                       "Chile", "Colombia", "Costa Rica", "Cuba", "Curacao", "Dominica", "Dominican Republic",
                       "Ecuador", "El Salvador", "Grenada", "Guatemala", "Guyana", "Haiti", "Honduras",
                       "Jamaica", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Puerto Rico", 
                       "Sint Maarten (Dutch part)", "St. Kitts and Nevis", "St. Lucia", 
                       "St. Martin (French part)", "St. Vincent and the Grenadines", "Suriname", 
                       "Trinidad and Tobago", "Turks and Caicos Islands", "Uruguay", "Venezuela, RB", 
                       "Virgin Islands (U.S.)")
        
north.America <- c("Bermuda", "Canada", "United States")
        

#### >>> Global development data sets: <<<

directory <- setwd("C:/Desktop/Data vis project/Data_vis_project/world bank data/world development indicators")

file.paths <- c("/access to essentials", "/birth, fertility and growth", "/corruption", "/disease",
               "/education", "/employment", "/environmental sustainability and pollution", "/gender",
               "/inequality", "/natural disaster")


list.paths <- c()
# automatically generate file paths and store in one object

for (path in file.paths) {
        this.path <- paste0(directory,path)
        list.paths[path] <- this.path
}

#print(as.list(list.paths))
list.paths <- as.list(list.paths)

### world populations + more

root.path <- "C:/Desktop/Data vis project/Data_vis_project/world bank data"
world.data <- read.csv(paste(root.path, paste0("world populations", ".csv"), sep = "/"),
                           header = TRUE)

world.pop.data <- world.data[3313:3496, ]
GINI.index.data <- world.data[737:920, ]
# income share held by highest 10%
income.top10.data <- world.data[737:920, ]


## rename columns





### Access to essentials

essentials.path <- list.paths[[1]]

essentials.sets <- c("access to electricity")

essentials.data <- read.csv(paste(essentials.path, paste0(essentials.sets, ".csv"), sep = "/"), 
                            header = TRUE, na.strings = "..")

# rename columns

# colnames(essentials.data)
essentials.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", "1990", "2000", 
                      seq(2008, 2017))

names(essentials.data) <- essentials.names





### birth, fertility and growth

birth.path <- list.paths[[2]]

birth.growth.sets <- c("Births attended by skilled health staff (% of total)", 
                       "crude birth rate (per 1000 people)",
                      "fertility rates (all years since 1960)",
                      "Prevalence of stunting, height for age (% of children under 5)")

births.professional.data <- read.csv(paste(birth.path, paste0(birth.growth.sets[1], ".csv"), sep = "/"), 
                                     header = TRUE, na.strings = "..")
birth.rate.data <- read.csv(paste(birth.path, paste0(birth.growth.sets[2], ".csv"), sep = "/"), 
                            header = TRUE, na.strings = "..")
fertility.data <- read.csv(paste(birth.path, paste0(birth.growth.sets[3], ".csv"), sep = "/"), 
                           header = TRUE, na.strings = "..")
stunting.data <- read.csv(paste(birth.path, paste0(birth.growth.sets[4], ".csv"), sep = "/"), 
                          header = TRUE, na.strings = "..")

# rename columns 

#colnames(births.professional.data)
birth.names = c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(2008, 2017))
names(births.professional.data) <- birth.names

#colnames(birth.rate.data)
birth.rate.names = c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1980, 2017))
names(birth.rate.data) <- birth.rate.names

#colnames(fertility.data)
fertility.names = c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1960, 2017))
names(fertility.data) <- fertility.names

#colnames(stunting.data)
stunting.names = c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1980, 2017))
names(stunting.data) <- stunting.names






### corruption

corruption.path <- list.paths[[3]]

corruption.sets <- c("corruption indicators all over the world (2002 - 2012)")

corruption.data <- read.csv(paste(corruption.path, paste0(corruption.sets, ".csv"), sep = "/"), 
                            header = TRUE)

# rename columns

#colnames(corruption.data)

old.cols <- colnames(corruption.data[5:ncol(corruption.data)])

clean_cols <- function(columns) {
        
        columns <- gsub("[..]", ".", columns)
        columns <- gsub('.{4}$', '', columns)
        columns <- gsub('â..', "'", columns)
        columns[startsWith(columns, "St")] <- gsub('.{2}$', '', columns[startsWith(columns, "St")])
        columns[startsWith(columns, "St")] <- gsub("[..]", ".", columns[startsWith(columns, "St")])
        
        return (columns)
}

# call function
new.cols <- clean_cols(old.cols)



for (i in 1:length(new.cols)) {
        if (startsWith(new.cols[i], "St") == TRUE) {
                new.cols[i]<- gsub('[.]', ' ', new.cols[i])
        } else {
                new.cols[i] <- gsub('[..]', ' ', new.cols[i])
        }
}

for (i in 1:length(new.cols)) {
        if (endsWith(new.cols[i], " ") == TRUE) {
                new.cols[i]<- trimws(new.cols[i])
        }
}


for (i in 1:length(new.cols)) {
        if (startsWith(new.cols[i], "St") == TRUE) {
                new.cols[i]<- sub('  ', '.', new.cols[i])
        }
}

### fix remaining special cases







### disease

disease.path <- list.paths[[4]]

disease.sets <- c("children (0-14) living with HIV", "children (0-14) newly infected with HIV")

child.hiv.data <- read.csv(paste(disease.path, paste0(disease.sets[1], ".csv"), sep = "/"), 
                           header = TRUE, na.strings = "..")
new.hiv.data <- read.csv(paste(disease.path, paste0(disease.sets[2], ".csv"), sep = "/"), 
                         header = TRUE, na.strings = "..")

## rename columns 

#colnames(child.hiv.data)
child.hiv.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1980, 2017))
names(child.hiv.data) <- child.hiv.names

#colnames(new.hiv.data)
names(new.hiv.data) <- child.hiv.names






### Education

education.path <- list.paths[[5]]

ed.sets <- c("education expenditure % of GNI", "female preprimary school enrollment (% gross)", 
            "female primary school enrollment (% gross)", "female secondary school enrollment (% gross)", 
            "female tertiary school enrollment (% gross)", "male preprimary school enrollment (% gross)",
            "male primary school enrollment (% gross)", "male secondary school enrollment (% gross)",
            "male tertiary school enrollment (% gross)")


ed.expend.data <- read.csv(paste(education.path, paste0(ed.sets[1], ".csv"), sep = "/"), 
                           header = TRUE, na.strings = "..")

# fix encoding:
ed.expend.data$Country.Name <- sub("â€™", "'", ed.expend.data$Country.Name)

fem.pre.data <- read.csv(paste(education.path, paste0(ed.sets[2], ".csv"), sep = "/"), 
                         header = TRUE, na.strings = "..")
fem.pre.data$Country.Name <- sub("â€™", "'", fem.pre.data$Country.Name)

fem.primary.data <- read.csv(paste(education.path, paste0(ed.sets[3], ".csv"), sep = "/"), 
                             header = TRUE, na.strings = "..")
fem.primary.data $Country.Name <- sub("â€™", "'", fem.primary.data$Country.Name)

fem.secondary.data <- read.csv(paste(education.path, paste0(ed.sets[4], ".csv"), sep = "/"), 
                               header = TRUE, na.strings = "..")
fem.secondary.data$Country.Name <- sub("â€™", "'", fem.secondary.data$Country.Name)

fem.tertiary.data <- read.csv(paste(education.path, paste0(ed.sets[5], ".csv"), sep = "/"), 
                              header = TRUE, na.strings = "..")
fem.tertiary.data$Country.Name <- sub("â€™", "'", fem.tertiary.data$Country.Name)


## COMPARE TERTIARY EDUCATION FEMALES TO MALES IN NORTH AMERICA

male.pre.data <- read.csv(paste(education.path, paste0(ed.sets[6], ".csv"), sep = "/"), 
                          header = TRUE, na.strings = "..")
male.primary.data <- read.csv(paste(education.path, paste0(ed.sets[7], ".csv"), sep = "/"), 
                              header = TRUE, na.strings = "..")
male.secondary.data <- read.csv(paste(education.path, paste0(ed.sets[8], ".csv"), sep = "/"), 
                                header = TRUE, na.strings = "..")
male.tertiary.data <- read.csv(paste(education.path, paste0(ed.sets[9], ".csv"), sep = "/"), 
                               header = TRUE, na.strings = "..")
        

## rename columns 

# colnames(ed.expend.data)
ed.expend.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", "1990", "2000", 
                     seq(2008, 2017))
names(ed.expend.data) <- ed.expend.names

# colnames(fem.pre.data)
fem.pre.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1980, 2017))
names(fem.pre.data) <- fem.pre.names

# colnames(fem.primary.data)
fem.primary.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1980, 2017))
names(fem.primary.data) <- fem.primary.names

# colnames(fem.secondary.data)
fem.secondary.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1980, 2017))
names(fem.secondary.data) <- fem.secondary.names

# colnames(fem.tertiary.data)
fem.tertiary.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1980, 2017))
names(fem.tertiary.data) <- fem.tertiary.names

# colnames(male.pre.data)
male.pre.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1980, 2017))
names(male.pre.data) <- male.pre.names 
 
# colnames(male.primary.data)
male.primary.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1980, 2017))
names(male.primary.data) <- male.primary.names 

# colnames(male.secondary.data)
male.secondary.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1980, 2017))
names(male.secondary.data) <- male.secondary.names

# colnames(male.tertiary.data)
male.tertiary.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1980, 2017))
names(male.tertiary.data) <- male.tertiary.names






### employment

employment.path <- list.paths[[6]]

employment.sets <- c("Ratio of female to male labor force participation %", "unemplyement rates over time")

participation.ratio.data <- read.csv(paste(employment.path, paste0(employment.sets[1], ".csv"), sep = "/"), 
                                     header = TRUE, na.strings = "..")
unemploy.rates.data <- read.csv(paste(employment.path, paste0(employment.sets[2], ".csv"), sep = "/"), 
                                header = TRUE, na.strings = "..")

## rename columns

# colnames(participation.ratio.data)
participation.ratio.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", 
                               seq(2008, 2017))
names(participation.ratio.data) <- participation.ratio.names

# colnames(unemploy.rates.data)
unemploy.rates.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", "1990", "2000", 
                          seq(2008, 2017))
names(unemploy.rates.data) <- unemploy.rates.names






### environmental sustainability and pollution

# remove sci notation
options(scipen = 999)

enviro.path <- list.paths[[7]]

enviro.sets <- c("CO2 emissions (metric tons per capita)", "Natural resource depletion (% of GNI)", 
                "Renewable energy consumption (% of total final energy consumption)", 
                "total greenhouse gas emissions (kt of CO2 equivalent)")
        
co2.emiss.data <- read.csv(paste(enviro.path, paste0(enviro.sets[1], ".csv"), sep = "/"), 
                           header = TRUE, na.strings = "..")
resource.depletion.data <- read.csv(paste(enviro.path, paste0(enviro.sets[2], ".csv"), sep = "/"), 
                                    header = TRUE, na.strings = "..")
renewable.consume.data <- read.csv(paste(enviro.path, paste0(enviro.sets[3], ".csv"), sep = "/"), 
                                   header = TRUE, na.strings = "..")
greenhouse.emiss.data <- read.csv(paste(enviro.path, paste0(enviro.sets[4], ".csv"), sep = "/"), 
                                  header = TRUE, na.strings = "..")




# colnames(co2.emiss.data)
co2.emiss.names <- c("Country.Name", "Country.Code", "Series.Name", "Series.Code", seq(1960, 2014))
names(co2.emiss.data) <- co2.emiss.names

# colnames(resource.depletion.data)
# delete first row and bad cols
resource.depletion.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1968, 2017))
names(resource.depletion.data) <- resource.depletion.names
#resource.depletion.data <- resource.depletion.data[-1, c(seq(1,3), seq(5, 19, 2))]


# colnames(renewable.consume.data)
#renewable.consume.data <- renewable.consume.data[-1, c(seq(1,3), seq(5, 15, 2))]
renewable.consume.names <- c("HDI Rank (2015)", "Country", seq(1990, 2010, 5), "2011", "2012")
names(renewable.consume.data) <- renewable.consume.names

# colnames(greenhouse.emiss.data)
greenhouse.emiss.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(1980, 2017))
names(greenhouse.emiss.data) <- greenhouse.emiss.names





### Gender

gender.path <- list.paths[[8]]

gender.sets = c("contraceptive prevalence, any methods (% of women ages 15 - 49)", 
                "Deaths by communicable diseases, ages 15-34, female (% of relevant age group)", 
                "Female employers (% of female employment)", "Male employers (% of male employment)")

contraceptive.data <- read.csv(paste(gender.path, paste0(gender.sets[1], ".csv"), sep = "/"), 
                               header = TRUE, na.strings = "..")
fem.disease.data <- read.csv(paste(gender.path, paste0(gender.sets[2], ".csv"), sep = "/"), 
                             header = TRUE, na.strings = "..")
fem.employers.data <- read.csv(paste(gender.path, paste0(gender.sets[3], ".csv"), sep = "/"), 
                               header = TRUE, na.strings = "..")
male.employers.data <- read.csv(paste(gender.path, paste0(gender.sets[4], ".csv"), sep = "/"), 
                                header = TRUE, na.strings = "..")


## rename columns

# colnames(contraceptive.data)
contraceptive.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(2008, 2017))
names(contraceptive.data) <- contraceptive.names

# colnames(fem.disease.data)
fem.disease.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(2008, 2017))
names(fem.disease.data) <- fem.disease.names

# colnames(fem.employers.data)
fem.employers.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(2008, 2017))
names(fem.employers.data) <- fem.employers.names

# colnames(male.employers.data)
male.employers.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(2008, 2017))
names(male.employers.data) <- male.employers.names





### inequality

inequality.path <- list.paths[[9]]

inequality.sets <- c("income share held by highest 10%", "income share held by lowest 20%", 
                    "poverty headcount ratio at $1.90 a day (% of population)", 
                    "poverty headcount ratio at $3.20 a day (% of population)",
                    "poverty headcount ratio at $5.50 a day (% of population)")

#contraceptive.data <- read.csv(paste(inequality.path, paste0(inequality.sets[1], ".csv"), sep = "/"), 
#                               header = TRUE, na.strings = "..")
#fem.disease.data <- read.csv(paste(inequality.path, paste0(inequality.sets[2], ".csv"), sep = "/"), 
#                             header = TRUE, na.strings = "..")
#fem.employers.data <- read.csv(paste(inequality.path, paste0(inequality.sets[3], ".csv"), sep = "/"), 
#                               header = TRUE, na.strings = "..")
#male.employers.data <- read.csv(paste(inequality.path, paste0(inequality.sets[4], ".csv"), sep = "/"), 
#                                header = TRUE, na.strings = "..")

## rename columns

# colnames(contraceptive.data)
contraceptive.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(2008, 2017))
names(contraceptive.data) <- contraceptive.names

# colnames(fem.disease.data)
fem.disease.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(2008, 2017))
names(fem.disease.data) <- fem.disease.names

# colnames(fem.employers.data)
fem.employers.names <- c("Series.Name", "Series.Code", "Country.Name", "Country.Code", seq(2008, 2017))
names(fem.employers.data) <- fem.employers.names





### natural disaster

disaster.path <- list.paths[[10]]

disaster.sets <- c("damage-costs-from-natural-disasters", "internally-DISPLACED-persons-from-disasters",
                   "number-of-deaths-from-natural-disasters", "number-of-natural-disaster-events")

disaster.damage.data <- read.csv(paste(disaster.path, paste0(disaster.sets[1], ".csv"), sep = "/"), 
                                 header = TRUE)
disaster.displaced.data <- read.csv(paste(disaster.path, paste0(disaster.sets[2], ".csv"), sep = "/"), 
                                    header = TRUE)
disaster.deaths.data <- read.csv(paste(disaster.path, paste0(disaster.sets[3], ".csv"), sep = "/"), 
                                 header = TRUE)
disaster.occurence.data <- read.csv(paste(disaster.path, paste0(disaster.sets[4], ".csv"), sep = "/"), 
                                    header = TRUE)

## rename columns 

#colnames(disaster.damage.data)
names(disaster.damage.data)[4] <- "Total.economic.damage"
#colnames(disaster.displaced.data)
names(disaster.displaced.data)[4] <- "Internally.displaced.persons"
#colnames(disaster.deaths.data)
names(disaster.deaths.data)[4] <- "Total.deaths"
#colnames(disaster.occurence.data)
names(disaster.occurence.data)[4] <- "Number.of.disasters"

