#!/usr/bin/env python3
"""
REChain Font Validation Script v4.1.10+1160
Updated: 2025-01-09

This script validates font integrity, compatibility, and performance
for the REChain platform fonts collection.
"""

import os
import sys
import json
import hashlib
from pathlib import Path
from typing import Dict, List, Optional, Tuple

class FontValidator:
    def __init__(self, fonts_dir: str):
        self.fonts_dir = Path(fonts_dir)
        self.config_file = self.fonts_dir / "font_config.json"
        self.checksum_file = self.fonts_dir / "font_checksums.sha256"
        self.errors: List[str] = []
        self.warnings: List[str] = []

    def log_error(self, message: str) -> None:
        """Log an error message."""
        self.errors.append(message)
        print(f"❌ ERROR: {message}", file=sys.stderr)

    def log_warning(self, message: str) -> None:
        """Log a warning message."""
        self.warnings.append(message)
        print(f"⚠️  WARNING: {message}")

    def log_success(self, message: str) -> None:
        """Log a success message."""
        print(f"✅ {message}")

    def load_config(self) -> Optional[Dict]:
        """Load font configuration."""
        if not self.config_file.exists():
            self.log_error(f"Configuration file not found: {self.config_file}")
            return None

        try:
            with open(self.config_file, 'r', encoding='utf-8') as f:
                return json.load(f)
        except json.JSONDecodeError as e:
            self.log_error(f"Invalid JSON in config file: {e}")
            return None

    def check_font_files(self, config: Dict) -> bool:
        """Check if all required font files exist."""
        success = True

        # Check Roboto fonts
        if 'roboto' in config['fonts']:
            roboto_config = config['fonts']['roboto']
            roboto_dir = self.fonts_dir / "Roboto"

            if not roboto_dir.exists():
                self.log_error("Roboto directory not found")
                success = False
            else:
                for font_file in roboto_config['files']:
                    font_path = roboto_dir / font_file
                    if not font_path.exists():
                        self.log_error(f"Roboto font missing: {font_file}")
                        success = False
                    else:
                        self.log_success(f"Roboto font found: {font_file}")

                # Check Roboto Mono
                if 'mono_variant' in roboto_config:
                    mono_config = roboto_config['mono_variant']
                    for mono_file in mono_config['files']:
                        mono_path = roboto_dir / mono_file
                        if not mono_path.exists():
                            self.log_warning(f"Roboto Mono font missing: {mono_file}")
                        else:
                            self.log_success(f"Roboto Mono font found: {mono_file}")

        # Check Noto Emoji fonts
        if 'noto_emoji' in config['fonts']:
            emoji_config = config['fonts']['noto_emoji']
            emoji_dir = self.fonts_dir / "NotoEmoji"

            if not emoji_dir.exists():
                self.log_error("NotoEmoji directory not found")
                success = False
            else:
                for emoji_file in emoji_config['files']:
                    emoji_path = emoji_dir / emoji_file
                    if not emoji_path.exists():
                        self.log_error(f"Noto Emoji font missing: {emoji_file}")
                        success = False
                    else:
                        self.log_success(f"Noto Emoji font found: {emoji_file}")

        return success

    def validate_checksums(self) -> bool:
        """Validate font file checksums."""
        if not self.checksum_file.exists():
            self.log_warning("Checksum file not found, skipping checksum validation")
            return True

        success = True
        expected_checksums = {}

        # Load expected checksums
        try:
            with open(self.checksum_file, 'r', encoding='utf-8') as f:
                for line in f:
                    if line.strip():
                        checksum, filepath = line.strip().split('  ', 1)
                        expected_checksums[filepath] = checksum
        except Exception as e:
            self.log_error(f"Failed to load checksums: {e}")
            return False

        # Validate each font file
        for root, dirs, files in os.walk(self.fonts_dir):
            for file in files:
                if file.endswith('.ttf'):
                    filepath = os.path.join(root, file)
                    relative_path = os.path.relpath(filepath, self.fonts_dir)

                    if relative_path in expected_checksums:
                        try:
                            with open(filepath, 'rb') as f:
                                actual_checksum = hashlib.sha256(f.read()).hexdigest()

                            if actual_checksum != expected_checksums[relative_path]:
                                self.log_error(f"Checksum mismatch for {relative_path}")
                                success = False
                            else:
                                self.log_success(f"Checksum valid for {relative_path}")
                        except Exception as e:
                            self.log_error(f"Failed to validate {relative_path}: {e}")
                            success = False
                    else:
                        self.log_warning(f"No checksum found for {relative_path}")

        return success

    def check_fonttools_validation(self) -> bool:
        """Validate fonts using FontTools if available."""
        try:
            import fontTools.ttLib
            import fontTools.subset
        except ImportError:
            self.log_warning("FontTools not available, skipping advanced validation")
            return True

        success = True

        # Validate each TTF file
        for root, dirs, files in os.walk(self.fonts_dir):
            for file in files:
                if file.endswith('.ttf'):
                    filepath = os.path.join(root, file)

                    try:
                        # Basic font validation
                        font = fontTools.ttLib.TTFont(filepath)
                        font.close()

                        self.log_success(f"FontTools validation passed for {file}")
                    except Exception as e:
                        self.log_error(f"FontTools validation failed for {file}: {e}")
                        success = False

        return success

    def check_flutter_integration(self) -> bool:
        """Check Flutter integration."""
        pubspec_path = self.fonts_dir.parent / "pubspec.yaml"

        if not pubspec_path.exists():
            self.log_warning("pubspec.yaml not found, skipping Flutter integration check")
            return True

        try:
            with open(pubspec_path, 'r', encoding='utf-8') as f:
                content = f.read()

            if 'fonts:' in content:
                self.log_success("Flutter fonts configuration found in pubspec.yaml")
                return True
            else:
                self.log_warning("Flutter fonts configuration not found in pubspec.yaml")
                return False
        except Exception as e:
            self.log_error(f"Failed to check Flutter integration: {e}")
            return False

    def generate_report(self) -> Dict:
        """Generate validation report."""
        return {
            'version': '4.1.10+1160',
            'timestamp': '2025-01-09',
            'errors': self.errors,
            'warnings': self.warnings,
            'success': len(self.errors) == 0,
            'summary': {
                'total_errors': len(self.errors),
                'total_warnings': len(self.warnings)
            }
        }

    def run_validation(self) -> bool:
        """Run complete font validation."""
        print("🔍 REChain Font Validation Script v4.1.10+1160")
        print("=" * 50)

        # Load configuration
        config = self.load_config()
        if not config:
            return False

        # Run validation checks
        checks = [
            ("Font files existence", self.check_font_files, config),
            ("Checksum validation", self.validate_checksums, None),
            ("FontTools validation", self.check_fonttools_validation, None),
            ("Flutter integration", self.check_flutter_integration, None),
        ]

        all_passed = True

        for check_name, check_func, check_config in checks:
            print(f"\n🔍 Running {check_name}...")
            try:
                if check_config is not None:
                    passed = check_func(check_config)
                else:
                    passed = check_func()

                if passed:
                    self.log_success(f"{check_name} passed")
                else:
                    self.log_error(f"{check_name} failed")
                    all_passed = False
            except Exception as e:
                self.log_error(f"{check_name} failed with exception: {e}")
                all_passed = False

        # Generate report
        report = self.generate_report()

        print(f"\n📊 Validation Summary:")
        print(f"   Errors: {report['summary']['total_errors']}")
        print(f"   Warnings: {report['summary']['total_warnings']}")
        print(f"   Status: {'✅ PASSED' if report['success'] else '❌ FAILED'}")

        # Save report
        report_file = self.fonts_dir / "validation_report.json"
        try:
            with open(report_file, 'w', encoding='utf-8') as f:
                json.dump(report, f, indent=2, ensure_ascii=False)
            self.log_success(f"Validation report saved: {report_file}")
        except Exception as e:
            self.log_error(f"Failed to save validation report: {e}")

        return all_passed

def main():
    """Main entry point."""
    fonts_dir = os.path.dirname(os.path.abspath(__file__))
    validator = FontValidator(fonts_dir)

    success = validator.run_validation()
    sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()
