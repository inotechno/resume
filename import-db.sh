#!/bin/bash

echo "⌛ Menunggu PostgreSQL siap..."
until pg_isready -h db -U $DB_USERNAME -d $DB_DATABASE; do
  sleep 1
done

echo "✅ PostgreSQL siap, mengimport database..."
psql -h db -U $DB_USERNAME -d $DB_DATABASE < /var/www/html/database/portfolio.sql
