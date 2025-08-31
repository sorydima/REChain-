# Packaging & Distribution for Aurora OS

## RPM Packaging
- Use the spec file in `aurora/rpm/com.rechain.dapp.spec` for RPM builds.
- Build with:
  ```sh
  rpmbuild -ba aurora/rpm/com.rechain.dapp.spec
  ```
- Ensure all assets, icons, and desktop files are included.

## Desktop Files & Icons
- Edit `aurora/desktop/com.rechain.dapp.desktop` for app metadata and permissions.
- Place icons in `aurora/icons/` with required sizes (86x86, 108x108, 128x128, 172x172).

## Aurora Store Submission
- Test your RPM on a real device/emulator.
- Follow Aurora Store guidelines for submission.
- Provide screenshots, description, and support info.

---

For more, see the [Platform Support](Platform-Support.md) and [Troubleshooting](Aurora-Troubleshooting.md) guides. 