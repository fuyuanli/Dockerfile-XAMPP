FROM ubuntu:16.04
RUN sed -i 's/archive.ubuntu.com/tw.archive.ubuntu.com/g' \
    /etc/apt/sources.list
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install wget net-tools
RUN wget https://www.apachefriends.org/xampp-files/7.0.5/xampp-linux-x64-7.0.5-0-installer.run
RUN chmod +x xampp-linux-x64-7.0.5-0-installer.run
RUN ./xampp-linux-x64-7.0.5-0-installer.run
RUN mv /opt/lampp/etc/extra/httpd-xampp.conf /opt/lampp/etc/extra/httpd-xampp.conf.bak
RUN echo "export PATH=\$PATH:/opt/lampp/bin/" >> /root/.bashrc
RUN echo "export TERM=dumb" >> /root/.bashrc
ADD httpd-xampp.conf /opt/lampp/etc/extra/httpd-xampp.conf
VOLUME  ["/opt/lampp/htdocs/"]
EXPOSE 80 443 3306
CMD /opt/lampp/lampp start && tail -F /opt/lampp/logs/error_log
