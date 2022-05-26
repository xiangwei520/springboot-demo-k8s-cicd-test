psid=0

javaps=`jps -l | grep springboot-demo-k8s-cicd-test`
echo "javaps= $javaps"
if [ -n "$javaps" ]; then
   psid=`echo $javaps | awk '{print $1}'`
fi

echo "psid= $psid"
if [ $psid -ne 0 ]; then
  echo "kill -9 $psid"
  kill -9 $psid
fi

sleep 5

echo "==================================================="
echo "   springboot-demo-k8s-cicd-test stop successfully"
echo "==================================================="