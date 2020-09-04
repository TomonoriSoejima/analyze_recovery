url="localhost:9200/recovery/_search"
curl  -s --location --request GET $url \
--header 'Content-Type: application/json' \
--data-raw '{
  "size": 0,
  "query": {
    "bool": {
      "must": [],
      "filter": [
        {
          "match_all": {}
        },
        {
          "bool": {
            "should": [
              {
                "match_phrase": {
                  "target_node": "\"fgiosk2elasd015\""
                }
              },
              {
                "match_phrase": {
                  "target_node": "\"fgiosk2elasd016\""
                }
              },
              {
                "match_phrase": {
                  "target_node": "\"fgiosk2elasd017\""
                }
              },
              {
                "match_phrase": {
                  "target_node": "\"fgiosk2elasd018\""
                }
              }
            ],
            "minimum_should_match": 1
          }
        }
      ],
      "should": [],
      "must_not": []
    }
  },
  "aggs": {
    "target_node": {
      "terms": {
        "field": "target_node.keyword",
        "size": 20
      },
      "aggs": {
        "taken": {
          "sum": {
            "field": "taken"
          }
        }
      }
    }
  }
}' | jq . > result.json
