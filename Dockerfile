FROM openjdk:17-slim

# Criar usuário seguro
RUN apt-get update && \
    apt-get install -y --no-install-recommends adduser && \
    addgroup --system appgroup && \
    adduser --system --ingroup appgroup appuser && \
    rm -rf /var/lib/apt/lists/*

USER appuser

COPY trackyard-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
