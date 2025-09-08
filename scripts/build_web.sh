#!/bin/bash

# REChain Web Build Script
# Builds the web version with optimizations and service worker integration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
BUILD_MODE=${1:-release}
OUTPUT_DIR="build/web"
TEMP_DIR="build/temp"
DIST_DIR="dist/web"

echo -e "${BLUE}REChain Web Build Script${NC}"
echo -e "${BLUE}========================${NC}"
echo "Build mode: $BUILD_MODE"
echo "Output directory: $OUTPUT_DIR"
echo ""

# Function to print status
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check dependencies
check_dependencies() {
    print_status "Checking dependencies..."
    
    if ! command -v flutter &> /dev/null; then
        print_error "Flutter is not installed or not in PATH"
        exit 1
    fi
    
    if ! command -v node &> /dev/null; then
        print_warning "Node.js not found. Some optimizations may be skipped."
    fi
    
    # Check Flutter web support
    if ! flutter config --list | grep -q "enable-web: true"; then
        print_status "Enabling Flutter web support..."
        flutter config --enable-web
    fi
    
    print_status "Dependencies check completed"
}

# Clean previous builds
clean_build() {
    print_status "Cleaning previous builds..."
    
    if [ -d "$OUTPUT_DIR" ]; then
        rm -rf "$OUTPUT_DIR"
    fi
    
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
    
    if [ -d "$DIST_DIR" ]; then
        rm -rf "$DIST_DIR"
    fi
    
    flutter clean
    print_status "Clean completed"
}

# Get dependencies
get_dependencies() {
    print_status "Getting Flutter dependencies..."
    flutter pub get
    
    if [ -f "web/package.json" ]; then
        print_status "Getting Node.js dependencies..."
        cd web && npm install && cd ..
    fi
    
    print_status "Dependencies installed"
}

# Pre-build optimizations
pre_build_optimizations() {
    print_status "Running pre-build optimizations..."
    
    # Create temp directory
    mkdir -p "$TEMP_DIR"
    
    # Copy web assets
    if [ -d "web" ]; then
        cp -r web/* "$TEMP_DIR/"
    fi
    
    # Optimize JavaScript files
    if command -v node &> /dev/null && [ -f "web/package.json" ]; then
        print_status "Optimizing JavaScript files..."
        
        # Minify JavaScript files
        for js_file in web/js/*.js; do
            if [ -f "$js_file" ]; then
                filename=$(basename "$js_file")
                print_status "Optimizing $filename..."
                # Simple minification (remove comments and extra whitespace)
                sed '/^[[:space:]]*\/\//d; /^[[:space:]]*$/d' "$js_file" > "$TEMP_DIR/js/$filename"
            fi
        done
    fi
    
    print_status "Pre-build optimizations completed"
}

# Build Flutter web
build_flutter_web() {
    print_status "Building Flutter web application..."
    
    local build_args=""
    
    if [ "$BUILD_MODE" = "release" ]; then
        build_args="--release --web-renderer canvaskit --dart-define=FLUTTER_WEB_USE_SKIA=true"
    elif [ "$BUILD_MODE" = "profile" ]; then
        build_args="--profile --web-renderer canvaskit"
    else
        build_args="--debug --web-renderer html"
    fi
    
    # Add optimization flags for release builds
    if [ "$BUILD_MODE" = "release" ]; then
        build_args="$build_args --tree-shake-icons --split-debug-info=build/web/debug_symbols"
    fi
    
    print_status "Running: flutter build web $build_args"
    flutter build web $build_args
    
    if [ $? -eq 0 ]; then
        print_status "Flutter web build completed successfully"
    else
        print_error "Flutter web build failed"
        exit 1
    fi
}

# Post-build optimizations
post_build_optimizations() {
    print_status "Running post-build optimizations..."
    
    # Copy optimized assets
    if [ -d "$TEMP_DIR" ]; then
        # Copy optimized JS files
        if [ -d "$TEMP_DIR/js" ]; then
            cp -r "$TEMP_DIR/js" "$OUTPUT_DIR/"
        fi
        
        # Copy service worker
        if [ -f "$TEMP_DIR/sw.js" ]; then
            cp "$TEMP_DIR/sw.js" "$OUTPUT_DIR/"
        fi
    fi
    
    # Optimize images if tools are available
    if command -v optipng &> /dev/null; then
        print_status "Optimizing PNG images..."
        find "$OUTPUT_DIR" -name "*.png" -exec optipng -o2 {} \;
    fi
    
    # Generate service worker cache manifest
    generate_cache_manifest
    
    # Create .htaccess for Apache servers
    create_htaccess
    
    # Create nginx configuration
    create_nginx_config
    
    print_status "Post-build optimizations completed"
}

# Generate service worker cache manifest
generate_cache_manifest() {
    print_status "Generating service worker cache manifest..."
    
    local manifest_file="$OUTPUT_DIR/cache-manifest.json"
    local files=()
    
    # Find all static assets
    while IFS= read -r -d '' file; do
        local relative_path="${file#$OUTPUT_DIR/}"
        files+=("\"$relative_path\"")
    done < <(find "$OUTPUT_DIR" -type f \( -name "*.js" -o -name "*.css" -o -name "*.png" -o -name "*.jpg" -o -name "*.svg" -o -name "*.woff2" -o -name "*.ttf" \) -print0)
    
    # Create manifest
    cat > "$manifest_file" << EOF
{
  "version": "$(date +%s)",
  "files": [
    $(IFS=,; echo "${files[*]}")
  ]
}
EOF
    
    print_status "Cache manifest generated: $manifest_file"
}

# Create .htaccess for Apache
create_htaccess() {
    print_status "Creating .htaccess configuration..."
    
    cat > "$OUTPUT_DIR/.htaccess" << 'EOF'
# REChain Web Application - Apache Configuration

# Enable compression
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE application/xhtml+xml
    AddOutputFilterByType DEFLATE application/rss+xml
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/x-javascript
    AddOutputFilterByType DEFLATE application/json
</IfModule>

# Set cache headers
<IfModule mod_expires.c>
    ExpiresActive On
    ExpiresByType text/css "access plus 1 year"
    ExpiresByType application/javascript "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"
    ExpiresByType image/jpg "access plus 1 year"
    ExpiresByType image/jpeg "access plus 1 year"
    ExpiresByType image/gif "access plus 1 year"
    ExpiresByType image/svg+xml "access plus 1 year"
    ExpiresByType font/woff2 "access plus 1 year"
    ExpiresByType application/manifest+json "access plus 1 week"
</IfModule>

# Security headers
<IfModule mod_headers.c>
    Header always set X-Frame-Options "SAMEORIGIN"
    Header always set X-Content-Type-Options "nosniff"
    Header always set X-XSS-Protection "1; mode=block"
    Header always set Referrer-Policy "strict-origin-when-cross-origin"
    Header always set Permissions-Policy "camera=(), microphone=(), geolocation=()"
</IfModule>

# Service Worker
<Files "sw.js">
    Header set Cache-Control "no-cache, no-store, must-revalidate"
    Header set Service-Worker-Allowed "/"
</Files>

# Manifest
<Files "manifest.json">
    Header set Content-Type "application/manifest+json"
</Files>

# Fallback for SPA routing
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /
    RewriteRule ^index\.html$ - [L]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule . /index.html [L]
</IfModule>
EOF
    
    print_status ".htaccess configuration created"
}

# Create nginx configuration
create_nginx_config() {
    print_status "Creating nginx configuration..."
    
    cat > "$OUTPUT_DIR/nginx.conf" << 'EOF'
# REChain Web Application - Nginx Configuration

server {
    listen 80;
    server_name localhost;
    root /var/www/html;
    index index.html;

    # Compression
    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_types
        text/plain
        text/css
        text/xml
        text/javascript
        application/json
        application/javascript
        application/xml+rss
        application/atom+xml
        image/svg+xml;

    # Security headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;

    # Service Worker
    location /sw.js {
        add_header Cache-Control "no-cache, no-store, must-revalidate";
        add_header Service-Worker-Allowed "/";
        try_files $uri =404;
    }

    # Manifest
    location /manifest.json {
        add_header Content-Type "application/manifest+json";
        try_files $uri =404;
    }

    # Static assets with long cache
    location ~* \.(js|css|png|jpg|jpeg|gif|svg|woff2|ttf)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
        try_files $uri =404;
    }

    # SPA fallback
    location / {
        try_files $uri $uri/ /index.html;
    }
}
EOF
    
    print_status "nginx configuration created"
}

# Create distribution package
create_distribution() {
    print_status "Creating distribution package..."
    
    mkdir -p "$DIST_DIR"
    
    # Copy build output
    cp -r "$OUTPUT_DIR"/* "$DIST_DIR/"
    
    # Create deployment info
    cat > "$DIST_DIR/deployment-info.json" << EOF
{
  "buildTime": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "buildMode": "$BUILD_MODE",
  "version": "$(git describe --tags --always 2>/dev/null || echo 'unknown')",
  "commit": "$(git rev-parse HEAD 2>/dev/null || echo 'unknown')"
}
EOF
    
    # Create archive
    if command -v tar &> /dev/null; then
        local archive_name="rechain-web-$(date +%Y%m%d-%H%M%S).tar.gz"
        tar -czf "$archive_name" -C "$DIST_DIR" .
        print_status "Distribution archive created: $archive_name"
    fi
    
    print_status "Distribution package created in: $DIST_DIR"
}

# Run tests
run_tests() {
    if [ "$BUILD_MODE" != "debug" ]; then
        print_status "Running web tests..."
        
        # Run Flutter tests
        flutter test --platform chrome
        
        if [ $? -eq 0 ]; then
            print_status "All tests passed"
        else
            print_warning "Some tests failed"
        fi
    fi
}

# Cleanup temporary files
cleanup() {
    print_status "Cleaning up temporary files..."
    
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
    
    print_status "Cleanup completed"
}

# Main build process
main() {
    echo -e "${BLUE}Starting REChain web build process...${NC}"
    echo ""
    
    check_dependencies
    clean_build
    get_dependencies
    pre_build_optimizations
    build_flutter_web
    post_build_optimizations
    create_distribution
    run_tests
    cleanup
    
    echo ""
    echo -e "${GREEN}✓ REChain web build completed successfully!${NC}"
    echo -e "${GREEN}✓ Output directory: $OUTPUT_DIR${NC}"
    echo -e "${GREEN}✓ Distribution package: $DIST_DIR${NC}"
    echo ""
    echo "To serve locally:"
    echo "  cd $OUTPUT_DIR && python -m http.server 8080"
    echo ""
    echo "To deploy:"
    echo "  Upload contents of $DIST_DIR to your web server"
}

# Handle script interruption
trap cleanup EXIT

# Run main function
main "$@"
