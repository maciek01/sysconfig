

KEY="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjaGlycHN0YWNrIiwiaXNzIjoiY2hpcnBzdGFjayIsInN1YiI6IjkzMjUzZjg5LWYwNzYtNDM1Yi05OTU5LWU0ZWRhNmU4OTg2YSIsInR5cCI6ImtleSJ9.DAUeezHMGN1m7mmMXOqkbr3uro0y8sHkIQ9wHrCstEM"

AUTH="Grpc-Metadata-Authorization: Bearer "$KEY


RESP=$(curl -X 'POST' \
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
}')

TENANT_ID=$(jq -r  .id <<< ${RESP})
echo TENANT_ID=$TENANT_ID

#res={ "id": "48a2aa5d-287b-420b-9c07-54c3ebe16369" }


RESP=$(curl -X 'POST' \
  'http://piserver3:8090/api/applications' \
  -H 'accept: application/json' \
  -H "${AUTH}" \
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
    "tenantId": "'$TENANT_ID'"
  }
}')

APP_ID=$(jq -r  .id <<< ${RESP})
echo APP_ID=$APP_ID

#res={"id":"d2a445af-08c1-408c-8d5e-1ecc18fbba26"}


RESP=$(curl -X 'POST' \
  'http://piserver3:8090/api/gateways' \
  -H 'accept: application/json' \
  -H "${AUTH}" \
  -H 'Content-Type: application/json' \
  -d '{
  "gateway": {

    "tenantId": "'$TENANT_ID'",
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
    "statsInterval": 120,
    "tags": {
      "additionalProp1": "string",
      "additionalProp2": "string",
      "additionalProp3": "string"
    }
  }
}')

#res={}



RESP=$(curl -X 'POST' \
  'http://piserver3:8090/api/device-profiles' \
  -H 'accept: application/json' \
  -H "${AUTH}" \
  -H 'Content-Type: application/json' \
  -d '{
  "deviceProfile": {
      "tenantId": "'$TENANT_ID'",
      "name": "esp32-s3-rfm9x",
      "region": "US915",
      "macVersion": "LORAWAN_1_0_3",
      "regParamsRevision": "A",
      "supportsOtaa": true,
      "supportsClassB": false,
      "supportsClassC": false

  }
}')
DEVP_ID=$(jq -r  .id <<< ${RESP})
echo DEVP_ID=$DEVP_ID
#res={"id":"7f6c09b3-68d0-47af-8e45-415c0d94a87c"}


RESP=$(curl -X 'POST' \
  'http://piserver3:8090/api/devices' \
  -H 'accept: application/json' \
  -H "${AUTH}" \
  -H 'Content-Type: application/json' \
  -d '{
  "device": {
    "applicationId": "'$APP_ID'",
    "deviceProfileId": "'$DEVP_ID'",
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
}')
echo CREATE DEVICE: $RESP
#res={}
