recovery="osk_recovery_20200903.txt"
nodes=(fgiosk2elasd015 fgiosk2elasd016 fgiosk2elasd017 fgiosk2elasd018)

for node in "${nodes[@]}"; do
    # echo $node
    recovered_shard=$(cat $recovery | jq --arg v "$node"  '.[] | select (.target_node == $v)' | jq -s '. | length')
    echo $recovered_shard shards recovered at $node 
done

for node in "${nodes[@]}"; do
    echo $node
    cat $recovery | jq --arg v "$node"  '.[] | select (.target_node == $v)' | jq  -c '{index, shard}'
done

