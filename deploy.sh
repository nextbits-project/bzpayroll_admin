#!/bin/bash

PASSWORD="CC0Df1CD"
USER="root"
HOST="bzcomposer.com"
SRC="./target/payroll-0.0.1-SNAPSHOT.war"
DEST="/opt/apache8081/"

sshpass -p "$PASSWORD" scp "$SRC" "$USER@$HOST:$DEST"
