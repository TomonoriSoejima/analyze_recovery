data="bulk.json"
cat recovery.json | jq -c '.[].shards[] | {index: {_index: "recovery"}}, {source_name: .source.name, target_name: .target.name, taken: .total_time_in_millis }' > $data
http -a elastic:changeme localhost:9200/_bulk < $data