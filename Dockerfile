FROM quay.io/keycloak/keycloak:24.0.1

ENV KC_DB=postgres

RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080

CMD /bin/sh -c "/opt/keycloak/bin/kc.sh start-dev --http-port ${PORT} --http-host 0.0.0.0"
