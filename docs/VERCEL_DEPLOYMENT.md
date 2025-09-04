# REChain Vercel Deployment Guide

## 🚀 Deploying REChain to Vercel

This guide covers deploying REChain web application to Vercel platform with full Russian Linux support documentation.

## 📋 Prerequisites

- Vercel account (free or paid)
- GitHub repository with REChain project
- Flutter SDK configured in the project

## 🔧 Configuration Files

### vercel.json
The project includes a pre-configured `vercel.json` file with:
- Custom build command using `scripts/vercel.sh`
- Output directory set to `build/web`
- SPA routing configuration
- WASM content type headers
- Asset caching optimization

### Build Script
The `scripts/vercel.sh` script handles:
- Rust toolchain installation
- Vodozemac cryptography library compilation
- Flutter web build with release optimization
- Russian locale configuration

## 🚀 Deployment Methods

### Method 1: Vercel CLI
```bash
# Install Vercel CLI
npm i -g vercel

# Login to Vercel
vercel login

# Deploy from project root
vercel

# For production deployment
vercel --prod
```

### Method 2: GitHub Integration
1. Connect your GitHub repository to Vercel
2. Import the REChain project
3. Vercel will automatically detect the configuration
4. Deploy with automatic builds on push

### Method 3: Manual Upload
1. Build locally: `bash scripts/vercel.sh`
2. Upload `build/web` directory to Vercel
3. Configure domain and settings

## ⚙️ Environment Variables

Set these in Vercel dashboard:

```bash
# Flutter Configuration
FLUTTER_WEB=true

# Russian Locale Support
LANG=ru_RU.UTF-8
LC_ALL=ru_RU.UTF-8

# Matrix Configuration (optional)
MATRIX_HOMESERVER=https://matrix.org
MATRIX_IDENTITY_SERVER=https://vector.im

# Build Optimization
FLUTTER_BUILD_MODE=release
```

## 🌐 Custom Domain Configuration

### Adding Custom Domain
1. Go to Vercel Dashboard → Project → Settings → Domains
2. Add your domain (e.g., `rechain.online`)
3. Configure DNS records:
   ```
   Type: CNAME
   Name: www
   Value: cname.vercel-dns.com
   
   Type: A
   Name: @
   Value: 76.76.19.61
   ```

### SSL Certificate
Vercel automatically provides SSL certificates for all domains.

## 🔐 Security Configuration

### Content Security Policy
Add to `vercel.json` headers:
```json
{
  "key": "Content-Security-Policy",
  "value": "default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:; connect-src 'self' https://matrix.org https://*.matrix.org wss://matrix.org wss://*.matrix.org"
}
```

### Russian Compliance Headers
```json
{
  "key": "X-Content-Type-Options",
  "value": "nosniff"
},
{
  "key": "X-Frame-Options",
  "value": "DENY"
},
{
  "key": "X-XSS-Protection",
  "value": "1; mode=block"
}
```

## 📊 Performance Optimization

### Build Optimization
The build script includes:
- Tree shaking for smaller bundle size
- WASM compilation for cryptography
- Asset compression
- Russian locale optimization

### Caching Strategy
```json
{
  "source": "/assets/(.*)",
  "headers": [
    {
      "key": "Cache-Control",
      "value": "public, max-age=31536000, immutable"
    }
  ]
}
```

## 🌍 Russian Localization

### Locale Configuration
The deployment automatically configures:
- Russian language support (ru_RU.UTF-8)
- Cyrillic font loading
- Right-to-left text support where needed
- Russian date/time formatting

### Font Optimization
```json
{
  "source": "/assets/fonts/(.*)",
  "headers": [
    {
      "key": "Cache-Control",
      "value": "public, max-age=31536000, immutable"
    },
    {
      "key": "Access-Control-Allow-Origin",
      "value": "*"
    }
  ]
}
```

## 🔍 Monitoring and Analytics

### Vercel Analytics
Enable in dashboard:
1. Go to Analytics tab
2. Enable Web Analytics
3. View performance metrics

### Custom Monitoring
Add to your Flutter web app:
```dart
// Performance monitoring
import 'package:web/web.dart' as web;

void trackPageView(String page) {
  web.window.gtag('config', 'GA_MEASUREMENT_ID', {
    'page_title': page,
    'page_location': web.window.location.href,
  });
}
```

## 🚨 Troubleshooting

### Common Issues

#### Build Failures
```bash
# Check build logs in Vercel dashboard
# Common fixes:
- Ensure Flutter SDK is properly configured
- Check Rust toolchain installation
- Verify vodozemac compilation

# Local testing:
bash scripts/vercel.sh
```

#### WASM Loading Issues
```javascript
// Add to index.html
<script>
if (!crossOriginIsolated) {
  console.warn('Cross-origin isolation not enabled');
}
</script>
```

#### Russian Font Issues
```css
/* Add to main.css */
@font-face {
  font-family: 'Roboto';
  src: url('/assets/fonts/Roboto-Regular.ttf') format('truetype');
  unicode-range: U+0400-04FF; /* Cyrillic */
}
```

### Performance Issues
- Enable compression in vercel.json
- Optimize images and assets
- Use lazy loading for components
- Implement service worker caching

## 📈 Scaling Considerations

### Traffic Handling
- Vercel automatically scales based on traffic
- CDN distribution for global performance
- Edge functions for dynamic content

### Cost Optimization
- Monitor bandwidth usage
- Optimize asset sizes
- Use appropriate caching strategies
- Consider Vercel Pro for high-traffic sites

## 🔄 CI/CD Integration

### Automatic Deployments
```yaml
# .github/workflows/vercel.yml
name: Vercel Deployment
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Deploy to Vercel
        uses: amondnet/vercel-action@v20
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.ORG_ID }}
          vercel-project-id: ${{ secrets.PROJECT_ID }}
```

### Preview Deployments
- Automatic preview for pull requests
- Branch-based deployments
- Environment-specific configurations

## 📞 Support

### Vercel Support
- Documentation: https://vercel.com/docs
- Community: https://github.com/vercel/vercel/discussions
- Support: support@vercel.com

### REChain Support
- Russian Linux Issues: support@rechain.network
- Deployment Help: deploy@rechain.network
- Community: https://t.me/REChainSupport

## 🎯 Best Practices

1. **Always test locally** before deploying
2. **Use environment variables** for configuration
3. **Monitor performance** regularly
4. **Keep dependencies updated**
5. **Implement proper error handling**
6. **Use Russian-friendly CDN settings**
7. **Test on Russian networks**

---

*REChain Vercel Deployment Guide v4.1.8+1152*
*Optimized for Russian Linux systems and global deployment*
