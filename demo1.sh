#create a file with filenames sorted by time
ls -r --sort=time > filenames.txt

#changing filenames to sorted indexes
i=0
for x in $(cat filenames.txt); do
	if [ $x != "outputFilenames.sh" ] && [ $x != "filenames.txt" ];
		then
		#finding suitable name
		newName="IMG_";
		if [ $i -lt 10 ]
			then
			newName=${newName}0000
		elif [ $i -lt 100 ]
			then
			newName=${newName}000
		elif [ $i -lt 1000 ]
			then
			newName=${newName}00
		elif [ $i -lt 10000 ]
			then
			newName=${newName}0
		elif [ $i -gt 99999 ]
			then
			echo "Too many files, unexpected behaviour might occur"
		fi
		newName=${newName}${i}
		echo "renaming file number $x to the name $newName";
		#mv $x $newName
		i=$((i+1))
	fi
done

#removing filenames.txt
rm filenames.txt
