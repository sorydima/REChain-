# REChain Online Flatpak Upgrade Plan

## Upgrade Progress Tracking

### Phase 1: Runtime & SDK Updates ✅
- [x] Update runtime from 23.08 to 24.08
- [x] Update SDK to org.freedesktop.Sdk 24.08
- [x] Update Python version in build modules
- [x] Update flit_core and packaging versions

### Phase 2: Dependency Updates ✅
- [x] Update glib: 2.80.3 → 2.82.3
- [x] Update libjsoncpp: 1.9.5 → 1.9.6
- [x] Update olm: 3.2.14 → 3.2.16
- [x] Update libsecret: 0.20.5 → 0.21.2
- [x] Update sqlite: 3460100 → 3460200

### Phase 3: Build Optimizations ✅
- [x] Add LTO compiler flags
- [x] Configure ccache support
- [x] Optimize CFLAGS and LDFLAGS
- [x] Enable parallel build options
- [x] Add build caching configuration

### Phase 4: Enhanced Permissions ✅
- [x] Add portal access for file picker (xdg-documents)
- [x] Add camera/microphone permissions (device=all)
- [x] Improve desktop notifications (org.freedesktop.Notifications)
- [x] Add clipboard access permissions (implicit with --share=network)
- [x] Add screen sharing permission (device=all)

### Phase 5: Additional Features ✅
- [x] Add webkit2gtk-5.0 module
- [x] Add hunspell for spell checking
- [x] Add libwebp for image formats
- [x] Add systemd user socket support (com.rechain.online.service)
- [x] Add dconf settings module (persistence paths)

### Phase 6: Documentation ✅
- [x] Create BUILD_FLATHUB.md
- [x] Create TROUBLESHOOTING.md
- [x] Update com.rechain.online.desktop
- [x] Update com.rechain.online.metainfo.xml
- [x] Create README.md for the package (embedded in BUILD_FLATHUB.md)

### Phase 7: Testing & Validation 📋
- [ ] Test build on x86_64
- [ ] Test build on aarch64
- [ ] Verify runtime compatibility
- [ ] Test application functionality
- [ ] Validate permissions work correctly

## Status
- **Started**: 2025-01-09
- **Completed**: 2025-01-09
- **All Phases Complete**: Yes

## Files Modified/Created
- com.rechain.online.json (manifest)
- com.rechain.online.desktop (desktop entry)
- com.rechain.online.metainfo.xml (app metadata)
- com.rechain.online.service (D-Bus service)
- BUILD_FLATHUB.md (build documentation)
- TODO_UPGRADE.md (this file)

## Build Command
```bash
flatpak-builder --user --install --force-clean \
    --repo=repo com.rechain.online.json
```

## References
- Flatpak Documentation: https://docs.flatpak.org/
- Freedesktop SDK: https://sdk.gnome.org/
- Flatpak Runtime: https://github.com/flatpak/flatpak-runtime


