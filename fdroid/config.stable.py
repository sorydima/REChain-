# F-Droid Stable Repository Configuration for REChain v4.1.10+1160
# Updated on 2025-01-09 for stable production releases

repo_url = "https://github.com/sorydima/REChain-.git"
repo_name = "REChain ®️ 🪐 ✨ Repo"
repo_icon = "fdroid-icon.png"
repo_description = """
REChain ®️ 🪐 ✨ Repo - Version 4.1.10+1160

Stable production releases of REChain platform.
Recommended for production use and general users.
"""

# Repository settings for stable releases
archive_older = 30  # Keep stable builds for 30 days
archive_url = "https://stable.rechain.network/fdroid"
archive_name = "REChain Stable Archive"
archive_icon = "fdroid-icon.png"
archive_description = "Archived stable releases of REChain applications"

# Local repository settings
local_copy_dir = "/fdroid-stable"
repo_pubkey = "REChain_stable_public_key.asc"
repo_keyalias = "key0"
keystore = "key.stable.jks"
keystorepass = "change_me_secure_stable_password"
keypass = "change_me_secure_stable_password"

# Build and signing configuration for stable builds
keydname = "CN=REChain Stable, O=REChain Inc, L=Remote, ST=Remote, C=US"
keyvalidity = "36500"  # 100 years

# Repository metadata for stable
repo_maxage = 7200  # 2 hours cache for stable releases
repo_timestamp = "2025-01-09T00:00:00Z"

# Security enhancements for stable builds
gpg_key = "REChain_Stable_GPG_key.asc"
gpg_passphrase = "change_me_stable_gpg_passphrase"

# Mirror configuration for stable
mirrors = [
    "https://stable.fdroid.rechain.network/repo",
    "https://stable-mirror1.rechain.network/fdroid",
    "https://stable-mirror2.rechain.network/fdroid"
]

# Categories and tags for stable
categories = [
    "Internet",
    "Communication",
    "Security",
    "Privacy"
]

# Build server configuration for stable
build_server = {
    "enabled": True,
    "url": "https://stable-build.rechain.network",
    "api_key": "change_me_stable_build_api_key",
    "max_concurrent_builds": 3,
    "timeout": 7200  # 2 hours for stable builds
}

# Notification settings for stable
notifications = {
    "email": "stable-fdroid@rechain.network",
    "webhook": "https://hooks.rechain.network/stable-fdroid",
    "slack": "#stable-fdroid-updates"
}

# Version information for stable
version = "4.1.10+1160-stable"
build_date = "2025-01-09"
release_notes = """
REChain v4.1.10+1160 Stable Release Notes:
- Production-ready stable release
- Thoroughly tested and validated
- Security audited and approved
- Performance optimized for production
- Long-term support included
- Enterprise-grade reliability
"""

# Advanced configuration for stable builds
advanced = {
    "enable_index_v2": True,
    "enable_index_v1": False,
    "compress_icons": True,
    "generate_screenshots": True,
    "auto_update_metadata": True,
    "scan_for_viruses": True,
    "require_signatures": True,
    "allow_unsigned_builds": False,
    "enable_debug_builds": False,
    "include_source_code": True,
    "enable_enterprise_features": True
}
