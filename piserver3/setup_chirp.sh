
AUTH="Grpc-Metadata-Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjaGlycHN0YWNrIiwiaXNzIjoiY2hpcnBzdGFjayIsInN1YiI6IjkzMjUzZjg5LWYwNzYtNDM1Yi05OTU5LWU0ZWRhNmU4OTg2YSIsInR5cCI6ImtleSJ9.DAUeezHMGN1m7mmMXOqkbr3uro0y8sHkIQ9wHrCstEM"

KEY="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjaGlycHN0YWNrIiwiaXNzIjoiY2hpcnBzdGFjayIsInN1YiI6IjkzMjUzZjg5LWYwNzYtNDM1Yi05OTU5LWU0ZWRhNmU4OTg2YSIsInR5cCI6ImtleSJ9.DAUeezHMGN1m7mmMXOqkbr3uro0y8sHkIQ9wHrCstEM"
AUTH="Grpc-Metadata-Authorization: Bearer "$KEY


curl -X 'POST' \
  'http://piserver3:8090/api/tenants' \
  -H 'accept: application/json' \
  -H "${AUTH}" \
  -H 'Content-Type: application/json' \
  -d '{
  "tenant": {
    "canHaveGateways": true,
    "description": "my tenant",
    "id": "1",
    "maxDeviceCount": 0,
    "maxGatewayCount": 0,
    "name": "tenant1",
    "privateGatewaysDown": true,
    "privateGatewaysUp": true,
    "tags": {
      "additionalProp1": "string",
      "additionalProp2": "string",
      "additionalProp3": "string"
    }
  }
}'

res={ "id": "48a2aa5d-287b-420b-9c07-54c3ebe16369" }


curl -X 'POST' \
  'http://piserver3:8090/api/applications' \
  -H 'accept: application/json' \
  -H 'Grpc-Metadata-Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjaGlycHN0YWNrIiwiaXNzIjoiY2hpcnBzdGFjayIsInN1YiI6IjkzMjUzZjg5LWYwNzYtNDM1Yi05OTU5LWU0ZWRhNmU4OTg2YSIsInR5cCI6ImtleSJ9.DAUeezHMGN1m7mmMXOqkbr3uro0y8sHkIQ9wHrCstEM' \
  -H 'Content-Type: application/json' \
  -d '{
  "application": {
    "description": "app1",
    "name": "app1",
    "tags": {
      "additionalProp1": "string",
      "additionalProp2": "string",
      "additionalProp3": "string"
    },
    "tenantId": "48a2aa5d-287b-420b-9c07-54c3ebe16369"
  }
}'
res={"id":"d2a445af-08c1-408c-8d5e-1ecc18fbba26"}





curl -X 'POST' \
  'http://piserver3:8090/api/gateways' \
  -H 'accept: application/json' \
  -H 'Grpc-Metadata-Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjaGlycHN0YWNrIiwiaXNzIjoiY2hpcnBzdGFjayIsInN1YiI6IjkzMjUzZjg5LWYwNzYtNDM1Yi05OTU5LWU0ZWRhNmU4OTg2YSIsInR5cCI6ImtleSJ9.DAUeezHMGN1m7mmMXOqkbr3uro0y8sHkIQ9wHrCstEM' \
  -H 'Content-Type: application/json' \
  -d '{
  "gateway": {

    "tenantId": "48a2aa5d-287b-420b-9c07-54c3ebe16369",
    "gatewayId": "00005813d3165dfb",
    "name": "browan1",
    "description": "",
    "location": {
      "latitude": 0,
      "longitude": 0,
      "altitude": 0,
      "source": "UNKNOWN",
      "accuracy": 0
    },
    "properties": {
      "region_common_name": "US915",
      "region_config_id": "us915_0"
    },
    "metadata": {
      "additionalProp1": "string",
      "additionalProp2": "string",
      "additionalProp3": "string"
    },
    "statsInterval": 0,
    "tags": {
      "additionalProp1": "string",
      "additionalProp2": "string",
      "additionalProp3": "string"
    }
  }
}'
res={}



curl -X 'POST' \
  'http://piserver3:8090/api/device-profiles' \
  -H 'accept: application/json' \
  -H 'Grpc-Metadata-Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjaGlycHN0YWNrIiwiaXNzIjoiY2hpcnBzdGFjayIsInN1YiI6IjkzMjUzZjg5LWYwNzYtNDM1Yi05OTU5LWU0ZWRhNmU4OTg2YSIsInR5cCI6ImtleSJ9.DAUeezHMGN1m7mmMXOqkbr3uro0y8sHkIQ9wHrCstEM' \
  -H 'Content-Type: application/json' \
  -d '{
  "deviceProfile": {
      "tenantId": "48a2aa5d-287b-420b-9c07-54c3ebe16369",
      "name": "esp32-s3-rfm9x",
      "region": "US915",
      "macVersion": "LORAWAN_1_0_3",
      "regParamsRevision": "A",
      "supportsOtaa": true,
      "supportsClassB": false,
      "supportsClassC": false

  }
}'
res={"id":"7f6c09b3-68d0-47af-8e45-415c0d94a87c"}




curl -X 'POST' \
  'http://piserver3:8090/api/devices' \
  -H 'accept: application/json' \
  -H 'Grpc-Metadata-Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjaGlycHN0YWNrIiwiaXNzIjoiY2hpcnBzdGFjayIsInN1YiI6IjkzMjUzZjg5LWYwNzYtNDM1Yi05OTU5LWU0ZWRhNmU4OTg2YSIsInR5cCI6ImtleSJ9.DAUeezHMGN1m7mmMXOqkbr3uro0y8sHkIQ9wHrCstEM' \
  -H 'Content-Type: application/json' \
  -d '{
  "device": {
    "applicationId": "d2a445af-08c1-408c-8d5e-1ecc18fbba26",
    "deviceProfileId": "7f6c09b3-68d0-47af-8e45-415c0d94a87c",
    "name": "esp32-s3-rfm9x",
    "description": "my device",
    "isDisabled": false,
    "skipFcntCheck": true,
    "devEui": "ab493c97ea90bed3",
    "appKey": "d2a438a643017caa73d7fb74532152b6",
    "appEui": "0000000000000000",
    "nwkKey": "d2a438a643017caa73d7fb74532152b6",
    "joinEui": "0000000000000000"
  }
}'
res={}
