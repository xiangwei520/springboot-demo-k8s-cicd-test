psid=0

psth=/opt/springboot

javaps=`jps -l | grep spingboot-k8s-test-demo`
echo "javaps= $javaps"
if [ -n "$javaps" ]; then
   psid=`echo $javaps | awk '{print $1}'`
fi

echo "psid= $psid"
if [ $psid -ne 0 ]; then
  echo "kill -9 $psid"
  kill -9 $psid
fi

nohup java -jar $psth/spingboot-k8s-test-demo-1.0.5-SNAPSHOT.jar >$psth/springboot-demo-log.log 2>&1 &

sleep 5

echo "=================================================="
echo "   spingboot-k8s-test-demo  start successfully"
echo "=================================================="