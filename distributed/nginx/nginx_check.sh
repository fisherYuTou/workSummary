 #!/bin/bash  


if [ "$(ps -ef | grep "nginx: master process"| grep -v grep )" == "" ]  
 then  
    nginx ||  killall keepalived
 else  
    echo "nginx is running"  
fi   
