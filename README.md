# Usage
## 在contianerXX里面想翻墙怎么办

1. modify config in ss.conf and start.sh
2. docker build -t ambassador .  
3. docker run -d --rm  --privileged  --name ambassador ambassador
4. test by : docker run --rm  --net=container:ambassador contianerXX

## 在k8s里面容器翻墙
1. modify config in ss.conf and start.sh
2. docker build -t container-overwall .
3. docker tag container-overwall:latest hkccr.ccs.tencentyun.com/dature/container-overwall:latest
4. docker push hkccr.ccs.tencentyun.com/dature/container-overwall:latest
5. 在需要翻墙的pod里面添加容器 container-overwall
