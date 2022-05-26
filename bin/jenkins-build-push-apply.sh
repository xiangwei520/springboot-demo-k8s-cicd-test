ssh -f root@192.168.109.102 'kubectl delete -f /opt/springboot/springboot-demo.yaml'
echo "kubectl delete springboot-demo.yaml ok!"
sleep 5
ssh -f root@192.168.109.102 'rm -rf /opt/springboot/*'

rsync /root/.jenkins/workspace/springboot-demo-k8s-cicd-test/target/springboot-demo-k8s-cicd-test-1.0.6-SNAPSHOT.jar root@192.168.109.102:/opt/springboot/
rsync /root/.jenkins/workspace/springboot-demo-k8s-cicd-test/Dockerfile root@192.168.109.102:/opt/springboot/
rsync /root/.jenkins/workspace/springboot-demo-k8s-cicd-test/bin/springboot-demo.yaml root@192.168.109.102:/opt/springboot/

ssh root@192.168.109.102 'docker rmi $(docker images | grep "springboot-demo-k8s-cicd-test" | awk '{print $3}') ; echo "docker rmi old images ok!" ; docker build -t registry.cn-hangzhou.aliyuncs.com/xiangwei-public/springboot-demo-k8s-cicd-test:1.0.6-SNAPSHOT /opt/springboot/. ; echo "docker build ok!" ; docker push registry.cn-hangzhou.aliyuncs.com/xiangwei-public/springboot-demo-k8s-cicd-test:1.0.6-SNAPSHOT ; echo "docker push ok!" ; kubectl apply -f /opt/springboot/springboot-demo.yaml ; echo "kubectl apply springboot-demo.yaml ok!" ; rm -rf /opt/springboot/springboot-demo-k8s-cicd-test-1.0.6-SNAPSHOT.jar ; rm -rf /opt/springboot/Dockerfile'
