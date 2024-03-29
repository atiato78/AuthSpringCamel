FROM mcr.microsoft.com/java/jre:8u202-zulu-debian9 AS base
EXPOSE 8080
WORKDIR /app

FROM mcr.microsoft.com/java/maven:8u202-zulu-debian9 AS build
WORKDIR /usr/src/app
COPY pom.xml ./
RUN /usr/local/bin/mvn-entrypoint.sh \
    mvn package -Dmaven.test.skip=true -Dcheckstyle.skip=true -Dmaven.javadoc.skip=true --fail-never
COPY . .
RUN mvn package -Dmaven.test.skip=true -Dcheckstyle.skip=true -Dmaven.javadoc.skip=true

FROM base AS final
COPY --from=build /usr/src/app/target/*.jar ./
ENTRYPOINT ["java","-jar","SSec-0.0.1-SNAPSHOT.jar"]