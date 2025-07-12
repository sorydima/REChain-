#!/bin/bash

# TON Integration Setup Script
set -e

echo "🚀 Setting up TON Integration..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   print_error "This script should not be run as root"
   exit 1
fi

# Check dependencies
print_status "Checking dependencies..."

# Check Docker
if ! command -v docker &> /dev/null; then
    print_error "Docker is not installed. Please install Docker first."
    exit 1
fi

# Check Docker Compose
if ! command -v docker-compose &> /dev/null; then
    print_error "Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Check Flutter
if ! command -v flutter &> /dev/null; then
    print_error "Flutter is not installed. Please install Flutter first."
    exit 1
fi

print_success "All dependencies are installed"

# Create necessary directories
print_status "Creating directories..."
mkdir -p logs
mkdir -p data/backups
mkdir -p monitoring
mkdir -p nginx/ssl
mkdir -p synapse

# Generate environment file if it doesn't exist
if [ ! -f .env ]; then
    print_status "Creating environment file..."
    cat > .env << EOF
# TON API Keys
TON_CENTER_API_KEY=your_toncenter_api_key_here
TON_API_KEY=your_tonapi_key_here

# Bridge Tokens (generate secure random strings)
BRIDGE_AS_TOKEN=$(openssl rand -hex 32)
BRIDGE_HS_TOKEN=$(openssl rand -hex 32)

# Bot Tokens (optional)
TELEGRAM_BOT_TOKEN=your_telegram_bot_token_here
DISCORD_BOT_TOKEN=your_discord_bot_token_here

# Database
POSTGRES_PASSWORD=$(openssl rand -hex 16)

# Monitoring
GRAFANA_PASSWORD=$(openssl rand -hex 16)

# Domain Configuration
DOMAIN=your.domain.tld
EOF
    print_success "Environment file created at .env"
    print_warning "Please edit .env file with your actual API keys and domain"
else
    print_status "Environment file already exists"
fi

# Generate SSL certificates (self-signed for development)
if [ ! -f nginx/ssl/cert.pem ]; then
    print_status "Generating SSL certificates..."
    openssl req -x509 -newkey rsa:4096 -keyout nginx/ssl/key.pem -out nginx/ssl/cert.pem -days 365 -nodes -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"
    print_success "SSL certificates generated"
fi

# Create Nginx configuration
if [ ! -f nginx/nginx.conf ]; then
    print_status "Creating Nginx configuration..."
    cat > nginx/nginx.conf << 'EOF'
events {
    worker_connections 1024;
}

http {
    upstream synapse {
        server synapse:8008;
    }
    
    upstream ton_bridge {
        server ton-bridge:8080;
    }

    server {
        listen 80;
        server_name _;
        return 301 https://$host$request_uri;
    }

    server {
        listen 443 ssl http2;
        server_name _;

        ssl_certificate /etc/nginx/ssl/cert.pem;
        ssl_certificate_key /etc/nginx/ssl/key.pem;

        location /_matrix {
            proxy_pass http://synapse;
            proxy_set_header X-Forwarded-For $remote_addr;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header Host $host;
        }

        location /_ton {
            proxy_pass http://ton_bridge;
            proxy_set_header X-Forwarded-For $remote_addr;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header Host $host;
        }
    }
}
EOF
    print_success "Nginx configuration created"
fi

# Create Prometheus configuration
if [ ! -f monitoring/prometheus.yml ]; then
    print_status "Creating Prometheus configuration..."
    cat > monitoring/prometheus.yml << 'EOF'
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'ton-bridge'
    static_configs:
      - targets: ['ton-bridge:9090']
  
  - job_name: 'synapse'
    static_configs:
      - targets: ['synapse:9000']
EOF
    print_success "Prometheus configuration created"
fi

# Install Flutter dependencies
print_status "Installing Flutter dependencies..."
flutter pub get

# Run Flutter tests
print_status "Running Flutter tests..."
flutter test lib/features/ton/test/

# Build Docker images
print_status "Building Docker images..."
docker-compose build

print_success "TON Integration setup completed!"

echo ""
echo "📋 Next Steps:"
echo "1. Edit .env file with your API keys and domain"
echo "2. Update bridge configuration files with your Matrix homeserver details"
echo "3. Start the services: docker-compose up -d"
echo "4. Register the bridge with your Matrix homeserver"
echo "5. Add TON features to your Flutter app using the navigation components"

echo ""
echo "🔧 Useful Commands:"
echo "  Start services:     docker-compose up -d"
echo "  Stop services:      docker-compose down"
echo "  View logs:          docker-compose logs -f ton-bridge"
echo "  Restart bridge:     docker-compose restart ton-bridge"
echo "  Run tests:          flutter test lib/features/ton/test/"

echo ""
print_success "Setup complete! 🎉"
