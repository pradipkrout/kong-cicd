FROM hbagdi/deck
 
COPY entrypoint.sh /entrypoint.sh

COPY kong /kong

USER root

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT [ "/entrypoint.sh" ]