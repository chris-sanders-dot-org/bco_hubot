#!/bin/bash
# hubot
# chkconfig: 345 20 80
# description: hubot
# processname: hubot

# REFERENCES:
# http://werxltd.com/wp/2012/01/05/simple-init-d-script-template/
# https://gist.github.com/linickx/3692156

# This script assumes you have a user called "nagra" on your system
#and that hubot is installed in /home/nagra/nagra

# Save Environement Variables in the DAEMON script itself.
#The "service" and "/etc/init.d/cmd" commands strip them otherwise.

DAEMON="/home/nagra/nagra/bin/hubot"
DAEMONOPTS="--name nagra --adapter irc"

NAME=nagra
USER=nagra
DESC="nagra"
PIDFILE=/home/nagra/nagra/bin/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME
LOG_DIR=/home/nagra/nagra/bin/nagra.log

case "$1" in
start)
	printf "%-50s" "Starting $DESC..."
	PID=`runuser -c "$DAEMON $DAEMONOPTS" - $USER  >> $LOG_DIR 2>&1 & echo $!`
	#echo "Saving PID" $PID " to " $PIDFILE
        if [ -z $PID ]; then
            printf "%s\n" "Fail"
        else
            echo $PID > $PIDFILE
            printf "%s\n" "Ok"
        fi
;;
status)
        printf "%-50s" "Checking $DESC..."
        if [ -f $PIDFILE ]; then
            PID=`cat $PIDFILE`
            if [ -z "`ps axf | grep ${PID} | grep -v grep`" ]; then
                printf "%s\n" "Process dead but pidfile exists"
            else
                echo "Running"
            fi
        else
            printf "%s\n" "Service not running"
        fi
;;
stop)
        printf "%-50s" "Stopping $DESC"
            PID=`cat $PIDFILE`
        if [ -f $PIDFILE ]; then
            kill $PID
            printf "%s\n" "Ok"
            rm -f $PIDFILE
        else
            printf "%s\n" "pidfile not found"
        fi
;;

restart)
  	$0 stop
		# Only need stop.  Service will be restarted by monit automatically.
		# Without this, it's possible to end up with 2 hubot processes running at the same time.
		#sleep 5
  	#$0 start
;;

*)
        echo "Usage: $0 {status|start|stop|restart}"
        exit 1
esac
