FROM quay.io/keycloak/keycloak:24.0.1

# Set DB vendor
ENV KC_DB=postgres

# Set admin credentials (override in Render env if needed)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Build Keycloak
RUN /opt/keycloak/bin/kc.sh build

# Expose the port Render expects
EXPOSE 10000

# Start Keycloak on port 10000, bind all interfaces, disable frame options for iframe, enable preview features for more config options
CMD ["start-dev", "--http-port=10000", "--http-host=0.0.0.0", "--features=preview", "--spi-x-frame-options-enabled=false"]
