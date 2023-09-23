ARG KEYCLOAK_USER
ARG KEYCLOAK_PASSWORD
ARG DATABASE_URL	
ARG DATABASE_USERNAME
ARG DATABASE_PASSWORD
ARG KEYCLOAK_VERSION=22.0.3

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION}
WORKDIR /opt/keycloak

ENV KEYCLOAK_ADMIN=$KEYCLOAK_USER
ENV KEYCLOAK_ADMIN_PASSWORD=$KEYCLOAK_PASSWORD
ENV KEYCLOAK_PASSWORD=$KEYCLOAK_PASSWORD
ENV KEYCLOAK_USER=$KEYCLOAK_USER
ENV PROXY_ADDRESS_FORWARDING=true
ENV DB_URL=$DATABASE_URL
ENV DB_USERNAME=$DATABASE_USERNAME
ENV DB_PASSWORD=$DATABASE_PASSWORD
		
CMD ["start", "--optimized", "--hostname-strict=false", "--http-port=$PORT", "--proxy=edge", "--db=postgres", "--db-url=$DB_URL", "--db-username=$DB_USERNAME", "--db-password=$DB_PASSWORD", "--features=\"preview,scripts\""]