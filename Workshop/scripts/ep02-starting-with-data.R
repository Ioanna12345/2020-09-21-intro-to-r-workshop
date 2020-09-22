#   _____ _             _   _                        _ _   _       _____        _        
#  / ____| |           | | (_)                      (_| | | |     |  __ \      | |       
# | (___ | |_ __ _ _ __| |_ _ _ __   __ _  __      ___| |_| |__   | |  | | __ _| |_ __ _ 
#  \___ \| __/ _` | '__| __| | '_ \ / _` | \ \ /\ / | | __| '_ \  | |  | |/ _` | __/ _` |
#  ____) | || (_| | |  | |_| | | | | (_| |  \ V  V /| | |_| | | | | |__| | (_| | || (_| |
# |_____/ \__\__,_|_|   \__|_|_| |_|\__, |   \_/\_/ |_|\__|_| |_| |_____/ \__,_|\__\__,_|
#                                    __/ |                                               
#                                   |___/                                                
#
# Based on: https://datacarpentry.org/R-ecology-lesson/02-starting-with-data.html



# Lets download some data (make sure the data folder exists)
download.file(url = "https://ndownloader.figshare.com/files/2292169",
              destfile = "data_raw/portal_data_joined.csv")

# now we will read this "csv" into an R object called "surveys"
surveys <- read.csv("data_raw/portal_data_joined.csv")

# and take a look at it
surveys
head (surveys)
View (surveys)


# BTW, we assumed our data was comma separated, however this might not
# always be the case. So we may been to tell read.csv more about our file.



# So what kind of an R object is "surveys" ?

class(surveys)

# ok - so what are dataframes ?

str (surveys)

# --------
# Exercise
# --------
#
# What is the class of the object surveys?
#
# Answer:
names (surveys)
rownames (surveys)
summary (surveys)

# How many rows and how many columns are in this survey ?
#
# Answer:

# What's the average weight of survey animals
#
#
# Answer:
42.67

# Are there more Birds than Rodents ?
#
#
# Answer:

No

# 
# Topic: Sub-setting



# first element in the first column of the data frame (as a vector)
surveys[1,1]
# first element in the 6th column (as a vector)

surveys [1,6]
# first column of the data frame (as a vector)

surveys[ ,6]

# first column of the data frame (as a data frame)

head (surveys[1])
head (surveys[, 1])
# first row (as a data frame)

surveys [1, ]

# first three elements in the 7th column (as a vector)
surveys[1:3, 7]

# the 3rd row of the data frame (as a data.frame)

surveys[3, ]
# equivalent to head(surveys)
head(surveys)
surveys[1:6, ]

# looking at the 1:6 more closely
1:6
5:10


surveys[ c(1,2,3,4,5,6),  ]
surveys [ c(2,4,6), ]

# we also use other objects to specify the range

rows <- 6
surveys [1:rows, 3]


# Challenge: Using slicing, see if you can produce the same result as:

#tail(surveys)
end <- nrow(surveys)
surveys [34781: nrow(surveys), ]
surveys [(end-5): end, ]

length (surveys[, 1])

# i.e., print just last 6 rows of the surveys dataframe
#
# Solution:



# We can omit (leave out) columns using '-'

surveys[-1]
head (surveys[c( -2, -3, -4, -5)] )
head (surveys [-  (1:3)] )
head (surveys [-  (1:3)] )
# column "names" can be used in place of the column numbers

head (surveys ["month"] )


#
# Topic: Factors (for categorical data)

# eg: ranking: high medium low
# Likert scales: very likey, neutral, unlikely, etc
# Country: Australia, New Zealand

gender <- c("male", "male", "female")
gender <- factor( c("male", "male", "female") )
gender 
class (gender)
levels (gender)
nlevels(gender)

# factors have an order
temperature <- factor ( c("hot", "cold", "hot", "warm"))
temperature [1]
temperature [2]
temperature
levels (temperature)
temperature <- factor ( c("hot", "cold", "hot", "warm"),
                    levels = c( "cold", "warm", "hot") )
levels (temperature)

# Converting factors
as.numeric(temperature)
as.character(temperature)

# can be tricky if the levels are numbers

year <- factor (c(1990, 1983, 1977, 1998, 1990) )
year
as.numeric (year)
as.character (year)

as.numeric (as.character (year) )

# so does our survey data have any factors


#
# Topic:  Dealing with Dates
#

# R has a whole library for dealing with dates ...



# R can concatenated things together using paste()


# 'sep' indicates the character to use to separate each component


# paste() also works for entire columns


# let's save the dates in a new column of our dataframe surveys$date 


# and ask summary() to summarise 


# but what about the "Warning: 129 failed to parse"


