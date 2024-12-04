#!/bin/bash

./factorio_headless.sh "your_username" "your_token" "desired_password"
set -x  # Print each command as it executes

if [ $# -ne 3 ]; then
    echo "Usage: $0 <username> <token> <game_password>"
    exit 1
fi

USERNAME=$1
TOKEN=$2
GAME_PASSWORD=$3

cd ~/factorio || { echo "Failed to change directory"; exit 1; }
pwd

# Create server settings file
cat > server-settings.json << EOF
{
  "name": "Mark's Server",
  "description": "Come join and help build!",
  "tags": ["multiplayer", "chill"],
  "max_players": 5,
  "visibility": {
    "public": true,
    "lan": true
  },
  "username": "$USERNAME",
  "token": "$TOKEN",
  "game_password": "$GAME_PASSWORD",
  "require_user_verification": true,
  "allow_commands": "admins-only",
  "autosave_interval": 10,
  "auto_pause": false,
  "only_admins_can_pause": true
}
EOF

latest_save=$(ls -t "$(wslpath "$(wslvar APPDATA)")/Factorio/saves/"*.zip | head -1)
echo "Save file path: $latest_save"
ls -la "$latest_save"

echo "Attempting to start server..."
./bin/x64/factorio --start-server "$latest_save" --server-settings server-settings.json 2>&1
exit_code=$?
echo "Process exited with code: $exit_code"
