#!/bin/bash

# Configuration
CONTAINER_NAME="devcontainer-db-1"  
DB_USER="postgres"            
DB_NAME="easybank"            
MIGRATIONS_DIR="./migrations" 
CONTAINER_MIGRATIONS_DIR="/migrations"

# Ensure the migrations directory exists
if [ ! -d "$MIGRATIONS_DIR" ]; then
    echo "Error: Migrations directory '$MIGRATIONS_DIR' not found!"
    exit 1
fi

# Copy migration scripts into the container
docker cp "$MIGRATIONS_DIR" "$CONTAINER_NAME:$CONTAINER_MIGRATIONS_DIR"

# Execute all SQL migration scripts inside the container
docker exec -i "$CONTAINER_NAME" bash -c "
    for file in $CONTAINER_MIGRATIONS_DIR/*.sql; do
        echo 'Running migration: ' \$file
        psql -U $DB_USER -d $DB_NAME -f \$file
    done
"

echo "All migrations executed successfully."
