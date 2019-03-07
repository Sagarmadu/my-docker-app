FROM ubuntu:16.04
MAINTAINER Sagar

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean

RUN  apt-get update && \
   echo "mysql-server-5.7 mysql-server/root_password password root" | debconf-set-selections && \
   echo "mysql-server-5.7 mysql-server/root_password_again password root" | debconf-set-selections && \
   apt-get -y install mysql-server-5.7

RUN curl -O http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.1/bin/apache-tomcat-8.0.1.tar.gz
RUN tar xzf apache-tomcat-8.0.1.tar.gz

COPY mysql_import_schema.sh /tmp/
COPY data.sql /tmp/
COPY ./loginMysql.war apache-tomcat-8.0.1/webapps/

CMD /tmp/mysql_import_schema.sh && apache-tomcat-8.0.1/bin/startup.sh && tail -f apache-tomcat-8.0.1/logs/catalina.out
EXPOSE 8080
