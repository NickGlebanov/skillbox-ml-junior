#!/bin/bash
set -e

echo "Waiting for PostgreSQL to be available..."
until pg_isready -U postgres -d mydb; do
  sleep 1
done

echo "Restoring database from dump..."
pg_restore -U postgres -d mydb /tmp/mydb.dump

echo "Restore complete."
