FROM openjdk:8
MAINTAINER xiangwei
LABEL name="springboot-demo-k8s-cicd-test" author="xiangwei"
COPY springboot-demo-k8s-cicd-test-1.0.5-SNAPSHOT.jar springboot-demo-k8s-cicd-test-1.0.5-SNAPSHOT.jar
CMD ["java","-jar","springboot-demo-k8s-cicd-test-1.0.5-SNAPSHOT.jar"]
