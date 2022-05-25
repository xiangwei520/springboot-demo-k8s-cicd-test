psid=0

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

sleep 5

echo "================================================"
echo "   spingboot-k8s-test-demo stop successfully"
echo "================================================"