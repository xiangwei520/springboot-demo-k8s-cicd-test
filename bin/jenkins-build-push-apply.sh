rsync /root/.jenkins/workspace/springboot-demo-k8s-cicd-test-deploy/target/springboot-demo-k8s-cicd-test-1.1.0-RELEASE.jar root@192.168.109.102:/opt/springboot/
rsync /root/.jenkins/workspace/springboot-demo-k8s-cicd-test-deploy/Dockerfile root@192.168.109.102:/opt/springboot/
rsync /root/.jenkins/workspace/springboot-demo-k8s-cicd-test-deploy/bin/springboot-demo.yaml root@192.168.109.102:/opt/springboot/
ssh root@192.168.109.102 'docker rmi $(docker images | grep "springboot-demo-k8s-cicd-test" | awk '{print $3}') ; echo "docker rmi old images ok!" ; docker build -t registry.cn-hangzhou.aliyuncs.com/xiangwei-public/springboot-demo-k8s-cicd-test:1.1.0-RELEASE /opt/springboot/. ; echo "docker build ok!" ; docker push registry.cn-hangzhou.aliyuncs.com/xiangwei-public/springboot-demo-k8s-cicd-test:1.1.0-RELEASE ; echo "docker push ok!" ; kubectl apply -f /opt/springboot/springboot-demo.yaml ; echo "kubectl apply springboot-demo.yaml ok!" ; rm -rf /opt/springboot/springboot-demo-k8s-cicd-test-1.1.0-RELEASE.jar ; rm -rf /opt/springboot/Dockerfile'
