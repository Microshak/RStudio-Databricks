FROM rocker/rstudio

RUN apt-get update  
RUN apt-get install -y  build-essential 
RUN apt-get install -y     r-base-dev 
RUN apt-get install -y     r-cran-devtools 
RUN apt-get install -y      apt-transport-https 
RUN apt-get install -y   libssl-dev 
RUN apt-get install -y   libsasl2-dev 
RUN apt-get install -y   openssl 
RUN apt-get install -y   curl 

RUN apt-get install -y openjdk-11-jdk

RUN apt-get install -y  openjdk-8-jdk
RUN  export JAVA_HOME=/usr/lib/jvm/openjdk-11

RUN mkdir app
COPY DatabricksJDBC42.jar /app/DatabricksJDBC42.jar

RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('RJDBC',dep=TRUE)"

RUN Rscript -e  "install.packages('DBI')"
RUN Rscript -e "install.packages('rJava')"

ENV USER="rstudio" PASSWORD="rstudio" ROOT="TRUE"
ENV JAVA_OPTS='-Xmx8g' 
