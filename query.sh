url="localhost:9200/recovery/_search"
curl  -s --location --request GET $url \
--header 'Content-Type: application/json' \
--data-raw '{
  "size": 0, 
  "aggs": {
    "host_name": {
      "terms": {
        "field": "target_name.keyword",
        "size": 20
      },
      "aggs": {
        "taken_time": {
          "sum": {
            "field": "taken"
          }
        }
      }
    }
  }
}' | jq . > result.json
