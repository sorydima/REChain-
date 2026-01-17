# REChain Vercel Deployment Troubleshooting Guide

## 🚨 Common Build Issues and Solutions

### WASM Compilation Errors

#### Error: "crate-type must be cdylib to compile to wasm32-unknown-unknown"
**Problem**: The vodozemac Cargo.toml file doesn't have the correct crate-type configuration for WASM compilation.

**Solutions**:
1. **Automatic Fix**: The `scripts/vercel.sh` script now includes multiple fallback approaches:
   - Patch file approach using `scripts/vodozemac-cargo.patch`
   - sed command approach as backup
   - Manual verification and logging

2. **Manual Fix**: 
   ```bash
   # Navigate to vodozemac directory
   cd vodozemac
   
   # Add crate-type manually to Cargo.toml
   echo "" >> Cargo.toml
   echo "[lib]" >> Cargo.toml
   echo 'crate-type = ["cdylib", "rlib"]' >> Cargo.toml
   ```

3. **Environment Variables**: Ensure these are set in Vercel:
   ```json
   {
     "env": {
       "CARGO_NET_GIT_FETCH_WITH_CLI": "true",
       "RUST_BACKTRACE": "1"
     }
   }
   ```

### Rust Toolchain Issues

#### Error: "rustc: command not found"
**Problem**: Rust toolchain not installed or not in PATH.

**Solution**: The script automatically installs Rust:
```bash
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
```

#### Error: "wasm-pack: command not found"
**Problem**: wasm-pack not installed.

**Solution**: The script automatically installs wasm-pack:
```bash
cargo install wasm-pack
```

### Flutter Build Issues

#### Error: "flutter: command not found"
**Problem**: Flutter SDK not installed or not in PATH.

**Solution**: The script automatically installs Flutter:
```bash
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:$(pwd)/flutter/bin"
```

### Network and Git Issues

#### Error: "failed to fetch some crates"
**Problem**: Network issues with crates.io or git dependencies.

**Solution**: Set environment variables in Vercel:
```json
{
  "env": {
    "CARGO_NET_GIT_FETCH_WITH_CLI": "true"
  }
}
```

### Memory and Performance Issues

#### Error: "Killed" or "Out of memory"
**Problem**: Vercel build environment running out of memory.

**Solutions**:
1. **Optimize dependencies** in pubspec.yaml
2. **Use precompiled binaries** where possible
3. **Split build process** into multiple steps
4. **Contact Vercel support** for larger build environments

## 🔧 Advanced Debugging

### Enable Verbose Logging
Add these environment variables to Vercel:
```bash
RUST_LOG=debug
RUST_BACKTRACE=full
VERBOSE=1
```

### Manual Build Testing
Test the build process locally:
```bash
# Clone the repository
git clone https://github.com/your-org/rechain.git
cd rechain

# Run the vercel build script
bash scripts/vercel.sh

# Check the output
ls -la build/web/
```

### Check Cargo Configuration
Verify Cargo configuration:
```bash
# Check Rust version
rustc --version
cargo --version

# Check Cargo configuration
cat ~/.cargo/config
```

## 🛠️ Vercel Configuration

### vercel.json Settings
Ensure your `vercel.json` includes proper settings:
```json
{
  "buildCommand": "bash scripts/vercel.sh",
  "outputDirectory": "build/web",
  "installCommand": "echo 'Using custom build script'",
  "headers": [
    {
      "source": "/(.*\\.wasm)",
      "headers": [
        {
          "key": "Content-Type",
          "value": "application/wasm"
        },
        {
          "key": "Cross-Origin-Embedder-Policy",
          "value": "require-corp"
        },
        {
          "key": "Cross-Origin-Opener-Policy",
          "value": "same-origin"
        }
      ]
    }
  ],
  "env": {
    "FLUTTER_WEB": "true",
    "CARGO_NET_GIT_FETCH_WITH_CLI": "true",
    "RUST_BACKTRACE": "1"
  }
}
```

### Environment Variables
Set these in Vercel Dashboard → Settings → Environment Variables:
- `FLUTTER_WEB`: `true`
- `CARGO_NET_GIT_FETCH_WITH_CLI`: `true`
- `RUST_BACKTRACE`: `1`

## 📋 Build Process Flow

### 1. Environment Setup
```bash
# Install Rust
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# Install Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:$(pwd)/flutter/bin"
```

### 2. Vodozemac Compilation
```bash
# Clone vodozemac
git clone https://github.com/matrix-org/vodozemac.git
cd vodozemac

# Ensure crate-type configuration
# (Handled by patch file or sed commands)

# Install and run wasm-pack
cargo install wasm-pack
wasm-pack build --target web
```

### 3. Locale Configuration
```bash
# Generate locale files
cd scripts
chmod +x generate_locale_config.sh
./generate_locale_config.sh
chmod +x generate-locale-config.sh
./generate-locale-config.sh
```

### 4. Flutter Build
```bash
# Get dependencies
flutter pub get

# Build web application
flutter build web --release
```

## 🎯 Quick Fixes Checklist

### Before Deploying:
- [ ] Verify `scripts/vercel.sh` permissions: `chmod +x scripts/vercel.sh`
- [ ] Check `vercel.json` configuration
- [ ] Ensure all dependencies in `pubspec.yaml` are correct
- [ ] Test build locally: `bash scripts/vercel.sh`

### If Build Fails:
- [ ] Check Vercel logs for specific error messages
- [ ] Verify environment variables are set
- [ ] Check if Rust and Flutter are properly installed
- [ ] Ensure vodozemac crate-type is correctly configured
- [ ] Contact support with full error logs

### Performance Optimization:
- [ ] Minimize dependencies in `pubspec.yaml`
- [ ] Use precompiled assets where possible
- [ ] Enable proper caching headers
- [ ] Optimize images and static assets

## 📞 Support Resources

### Documentation:
- [Vercel Documentation](https://vercel.com/docs)
- [Flutter Web Documentation](https://flutter.dev/web)
- [Rust WASM Documentation](https://rustwasm.github.io/docs)

### Community Support:
- Vercel Discord: https://vercel.com/discord
- Flutter Community: https://flutter.dev/community
- Rust Community: https://www.rust-lang.org/community

### Reporting Issues:
If you encounter persistent issues:
1. Capture full build logs
2. Include environment details (OS, versions)
3. Provide steps to reproduce
4. Submit to appropriate GitHub repository

---

*REChain Vercel Troubleshooting Guide v4.1.10+1160*
*Last Updated: 2025*
