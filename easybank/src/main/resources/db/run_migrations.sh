#!/bin/bash

DB_NAME="easybank"
USER="postgres"
CONTAINER_NAME="devcontainer-db-1"

for file in ./migrations/V*.sql; do
  echo "Running $file..."
  docker exec -i $CONTAINER_NAME psql -U $USER -d $DB_NAME < "$file"
done

echo "All migrations executed successfully!"
