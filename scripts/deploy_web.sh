#!/bin/bash

# REChain Web Deployment Script
# Handles deployment to various hosting platforms (Netlify, Vercel, GitHub Pages, etc.)

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
DEPLOYMENT_TARGET=${1:-netlify}
BUILD_DIR="build/web"
DIST_DIR="dist/web"
DEPLOYMENT_CONFIG_FILE="deployment-config.json"

echo -e "${BLUE}REChain Web Deployment Script${NC}"
echo -e "${BLUE}==============================${NC}"
echo "Deployment target: $DEPLOYMENT_TARGET"
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
    print_status "Checking deployment dependencies..."
    
    case $DEPLOYMENT_TARGET in
        netlify)
            if ! command -v netlify &> /dev/null; then
                print_error "Netlify CLI not installed. Install with: npm install -g netlify-cli"
                exit 1
            fi
            ;;
        vercel)
            if ! command -v vercel &> /dev/null; then
                print_error "Vercel CLI not installed. Install with: npm install -g vercel"
                exit 1
            fi
            ;;
        firebase)
            if ! command -v firebase &> /dev/null; then
                print_error "Firebase CLI not installed. Install with: npm install -g firebase-tools"
                exit 1
            fi
            ;;
        github-pages)
            if ! command -v gh &> /dev/null; then
                print_warning "GitHub CLI not found. Manual deployment may be required."
            fi
            ;;
    esac
    
    print_status "Dependencies check completed"
}

# Load deployment configuration
load_deployment_config() {
    print_status "Loading deployment configuration..."
    
    if [ ! -f "$DEPLOYMENT_CONFIG_FILE" ]; then
        print_status "Creating default deployment configuration..."
        create_default_config
    fi
    
    # Source configuration
    if command -v jq &> /dev/null; then
        SITE_NAME=$(jq -r '.siteName // "rechain-web"' "$DEPLOYMENT_CONFIG_FILE")
        DOMAIN=$(jq -r '.domain // ""' "$DEPLOYMENT_CONFIG_FILE")
        BUILD_COMMAND=$(jq -r '.buildCommand // "flutter build web --release"' "$DEPLOYMENT_CONFIG_FILE")
        PUBLISH_DIR=$(jq -r '.publishDir // "build/web"' "$DEPLOYMENT_CONFIG_FILE")
    else
        print_warning "jq not found, using default configuration"
        SITE_NAME="rechain-web"
        DOMAIN=""
        BUILD_COMMAND="flutter build web --release"
        PUBLISH_DIR="build/web"
    fi
    
    print_status "Configuration loaded: $SITE_NAME"
}

# Create default deployment configuration
create_default_config() {
    cat > "$DEPLOYMENT_CONFIG_FILE" << EOF
{
  "siteName": "rechain-web",
  "domain": "",
  "buildCommand": "flutter build web --release",
  "publishDir": "build/web",
  "environmentVariables": {
    "NODE_VERSION": "18",
    "FLUTTER_VERSION": "stable"
  },
  "redirects": [
    {
      "from": "/*",
      "to": "/index.html",
      "status": 200
    }
  ],
  "headers": {
    "/*": {
      "X-Frame-Options": "SAMEORIGIN",
      "X-Content-Type-Options": "nosniff",
      "X-XSS-Protection": "1; mode=block"
    },
    "/sw.js": {
      "Cache-Control": "no-cache, no-store, must-revalidate"
    },
    "/*.js": {
      "Cache-Control": "public, max-age=31536000, immutable"
    },
    "/*.css": {
      "Cache-Control": "public, max-age=31536000, immutable"
    }
  }
}
EOF
}

# Pre-deployment checks
pre_deployment_checks() {
    print_status "Running pre-deployment checks..."
    
    # Check if build exists
    if [ ! -d "$BUILD_DIR" ]; then
        print_error "Build directory not found: $BUILD_DIR"
        print_status "Running build first..."
        ./scripts/build_web.sh release
    fi
    
    # Verify essential files
    local required_files=("index.html" "manifest.json" "sw.js")
    for file in "${required_files[@]}"; do
        if [ ! -f "$BUILD_DIR/$file" ]; then
            print_error "Required file missing: $file"
            exit 1
        fi
    done
    
    # Check file sizes
    local index_size=$(stat -f%z "$BUILD_DIR/index.html" 2>/dev/null || stat -c%s "$BUILD_DIR/index.html" 2>/dev/null || echo "0")
    if [ "$index_size" -lt 1000 ]; then
        print_warning "index.html seems too small ($index_size bytes)"
    fi
    
    print_status "Pre-deployment checks completed"
}

# Deploy to Netlify
deploy_netlify() {
    print_status "Deploying to Netlify..."
    
    # Create netlify.toml if it doesn't exist
    if [ ! -f "netlify.toml" ]; then
        create_netlify_config
    fi
    
    # Deploy
    if [ "$2" = "production" ]; then
        netlify deploy --prod --dir="$BUILD_DIR"
    else
        netlify deploy --dir="$BUILD_DIR"
    fi
    
    print_status "Netlify deployment completed"
}

# Create Netlify configuration
create_netlify_config() {
    print_status "Creating netlify.toml configuration..."
    
    cat > netlify.toml << 'EOF'
[build]
  publish = "build/web"
  command = "flutter build web --release"

[build.environment]
  NODE_VERSION = "18"
  FLUTTER_VERSION = "stable"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200

[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "SAMEORIGIN"
    X-Content-Type-Options = "nosniff"
    X-XSS-Protection = "1; mode=block"
    Referrer-Policy = "strict-origin-when-cross-origin"

[[headers]]
  for = "/sw.js"
  [headers.values]
    Cache-Control = "no-cache, no-store, must-revalidate"
    Service-Worker-Allowed = "/"

[[headers]]
  for = "/*.js"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "/*.css"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "/*.png"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "/*.jpg"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"
EOF
    
    print_status "netlify.toml created"
}

# Deploy to Vercel
deploy_vercel() {
    print_status "Deploying to Vercel..."
    
    # Create vercel.json if it doesn't exist
    if [ ! -f "vercel.json" ]; then
        create_vercel_config
    fi
    
    # Deploy
    if [ "$2" = "production" ]; then
        vercel --prod
    else
        vercel
    fi
    
    print_status "Vercel deployment completed"
}

# Create Vercel configuration
create_vercel_config() {
    print_status "Creating vercel.json configuration..."
    
    cat > vercel.json << 'EOF'
{
  "buildCommand": "flutter build web --release",
  "outputDirectory": "build/web",
  "installCommand": "flutter pub get",
  "framework": null,
  "rewrites": [
    {
      "source": "/(.*)",
      "destination": "/index.html"
    }
  ],
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "X-Frame-Options",
          "value": "SAMEORIGIN"
        },
        {
          "key": "X-Content-Type-Options",
          "value": "nosniff"
        }
      ]
    },
    {
      "source": "/sw.js",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "no-cache, no-store, must-revalidate"
        }
      ]
    }
  ]
}
EOF
    
    print_status "vercel.json created"
}

# Deploy to Firebase Hosting
deploy_firebase() {
    print_status "Deploying to Firebase Hosting..."
    
    # Create firebase.json if it doesn't exist
    if [ ! -f "firebase.json" ]; then
        create_firebase_config
    fi
    
    # Initialize Firebase if needed
    if [ ! -f ".firebaserc" ]; then
        print_status "Initializing Firebase project..."
        firebase init hosting
    fi
    
    # Deploy
    firebase deploy --only hosting
    
    print_status "Firebase deployment completed"
}

# Create Firebase configuration
create_firebase_config() {
    print_status "Creating firebase.json configuration..."
    
    cat > firebase.json << 'EOF'
{
  "hosting": {
    "public": "build/web",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ],
    "headers": [
      {
        "source": "**/*.@(js|css)",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "max-age=31536000"
          }
        ]
      },
      {
        "source": "sw.js",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "no-cache"
          }
        ]
      }
    ]
  }
}
EOF
    
    print_status "firebase.json created"
}

# Deploy to GitHub Pages
deploy_github_pages() {
    print_status "Deploying to GitHub Pages..."
    
    # Check if gh-pages branch exists
    if ! git show-ref --verify --quiet refs/heads/gh-pages; then
        print_status "Creating gh-pages branch..."
        git checkout --orphan gh-pages
        git rm -rf .
        git commit --allow-empty -m "Initial gh-pages commit"
        git checkout main || git checkout master
    fi
    
    # Copy build to gh-pages branch
    git checkout gh-pages
    
    # Clear existing files (except .git)
    find . -maxdepth 1 ! -name '.git' ! -name '.' -exec rm -rf {} +
    
    # Copy build files
    cp -r "$BUILD_DIR"/* .
    
    # Add CNAME if domain is specified
    if [ -n "$DOMAIN" ]; then
        echo "$DOMAIN" > CNAME
    fi
    
    # Commit and push
    git add .
    git commit -m "Deploy $(date)"
    git push origin gh-pages
    
    # Return to main branch
    git checkout main || git checkout master
    
    print_status "GitHub Pages deployment completed"
}

# Deploy to custom server via rsync
deploy_custom_server() {
    print_status "Deploying to custom server..."
    
    if [ -z "$DEPLOY_HOST" ] || [ -z "$DEPLOY_PATH" ]; then
        print_error "DEPLOY_HOST and DEPLOY_PATH environment variables must be set"
        exit 1
    fi
    
    # Deploy via rsync
    rsync -avz --delete "$BUILD_DIR/" "$DEPLOY_HOST:$DEPLOY_PATH/"
    
    print_status "Custom server deployment completed"
}

# Post-deployment tasks
post_deployment_tasks() {
    print_status "Running post-deployment tasks..."
    
    # Update deployment info
    local deployment_info="{
        \"timestamp\": \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\",
        \"target\": \"$DEPLOYMENT_TARGET\",
        \"version\": \"$(git describe --tags --always 2>/dev/null || echo 'unknown')\",
        \"commit\": \"$(git rev-parse HEAD 2>/dev/null || echo 'unknown')\"
    }"
    
    echo "$deployment_info" > "$BUILD_DIR/deployment-info.json"
    
    # Run deployment tests if available
    if [ -f "scripts/test_deployment.sh" ]; then
        print_status "Running deployment tests..."
        ./scripts/test_deployment.sh "$DEPLOYMENT_TARGET"
    fi
    
    print_status "Post-deployment tasks completed"
}

# Generate deployment report
generate_deployment_report() {
    print_status "Generating deployment report..."
    
    local report_file="deployment-report-$(date +%Y%m%d-%H%M%S).html"
    
    cat > "$report_file" << EOF
<!DOCTYPE html>
<html>
<head>
    <title>REChain Web Deployment Report</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .header { background: #0175C2; color: white; padding: 20px; border-radius: 5px; }
        .section { margin: 20px 0; padding: 15px; border: 1px solid #ddd; border-radius: 5px; }
        .success { color: green; }
        .info { color: blue; }
        pre { background: #f5f5f5; padding: 10px; border-radius: 3px; overflow-x: auto; }
    </style>
</head>
<body>
    <div class="header">
        <h1>REChain Web Deployment Report</h1>
        <p>Generated: $(date)</p>
        <p>Target: $DEPLOYMENT_TARGET</p>
    </div>
    
    <div class="section">
        <h2>Deployment Summary</h2>
        <ul>
            <li><strong>Target Platform:</strong> $DEPLOYMENT_TARGET</li>
            <li><strong>Build Directory:</strong> $BUILD_DIR</li>
            <li><strong>Site Name:</strong> $SITE_NAME</li>
            <li><strong>Domain:</strong> ${DOMAIN:-"Not specified"}</li>
            <li><strong>Status:</strong> <span class="success">Successful</span></li>
        </ul>
    </div>
    
    <div class="section">
        <h2>Build Information</h2>
        <pre>$(cat "$BUILD_DIR/deployment-info.json" 2>/dev/null || echo "No deployment info available")</pre>
    </div>
    
    <div class="section">
        <h2>File Structure</h2>
        <pre>$(find "$BUILD_DIR" -type f | head -20)</pre>
    </div>
</body>
</html>
EOF
    
    print_status "Deployment report generated: $report_file"
}

# Main deployment process
main() {
    echo -e "${BLUE}Starting REChain web deployment process...${NC}"
    echo ""
    
    check_dependencies
    load_deployment_config
    pre_deployment_checks
    
    # Deploy based on target
    case $DEPLOYMENT_TARGET in
        netlify)
            deploy_netlify "$@"
            ;;
        vercel)
            deploy_vercel "$@"
            ;;
        firebase)
            deploy_firebase "$@"
            ;;
        github-pages)
            deploy_github_pages "$@"
            ;;
        custom)
            deploy_custom_server "$@"
            ;;
        *)
            print_error "Unknown deployment target: $DEPLOYMENT_TARGET"
            print_status "Supported targets: netlify, vercel, firebase, github-pages, custom"
            exit 1
            ;;
    esac
    
    post_deployment_tasks
    generate_deployment_report
    
    echo ""
    echo -e "${GREEN}✓ REChain web deployment completed successfully!${NC}"
    echo -e "${GREEN}✓ Target: $DEPLOYMENT_TARGET${NC}"
    echo -e "${GREEN}✓ Site: $SITE_NAME${NC}"
    echo ""
}

# Handle script interruption
trap 'print_error "Deployment interrupted"' INT TERM

# Show usage if no arguments
if [ $# -eq 0 ]; then
    echo "Usage: $0 <target> [production]"
    echo ""
    echo "Targets:"
    echo "  netlify       - Deploy to Netlify"
    echo "  vercel        - Deploy to Vercel"
    echo "  firebase      - Deploy to Firebase Hosting"
    echo "  github-pages  - Deploy to GitHub Pages"
    echo "  custom        - Deploy to custom server (requires DEPLOY_HOST and DEPLOY_PATH)"
    echo ""
    echo "Examples:"
    echo "  $0 netlify"
    echo "  $0 vercel production"
    echo "  $0 firebase"
    exit 1
fi

# Run main function
main "$@"
