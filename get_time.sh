hostname_identifier=fgiosk
for time_millis in $(cat result.json | jq -r '.aggregations.target_node.buckets[] | .key, .taken.value' );do
	
	if [[ $time_millis != *${hostname_identifier}* ]]; then
 		 echo "scale=2;${time_millis}/1000/3600" | bc
	else
		echo $time_millis
	fi

done | paste - - | sort -k 1

