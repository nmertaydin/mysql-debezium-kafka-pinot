curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @register-mysql.json

docker cp pinot/def-table.json pinot:/opt/pinot
docker cp pinot/def-schema.json pinot:/opt/pinot
docker exec pinot bash -c "/opt/pinot/bin/pinot-admin.sh AddTable -tableConfigFile /opt/pinot/def-table.json -schemaFile /opt/pinot/def-schema.json -exec"
