FROM hbagdi/deck
 
COPY entrypoint.sh /entrypoint.sh

USER root

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT [ "/entrypoint.sh" ]