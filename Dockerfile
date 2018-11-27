FROM rocker/shiny:3.5.1

RUN apt-get update && apt-get install -y \
libssl-dev \
libxml2-dev \
libudunits2-dev \
libpq-dev

RUN r -e 'install.packages("shinydashboard", dependencies=TRUE)'
RUN r -e 'install.packages("tidyverse", dependencies=TRUE)'
# RUN r -e 'install.packages("lubridate", dependencies=TRUE)'
RUN r -e 'install.packages("ggalluvial", dependencies=TRUE)'
# RUN r -e 'install.packages("dbplyr", dependencies=TRUE)'
RUN r -e 'install.packages("plotly", dependencies=TRUE)'
RUN r -e 'install.packages("RPostgreSQL", dependencies=TRUE)'

ADD shiny-server.conf /etc/shiny-server/
