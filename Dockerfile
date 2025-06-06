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

# Start Keycloak and configure for proxy/iframe compatibility
CMD ["start-dev", "--http-port=10000", "--http-host=0.0.0.0", "--features=preview", "--spi-x-frame-options-enabled=false", "--proxy=edge", "--hostname=keycloak-render-t785.onrender.com", "--hostname-strict=false", "--hostname-strict-https=false"]
