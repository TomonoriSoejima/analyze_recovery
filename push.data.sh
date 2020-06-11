# list of sample jq commands used to analye data
# cat recovery.json | jq keys
# cat recovery.json | jq '.["log-kscfw-ksc213-2020.03"].shards | length'


# get all the source and this is all I need for now.
# let's bulk it!
data="bulk.json"
cat recovery.json | jq -c '.[].shards[] | {index: {_index: "recovery"}}, {name: .target.name, taken: .total_time_in_millis }' > $data

http -a elastic:changeme localhost:9200/_bulk < $data


# cat result.json | jq '.aggregations.host_name.buckets[] | .key, .taken_time.value'

# cat result.json | jq '.aggregations.host_name.buckets[] | .taken_time.value'  