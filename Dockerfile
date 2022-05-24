FROM openjdk:8
MAINTAINER xiangwei
LABEL name="spingboot-k8s-test-demo" author="xiangwei"
COPY spingboot-k8s-test-demo-1.0.5-SNAPSHOT.jar spingboot-k8s-test-demo-1.0.5-SNAPSHOT.jar
CMD ["java","-jar","spingboot-k8s-test-demo-1.0.5-SNAPSHOT.jar"]
