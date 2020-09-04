index="rec2"
url="localhost:9200"
data="$index.json"
recovery="osk_recovery_20200903.txt"
cat $recovery | jq -c --arg index "$index" '.[] | {index: {_index: $index}}, . +=  {"time": (.time | tonumber), "bytes" : (.bytes | tonumber), "bytes_recovered": (.bytes_recovered | tonumber), "bytes_total" : (.bytes_total | tonumber)}' > $data
http -b $url/_bulk < $data > /dev/null
