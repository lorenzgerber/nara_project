#!/bin/bash
counter=$1

while IFS= read -r -d $'\0' file; do

if [[ $file =~ \.CDF$ ]]; then


    if [ "$counter" -lt 10 ]; then
	current="00$counter"
	dirname="${file%/*}/"
	#echo $dirname$current.CDF
        #echo $file
	echo -e "$file \t $dirname$current.CDF" >> filetable.txt
        mv $file $dirname$current.CDF
	counter=$((counter+1))
    else
	if [ "$counter" -lt 100 ]; then
	    current="0$counter"
	    dirname="${file%/*}/"
	    #echo $dirname$current.CDF
	    #echo $file
	    echo -e "$file \t $dirname$current.CDF" >> filetable.txt 
	    mv $file $dirname$current.CDF
	    counter=$((counter+1))
	else
	    #echo "$1"
	    #echo $file
	    current=$counter
	    dirname="${file%/*}/"
	    echo -e "$file \t $dirname$current.CDF" >> filetable.txt
	    mv $file $dirname$current.CDF
	    counter=$((counter+1))
	fi
    fi
fi

#    dirname="${file%/*}/"
#    basename="${file:${#dirname}}"
#    echo "$file" "$dirname${basename%.*}_$basename"
done < <(find . -type f -print0)