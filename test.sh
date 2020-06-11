# list of sample jq commands used to analye data
# cat recovery.json | jq keys
# cat recovery.json | jq '.["log-kscfw-ksc213-2020.03"].shards | length'

recovery_file="recovery.json"
file="top5.txt"
for i in $(cat $file); do
    echo $i
    echo "cat $recovery_file | jq '.[$i].shards | length'"
    # cat $recovery_file | jq '.[$i].shards | length'
done