#!/bin/bash
set -e

echo "🚀 Starting Infrastructure Setup..."

# Check Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker not found. Please install Docker first."
    exit 1
fi

# Check Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose not found. Please install it."
    exit 1
fi

# Start all services
echo "🔧 Building and starting services..."
docker-compose up -d --build

# Wait for health checks
echo "⏳ Waiting for services to become healthy..."
sleep 20

echo "🩺 Checking container health statuses..."
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo "📜 Logs (tailing 5 lines per service)..."
for service in jenkins redis app nginx; do
    echo "----- $service -----"
    docker logs --tail 5 $service
    echo ""
done

echo "✅ Setup complete! Services are running:"
echo "• Jenkins → http://localhost:8080"
echo "• App → http://localhost (via Nginx)"
echo "• Redis → localhost:6379"
