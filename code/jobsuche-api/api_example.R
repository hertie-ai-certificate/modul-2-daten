#----------------
# Simple Example
#----------------

# Tapping Arbeitsagentur Jobboerse
# https://jobsuche.api.bund.dev/


library(tidyverse)
library(jsonlite)
library(httr)
library(png)

# API ID
clientId="jobboerse-jobsuche"


# Endpoints
url="https://rest.arbeitsagentur.de/jobboerse/jobsuche-service/pc/v4/app/jobs?angebotsart=1"
url="https://rest.arbeitsagentur.de/jobboerse/jobsuche-service/pc/v4/jobs?angebotsart=1"

# Request
data_request=httr::GET(url=url, httr::add_headers(.headers=c("X-API-Key"=clientId)),
        config=httr::config(connecttimeout=60))
data_request
data=httr::content(data_request, as = "text")

# Parse from JSON
json_parsed <- fromJSON(data)
berufe_counts_list <- json_parsed$facetten$beruf$counts
dat <- as.data.frame(berufe_counts_list)


# Export
writeLines(jsonlite::toJSON(data$facetten,pretty=TRUE,auto_unbox=TRUE),paste0(Sys.Date(),"_jobsuche_facetten.json"))


# Fun with Logos
urlLogo="https://rest.arbeitsagentur.de/jobboerse/jobsuche-service/ed/v1/arbeitgeberlogo/arJ0dxbYlPFXeMuZtdZzooRdCOnK2TjUXjLQlkBr-Ew="
dataLogo=httr::content(httr::GET(url=urlLogo, httr::add_headers(.headers=c("X-API-Key"=clientId)), config=httr::config(connecttimeout=60)))


