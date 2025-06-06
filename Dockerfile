FROM quay.io/keycloak/keycloak:24.0.1

# Set DB vendor
ENV KC_DB=postgres

# Set admin credentials (you can override these in Render environment variables)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Build Keycloak
RUN /opt/keycloak/bin/kc.sh build

# Expose the default port Render expects
EXPOSE 10000

# Start Keycloak on the correct port and bind to 0.0.0.0
CMD ["start-dev", "--http-port=10000", "--http-host=0.0.0.0"]
