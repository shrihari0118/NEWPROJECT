FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y default-jdk wget curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.40/bin/apache-tomcat-10.1.40.tar.gz && \
    tar -xvzf apache-tomcat-10.1.40.tar.gz && \
    mv apache-tomcat-10.1.40/* /opt/tomcat/ && \
    rm -rf apache-tomcat-10.1.40 apache-tomcat-10.1.40.tar.gz

EXPOSE 8095
COPY index.html /opt/tomcat/webapps/ROOT/index.html
RUN chmod +x /opt/tomcat/bin/*.sh
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
