# --- STAGE 1: Build the Maven project ---
FROM maven:3.8.5-openjdk-11 AS build
WORKDIR /app

# Copy your source code and pom.xml
COPY pom.xml .
COPY src ./src

# Package the application (this generates the .war file)
RUN mvn clean package -DskipTests

# --- STAGE 2: Deploy to Tomcat ---
FROM tomcat:9.0-jdk11-openjdk-slim
WORKDIR /usr/local/tomcat

# Remove default Tomcat webapps
RUN rm -rf ./webapps/*

# Copy the compiled WAR file from the build stage 
# Note: If your pom.xml specifies a finalName, adjust 'HotelBookingSystem.war' accordingly
COPY --from=build /app/target/HotelBookingSystem.war ./webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
