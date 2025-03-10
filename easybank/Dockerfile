FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy Maven files for dependency resolution
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

# Download dependencies (this layer can be cached)
RUN ./mvnw dependency:go-offline -B

# Copy the rest of the application
COPY src ./src

# Build the application
RUN ./mvnw package -DskipTests

# Run the application
ENTRYPOINT ["java", "-jar", "target/*.jar"]
