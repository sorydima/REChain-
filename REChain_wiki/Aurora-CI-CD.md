# CI/CD for Aurora OS

## Build Automation
- Use GitHub Actions, GitLab CI, or similar to automate builds.
- Example GitHub Actions step:
  ```yaml
  - name: Build for Aurora OS
    run: |
      git clone https://github.com/auroraos/flutaurora.git
      cd flutaurora
      ./setup.sh
      export PATH="$PWD/bin:$PATH"
      cd $GITHUB_WORKSPACE
      flutter-aurora pub get
      flutter-aurora build aurora
  ```

## Test Automation
- Run unit and integration tests with `flutter-aurora test` (if supported).
- Collect and upload build artifacts (RPMs, logs).

## Best Practices
- Cache dependencies to speed up builds.
- Test on multiple Aurora OS versions if possible.
- Automate RPM packaging and store submission steps.

---

For more, see [Packaging & Distribution](Aurora-Packaging-Distribution.md). 