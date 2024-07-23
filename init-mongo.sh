#!/bin/bash
set -e
mongosh <<EOF
use dearflow
db.createUser({
  user: 'dearflowAdmin',
  pwd: 'dearflowAdmin123',
  roles: [{ role: 'readWrite', db: 'dearflow' }]
})
db.agents.insertMany($(cat /docker-entrypoint-initdb.d/dearflow.agents.json))
db.skills.insertMany($(cat /docker-entrypoint-initdb.d/dearflow.skills.json))
db.tools.insertMany($(cat /docker-entrypoint-initdb.d/dearflow.tools.json))
EOF