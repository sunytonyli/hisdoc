#!/bin/bash

APP_HOME=/home/hisuser/www/his
APP_NAME=cyhis-0.0.1-SNAPSHOT.jar

usage() {
    echo "Usage: sh boot [APP_NAME] [start|stop|restart|status]"
    exit 1
}

is_exist(){
        PID=$(ps -ef |grep ${APP_NAME} | grep -v $0 |grep -v grep |awk '{print $2}')
        if [ -z "${PID}" ]; then
                return 1
        else
                return 0
        fi
}

start(){
        is_exist
        if [ $? -eq "0" ]; then
                echo "${APP_NAME} is already running, PID=${PID}"
        else    
                nohup java -jar ${APP_HOME}/${APP_NAME} >/dev/null 2>&1 &
                PID=$(echo $!)
                echo "${APP_NAME} start success, PID=$!"
        fi
}

stop(){
        is_exist
        if [ $? -eq "0" ]; then
                kill -9 ${PID}
                echo "${APP_NAME} process stop, PID=${PID}"
        else    
                echo "There is not the process of ${APP_NAME}"
        fi
}

restart(){
        stop
        start
}

status(){
        is_exist
        if [ $? -eq "0" ]; then
                echo "${APP_NAME} is running, PID=${PID}"
        else    
                echo "There is not the process of ${APP_NAME}"
        fi
}

case $2 in
"start")
        start
        ;;
"stop")
        stop
        ;;
"restart")
        restart
        ;;
"status")
       status
        ;;
	*)
	usage
	;;
esac
exit 0