# F-Droid Repository Configuration for REChain v4.1.10+1160
# Updated on 2025-01-09 for enhanced security and performance

repo_url = "https://github.com/sorydima/REChain-.git"
repo_name = "REChain ®️ 🪐 ✨ Repo"
repo_icon = "fdroid-icon.png"
repo_description = """
REChain ®️ 🪐 ✨ Repo - Version 4.1.10+1160

Advanced Matrix-based communication platform with enhanced security,
privacy features, and modern messaging capabilities.
"""

# Repository settings
archive_older = 0
archive_url = "https://archive.rechain.network/fdroid"
archive_name = "REChain Archive"
archive_icon = "fdroid-icon.png"
archive_description = "Archived versions of REChain applications"

# Local repository settings
local_copy_dir = "/fdroid"
repo_pubkey = "REChain_public_key.asc"
repo_keyalias = "key0"
keystore = "key.jks"
keystorepass = "change_me_secure_password"
keypass = "change_me_secure_password"

# Build and signing configuration
keydname = "CN=REChain, O=REChain Inc, L=Remote, ST=Remote, C=US"
keyvalidity = "36500"  # 100 years

# Repository metadata
repo_maxage = 3600  # 1 hour cache
repo_timestamp = "2025-01-09T00:00:00Z"

# Security enhancements
gpg_key = "REChain_GPG_key.asc"
gpg_passphrase = "change_me_gpg_passphrase"

# Mirror configuration
mirrors = [
    "https://fdroid.rechain.network/repo",
    "https://mirror1.rechain.network/fdroid",
    "https://mirror2.rechain.network/fdroid"
]

# Categories and tags
categories = [
    "Internet",
    "Communication",
    "Security",
    "Privacy"
]

# Build server configuration
build_server = {
    "enabled": True,
    "url": "https://build.rechain.network",
    "api_key": "change_me_build_api_key",
    "max_concurrent_builds": 5,
    "timeout": 3600
}

# Notification settings
notifications = {
    "email": "fdroid@rechain.network",
    "webhook": "https://hooks.rechain.network/fdroid",
    "slack": "#fdroid-updates"
}

# Version information
version = "4.1.10+1160"
build_date = "2025-01-09"
release_notes = """
REChain v4.1.10+1160 Release Notes:
- Enhanced security with improved encryption
- Performance optimizations for large deployments
- New features for enterprise communication
- Bug fixes and stability improvements
- Updated dependencies for better compatibility
"""

# Advanced configuration
advanced = {
    "enable_index_v2": True,
    "enable_index_v1": False,
    "compress_icons": True,
    "generate_screenshots": True,
    "auto_update_metadata": True,
    "scan_for_viruses": True,
    "require_signatures": True
}
