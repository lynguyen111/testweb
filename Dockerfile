# Build stage: Compile code and build WAR using Maven
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
# Tải trước các thư viện (dependencies)
RUN mvn dependency:go-offline
# Copy mã nguồn vào
COPY src ./src
# Build file WAR (bỏ qua test nếu có)
RUN mvn clean package -DskipTests

# Run stage: Chạy ứng dụng trên Tomcat
FROM tomcat:9.0-jdk17
# Xóa các app mặc định của Tomcat để dọn dẹp
RUN rm -rf /usr/local/tomcat/webapps/*
# Copy file WAR từ bước build sang thư mục webapps của Tomcat và đổi tên thành ROOT.war để web chạy ở đường dẫn gốc (/)
COPY --from=build /app/target/cnw.war /usr/local/tomcat/webapps/ROOT.war
# Mở port 8080 (Render mặc định chạy Web Service)
EXPOSE 8080
# Lệnh khởi chạy Tomcat
CMD ["catalina.sh", "run"]
