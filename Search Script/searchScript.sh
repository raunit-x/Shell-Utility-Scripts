#! /bin/bash

read -p "Enter the string you want to search for in the files: " input
read -p "Enter the directory you want the search to take place in: " dir

rm -r ./search-hits # remove the directory called "search-hits"
mkdir ./search-hits  # make a new one

for currFolder in $(find "$dir" -type d) ; 
do 
	for myFile in "$currFolder"/* ;
	do
		if [ -f "$myFile" ]; then
			check=$(grep -ni "$input" "$myFile")
			if [ ! -z "$check" ]; then
				echo "$myFile"
				name_f=$(basename $myFile)
				cp "$myFile" ./search-hits/"$name_f"
				echo "*********************************" >> ./search-hits/"$name_f"
				echo "$check" >> ./search-hits/"$name_f"
			fi
		fi
	done
done
