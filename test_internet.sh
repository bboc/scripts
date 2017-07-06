echo "Testing internet connection.."
echo "Press [CTRL+C] to stop.."

LASTSTATE="off"
while :
do
	if curl www.google.de -s --connect-timeout 2 >/dev/null ; then
		if [ "$LASTSTATE" == "off" ]; then
			date >>internet-errors
			echo "connection established" >>internet-errors
			LASTSTATE="on"
		fi
	else
		if [ "$LASTSTATE" == "on" ]; then
			echo "=====================================" >>internet-errors
			echo "connection dropped:" >>internet-errors
			date >>internet-errors
			LASTSTATE="off"
		fi
	fi 
	sleep 5
done



