psid=0

psth=/opt/springboot

javaps=`jps -l | springboot-demo-k8s-cicd-test`
echo "javaps= $javaps"
if [ -n "$javaps" ]; then
   psid=`echo $javaps | awk '{print $1}'`
fi

echo "psid= $psid"
if [ $psid -ne 0 ]; then
  echo "kill -9 $psid"
  kill -9 $psid
fi

nohup java -jar $psth/springboot-demo-k8s-cicd-test-1.0.6-SNAPSHOT.jar >$psth/springboot-demo-log.log 2>&1 &

sleep 5

echo "====================================================="
echo "   springboot-demo-k8s-cicd-test  start successfully"
echo "====================================================="