for time_millis in $(cat result.json | jq '.aggregations.host_name.buckets[] | .key, .taken_time.value' );do
	
	if [[ $time_millis != *"ksc"* ]]; then
 		 echo "scale=2;${time_millis}/1000/3600" | bc
	else
		echo $time_millis
	fi

done | paste - - | sort -k 1

