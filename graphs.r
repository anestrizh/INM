# install.packages('dplyr', repos = "http://cran.us.r-project.org")

library(ggplot2)
library(dplyr)

covid <- read.csv(file='COVID/data.csv', header=TRUE, sep=";", stringsAsFactors=FALSE, fileEncoding="latin1")

head (covid)

# covid <- subset(covid, is.na(IgG)) #тесты пцр
# covid <- covid[covid$dis_date > "2020-01-01",] #отсеиваем некорректные даты

# pcr<-covid[covid$samples_result_id == "ОБНАРУЖЕНО"] #положительные тесты пцр
# pcr <- subset(covid, covid$samples_result_id =="ОБНАРУЖЕНО") #положительные тесты пцр

prog <- count(covid, dis_date)

ggplot(data = prog, aes(x = dis_date, y = freq)) + geom_histogram(stat='identity')+ theme(axis.text.x = element_text(angle = 90))


# ggplot(data = prog, aes(x = dis_date, group = samples_result_id, fill = amples_result_id)) + geom_histogram()
# head (pcr)

