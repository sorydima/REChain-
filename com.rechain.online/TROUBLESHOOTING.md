# REChain Online Flatpak Troubleshooting Guide

This guide helps resolve common issues when building and running the REChain Online Flatpak package.

## Build Issues

### 1. Flatpak Builder Not Found

**Error:**
```
Command 'flatpak-builder' not found
```

**Solution:**
```bash
# Fedora/RHEL
sudo dnf install flatpak-builder

# Ubuntu/Debian
sudo apt install flatpak-builder

# Arch Linux
sudo pacman -S flatpak-builder
```

### 2. Missing Runtime

**Error:**
```
Error: org.freedesktop.Platform 24.08 not installed
```

**Solution:**
```bash
# Install required runtime
flatpak install org.freedesktop.Platform 24.08

# Install SDK
flatpak install org.freedesktop.Sdk 24.08

# List available runtimes
flatpak list --runtime
```

### 3. Network Timeouts During Download

**Error:**
```
Failed to download source: Connection timed out
```

**Solutions:**
```bash
# Try again (temporary network issue)
flatpak-builder --user --install com.rechain.online.json

# Use a mirror or proxy
export HTTP_PROXY=http://proxy.example.com:8080
export HTTPS_PROXY=http://proxy.example.com:8080

# Pre-download sources manually
wget -O sources/libname.tar.gz https://example.com/libname.tar.gz
```

### 4. Build Failures Due to Memory

**Error:**
```
Killed signal terminated program CC=clang
```

**Solution:**
```bash
# Reduce parallel jobs
export MAKEFLAGS="-j2"

# Or build with limited resources
flatpak-builder --jobs=2 com.rechain.online.json

# Add swap space (Linux)
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

### 5. Permission Denied

**Error:**
```
Permission denied: '/app/bin/rechainonline'
```

**Solution:**
```bash
# Ensure execute permissions
chmod +x /path/to/REChain/rechainonline

# Clean rebuild
flatpak-builder --clean com.rechain.online.json
flatpak-builder --user --install --force-clean com.rechain.online.json
```

### 6. Checksum Mismatch

**Error:**
```
sha256 mismatch for source
```

**Solution:**
```bash
# Calculate actual checksum
sha256sum downloaded-file.tar.gz

# Update manifest with correct checksum
# Edit com.rechain.online.json and update the sha256 value
```

### 7. Module Build Failures

**Error:**
```
Module xxx failed to build
```

**Solution:**
```bash
# Clean and retry
flatpak-builder --clean com.rechain.online.json

# Build specific module only
cd build
# Navigate to module directory and build manually

# Check build logs
cat /tmp/flatpak-builder/logs/xxx.log
```

## Runtime Issues

### 1. Application Won't Start

**Error:**
```
Failed to start: Cannot open display
```

**Solutions:**
```bash
# Check display connection
echo $DISPLAY

# Install X11 or Wayland libraries
# For X11:
flatpak install org.freedesktop.Platform/x86_64/23.08 org.freedesktop.Sdk/x86_64/23.08

# For Wayland (usually included in runtime)
# Check you're using a Wayland compositor
```

### 2. Missing Dependencies at Runtime

**Error:**
```
Library not found: libxxx.so
```

**Solution:**
```bash
# Add library path
export LD_LIBRARY_PATH=/app/lib:/app/lib/plugins:$LD_LIBRARY_PATH

# Install missing library as a module
# Add to com.rechain.online.json modules section
```

### 3. Network Connection Failed

**Error:**
```
Cannot connect to server: Network is unreachable
```

**Solution:**
```bash
# Check network permission
flatpak info --show-permissions com.rechain.online

# Ensure --share=network is in finish-args
```

### 4. Notifications Not Working

**Error:**
```
Notifications not appearing
```

**Solution:**
```bash
# Check notification permission
flatpak info --show-permissions com.rechain.online

# Ensure talk-name=org.freedesktop.Notifications is present
# Restart the application
```

### 5. Audio/Microphone Not Working

**Error:**
```
Cannot access audio device
```

**Solution:**
```bash
# Check audio permissions
flatpak info --show-permissions com.rechain.online

# Ensure --socket=pulseaudio is present
# Install PulseAudio (if not available)
flatpak install org.freedesktop.Platform.PulseAudio/x86_64/23.08
```

### 6. FilePicker Issues

**Error:**
```
Cannot open file picker
```

**Solution:**
```bash
# Add file system permissions
# Edit finish-args in com.rechain.online.json:
"--filesystem=home",
"--filesystem=xdg-download",

# Or use portal access (more secure)
# The app should use xdg-desktop-portal
```

### 7. Screen Sharing Not Working

**Error:**
```
Cannot capture screen
```

**Solution:**
```bash
# Add screen capture permission
# For X11:
flatpak install org.freedesktop.Platform/x86_64/23.08

# For Wayland:
# Ensure xdg-desktop-portal is installed on host
sudo apt install xdg-desktop-portal-wlr  # For wlroots compositors

# Restart the application
```

### 8. Poor Performance

**Error:**
```
Application is slow or laggy
```

**Solutions:**
```bash
# Enable hardware acceleration
# Add to finish-args:
"--env=MOZ_WEBRENDER=1",
"--env=WEBKIT_DISABLE_COMPOSITOR_MODE=1",

# Use discrete GPU if available
--env=PRIMUSLIB=/usr/lib/primus/libprender.so

# Check system resources
htop
```

### 9. High Memory Usage

**Error:**
```
Out of memory or application uses too much RAM
```

**Solution:**
```bash
# Limit application memory
flatpak run --env=MEMORY_LIMIT=2G com.rechain.online

# Check running processes
ps aux | grep rechain

# Clear cache
# Inside the app, clear stored data
rm -rf ~/.local/share/rechain
```

## Configuration Issues

### 1. Settings Not Saving

**Error:**
```
Configuration resets after restart
```

**Solution:**
```bash
# Check persistence paths
flatpak info --show-permissions com.rechain.online

# Ensure these are present:
--persist=.config/rechain
--persist=.local/share/rechain

# Manual backup/restore
cp -r ~/.local/share/rechain ~/.local/share/rechain.backup
```

### 2. Login/Session Issues

**Error:**
```
Cannot login or session keeps expiring
```

**Solution:**
```bash
# Check token storage
ls -la ~/.local/share/rechain/

# Clear tokens (will require re-login)
rm ~/.local/share/rechain/accounts/

# Check network connectivity
curl https://matrix.rechain.network/_matrix/client/versions
```

### 3. Encryption Keys Lost

**Error:**
```
E2E encryption keys missing
```

**Solution:**
```bash
# Backup location
~/.local/share/rechain/e2e/

# Restore from backup
cp -r ~/.backup/rechain/e2e/ ~/.local/share/rechain/

# If keys are lost, old messages cannot be decrypted
# New messages will work normally
```

### 4. Bridge Connection Failed

**Error:**
```
Cannot connect to Telegram/Discord/etc bridge
```

**Solution:**
```bash
# Check bridge configuration
cat ~/.config/rechain/bridges.yaml

# Verify bridge permissions
flatpak info --show-permissions com.rechain.online

# Restart bridge service
# Inside app: Settings > Bridges > Restart
```

## Update Issues

### 1. Update Failed

**Error:**
```
Update interrupted or failed
```

**Solution:**
```bash
# Clear update cache
rm -rf ~/.cache/flatpak-builder/

# Retry update
flatpak update com.rechain.online

# Force reinstall
flatpak uninstall com.rechain.online
flatpak install com.rechain.online
```

### 2. Version Conflict

**Error:**
```
Version mismatch between components
```

**Solution:**
```bash
# Check installed version
flatpak info com.rechain.online

# Clear all data and reinstall
flatpak uninstall com.rechain.online
rm -rf ~/.local/share/rechain
rm -rf ~/.config/rechain
flatpak install com.rechain.online
```

## Logging and Debugging

### Enable Debug Logging

```bash
# Run with verbose output
flatpak run --verbose com.rechain.online

# Enable environment debug
flatpak run --env=G_MESSAGES_DEBUG=all com.rechain.online

# Check logs
journalctl -u flatpak-helper
```

### View Application Logs

```bash
# Flatpak logs
flatpak logs com.rechain.online

# Last 100 lines
flatpak logs --lines=100 com.rechain.online

# Follow in real-time
flatpak logs -f com.rechain.online
```

### Capture Debug Info

```bash
# Generate debug report
flatpak run --command=sh com.rechain.online
# Inside shell:
echo $PATH
echo $LD_LIBRARY_PATH
ls -la /app/
ls -la ~/.local/share/rechain/
exit

# Save output to file
flatpak logs com.rechain.online > debug.log 2>&1
```

## Performance Profiling

### CPU Profiling

```bash
# Using perf (requires perf on host)
perf record -g -o perf.data flatpak run com.rechain.online
perf report -i perf.data
```

### Memory Profiling

```bash
# Using valgrind
flatpak run --env=VALGRIND_OPTS="--tool=memcheck" com.rechain.online

# Check memory usage
ps aux | grep rechain
pmap $(pgrep rechain) | tail -1
```

### Network Profiling

```bash
# Monitor network activity
sudo nethogs
sudo tcpdump -i any -w network.pcap host matrix.rechain.network
```

## Common Solutions Summary

| Issue | Quick Fix |
|-------|-----------|
| Won't start | `flatpak run --verbose com.rechain.online` |
| Network error | Check `--share=network` permission |
| No audio | Install PulseAudio module |
| Slow performance | Enable hardware acceleration |
| Memory issues | Limit with `MEMORY_LIMIT` env |
| Settings lost | Check `--persist` paths |
| Update failed | Clear cache and retry |
| Permission error | Check `--finish-args` in manifest |

## Get Help

If your issue isn't listed here:

1. **Check Application Logs**
   ```bash
   flatpak logs com.rechain.online > logs.txt
   ```

2. **Search Existing Issues**
   - GitHub: https://github.com/sorydima/REChain-/issues
   - Matrix: #rechain:rechain.network

3. **Create New Issue**
   Include:
   - Operating system and version
   - Flatpak version: `flatpak --version`
   - Complete error message
   - Steps to reproduce
   - Logs (from `flatpak logs`)

4. **Community Support**
   - Matrix Chat: #rechain:rechain.network
   - Email: support@rechain.network

## Useful Commands Reference

```bash
# Install from local build
flatpak-builder --user --install --force-clean repo com.rechain.online.json

# Run the application
flatpak run com.rechain.online

# View permissions
flatpak info --show-permissions com.rechain.online

# Update
flatpak update com.rechain.online

# Uninstall
flatpak uninstall com.rechain.online

# Create bundle
flatpak build-bundle repo rechain-online.flatpak com.rechain.online

# Install from bundle
flatpak install rechain-online.flatpak

# Clear app data
rm -rf ~/.local/share/rechain

# Export debug logs
flatpak logs com.rechain.online > debug.log
```

## Related Documentation

- [BUILD_FLATHUB.md](BUILD_FLATHUB.md) - Complete build instructions
- [REChain Documentation](https://docs.rechain.network)
- [Flatpak Documentation](https://docs.flatpak.org/)
- [Flatpak Builder Manual](https://github.com/flatpak/flatpak-builder)


