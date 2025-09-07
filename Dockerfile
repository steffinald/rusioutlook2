# Use official Tomcat with JDK 17
FROM tomcat:10.1-jdk21-temurin

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file into Tomcat
# (Maven usually generates WAR in target/)
COPY rusioutlook2.war /usr/local/tomcat/webapps/ROOT.war

# Expose Render's port (8080)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]