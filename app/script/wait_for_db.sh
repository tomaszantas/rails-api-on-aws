#!/bin/bash
# wait-for-mysql.sh
# waits until (but no longer than 60sec) MySQL database is reachable under specific host

apt-get install netcat -y

i=0

echo "Checking database connection..."
echo $DB_HOST

until nc -z -v -w30 $DB_HOST 5432
do
  echo "Waiting for database connection..."
  # wait for 5 seconds before check again
  sleep 5

  ((++i))
  if [ $i -gt 2 ]; then
	echo "ERROR: MySQL is not running!"
	break
  fi

done
