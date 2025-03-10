FROM eclipse-temurin:17-jdk

# Install Maven
RUN apt-get update && apt-get install -y maven

WORKDIR /app

# Copy Maven configuration
COPY pom.xml .

# Download dependencies (this layer can be cached)
RUN mvn dependency:go-offline -B

# Copy the rest of the application
COPY src ./src

# Build the application
RUN mvn package -DskipTests

# Run the application
ENTRYPOINT ["java", "-jar", "target/*.jar"]
