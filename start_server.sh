#!/bin/bash
echo "Starting frontend server..."
pkill -f "npm run dev" || true
sleep 2
mkdir -p logs
echo "Installing dependencies..."
npm install
echo "Starting dev server..."
nohup npm run dev > logs/server.log 2>&1 &
SERVER_PID=$!
echo "Server started in background, PID: $SERVER_PID"
sleep 3
ps aux | grep $SERVER_PID || echo "Warning: Server process may have failed to start"
