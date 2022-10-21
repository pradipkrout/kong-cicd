FROM kong/deck:v1.15.1
 
COPY entrypoint.sh /entrypoint.sh

COPY kong /kong

USER root

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT [ "/entrypoint.sh" ]