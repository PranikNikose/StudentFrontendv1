# Use Tomcat 9 with JDK 8
FROM tomcat:9.0.111-jdk8

# Remove default ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file into webapps folder
COPY target/StudentFrontend.war /usr/local/tomcat/webapps/StudentFrontend.war

# Copy entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Expose port 8080
EXPOSE 8080

# Use custom entrypoint to dynamically configure API_BASE_URL
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["catalina.sh", "run"]
