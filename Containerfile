FROM fedora:latest
RUN dnf -y update
RUN dnf -y install httpd
WORKDIR /
RUN mkdir structure
RUN chmod 777 structure
RUN useradd --uuid 1001 sync
RUN useradd --uuid 1002 nobody
RUN useradd --uuid 1003 collin
WORKDIR /structure
USER 1001
RUN mkdir sync-work
USER 1002
RUN mkdir nobody-work
USER 0
EXPOSE 80
COPY index.html /var/www/html/index.html
ENTRYPOINT /usr/sbin/httpd -DFOREGROUND
