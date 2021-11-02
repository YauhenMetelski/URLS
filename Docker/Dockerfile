FROM node:14-alpine as build_j2j_node
LABEL stage=build-node-j2j
COPY ./client .
RUN npm i -g angular-cli
RUN npm install --legacy-peer-deps
RUN ng update --all --force
RUN npm run build

FROM gradle:7.2.0-jdk11 as build_j2j
LABEL stage=build-java-j2j
COPY --from=build_j2j_node ./dist ./client/dist
COPY ./src ./src
COPY ./config ./config
COPY ./bin ./bin
COPY ./database ./database
COPY ./build.gradle .
COPY ./gradle.properties .
COPY ./quality-gate-task.gradle .
COPY ./settings.gradle .
RUN gradle build


FROM openjdk:11-jdk
COPY --from=build_j2j ./distribution .
ENTRYPOINT ["java", "-jar","/libs/j2j-5.2.2.jar",">", "/dev/null 2>&1&"]
