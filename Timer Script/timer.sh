#! /bin/bash

function count() {
  total=$1
  for ((i=total - 1; i>=0; i--)); 
  do 
  	sleep 1;
  	printf "Time remaining $i secs \r";
  done
  echo -e "\a"
}


echo "Welcome to your timer!"
read -p "Enter the time(in seconds) for the timer: " seconds
count $seconds