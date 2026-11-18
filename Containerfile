FROM fedora:latest
RUN dnf -y update
RUN dnf -y install httpd
WORKDIR /
RUN mkdir structure
RUN chmod 777 structure
RUN useradd --uid 1001 collin
WORKDIR /structure
USER sync
RUN mkdir sync-work
USER nobody
RUN mkdir nobody-work
USER 0
EXPOSE 80
COPY index.html /var/www/html/index.html
ENTRYPOINT /usr/sbin/httpd -DFOREGROUND
