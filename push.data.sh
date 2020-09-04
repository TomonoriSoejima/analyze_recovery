
url="localhost:9200/recovery"
curl -s --location --request PUT $url \
--header 'Content-Type: application/json' \
--data-raw '{
    "mappings" : {
      "properties" : {
        "source_node" : {
          "type" : "text",
          "fields" : {
            "keyword" : {
              "type" : "keyword",
              "ignore_above" : 256
            }
          }
        },
        "taken" : {
          "type" : "long"
        },
        "target_node" : {
          "type" : "text",
          "fields" : {
            "keyword" : {
              "type" : "keyword",
              "ignore_above" : 256
            }
          }
        }
      }
    }
} '



data="bulk.json"
recovery="osk_recovery_20200903.txt"
cat $recovery | jq -c '.[] | {index: {_index: "recovery"}}, {source_node: .source_node, target_node: .target_node, taken: .time }' > $data
http localhost:9200/_bulk < $data
