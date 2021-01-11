FROM rocker/shiny:3.5.1

RUN apt-get update && apt-get install -y \
libssl-dev \
libxml2-dev \
libudunits2-dev \
libpq-dev \
libgit2-dev


RUN R -e "install.packages(c('hms','devtools'))"

RUN R -e "require(devtools); install_version('shinydashboard', version = '0.7.1', dependencies= T)"
RUN R -e "require(devtools); install_version('shiny', version = '1.4.0', dependencies= T, repos='http://cran.us.r-project.org')"

RUN R -e "require(devtools); install_version('tidyverse', version = '1.3.0', dependencies= T, repos='http://cran.us.r-project.org')"
#RUN R -e "require(devtools); install_version('plotly', version = '4.9.1', dependencies= T, repos='http://cran.us.r-project.org')"


# RUN r -e 'install.packages("shinydashboard", dependencies=TRUE)'
#RUN r -e 'install.packages("tidyverse", dependencies=TRUE)'
# RUN r -e 'install.packages("lubridate", dependencies=TRUE)'
RUN r -e 'install.packages("ggalluvial", dependencies=TRUE)'
# RUN r -e 'install.packages("dbplyr", dependencies=TRUE)'
RUN r -e 'install.packages("plotly", dependencies=TRUE)'
RUN r -e 'install.packages("RPostgreSQL", dependencies=TRUE)'
RUN r -e 'install.packages("writexl", dependencies=TRUE)'

ADD shiny-server.conf /etc/shiny-server/
