# Usa una imagen base de Java
FROM openjdk:8-jdk-alpine

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo pom.xml y el código fuente
COPY pom.xml .
COPY src ./src

# Compila la aplicación
RUN ./mvnw package -DskipTests

# Copia el jar generado al contenedor
COPY target/*.jar app.jar

# Establece el comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
