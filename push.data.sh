data="bulk.json"
recovery="osk_recovery_20200903.txt"
cat $recovery | jq -c '.[] | {index: {_index: "recovery"}}, {source_node: .source_node, target_node: .target_node, taken:  (.time | tonumber) }' > $data
http localhost:9200/_bulk < $data
