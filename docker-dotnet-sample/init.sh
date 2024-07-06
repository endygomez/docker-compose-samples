#!/bin/sh


# Wait for the .NET API to be ready
while ! curl -s http://localhost:5001/redis > /dev/null; do
    echo "Waiting for .NET API..."
    sleep 5
done

# Create key-value pairs in Redis via the .NET API
curl -X POST http://localhost:5001/redis -H "Content-Type: application/json" -d '{"key":"mykey1","value":"myvalue1"}'
curl -X POST http://localhost:5001/redis -H "Content-Type: application/json" -d '{"key":"mykey2","value":"myvalue2"}'
curl -X POST http://localhost:5001/redis -H "Content-Type: application/json" -d '{"key":"mykey3","value":"myvalue3"}'

echo "Initialization complete."
