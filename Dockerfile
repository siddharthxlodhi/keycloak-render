FROM quay.io/keycloak/keycloak:24.0.1

ENV KC_DB=postgres

RUN /opt/keycloak/bin/kc.sh build

EXPOSE 10000

CMD ["start-dev", "--http-port=10000", "--http-host=0.0.0.0"]
