#!/usr/bin/env python3
"""
REChain Bridges Validation Script
Validates bridge configurations, connectivity, and functionality
"""

import asyncio
import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
import time
import yaml
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class ValidationStatus(Enum):
    PASS = "✅ PASS"
    FAIL = "❌ FAIL"
    WARN = "⚠️  WARN"
    SKIP = "⏭️  SKIP"


@dataclass
class ValidationResult:
    """Result of a validation check."""
    name: str
    status: ValidationStatus
    message: str
    details: Dict[str, Any] = field(default_factory=dict)
    duration_ms: float = 0.0


class BridgeValidator:
    """Validates REChain bridge configurations and connectivity."""
    
    def __init__(self, bridges_dir: str = "bridges"):
        self.bridges_dir = Path(bridges_dir)
        self.results: List[ValidationResult] = []
        self.start_time: float = 0
    
    def log_result(self, result: ValidationResult):
        """Log a validation result."""
        self.results.append(result)
        icon = result.status.value
        print(f"{icon} [{result.duration_ms:.1f}ms] {result.name}: {result.message}")
    
    def validate_all(self) -> bool:
        """Run all validations."""
        self.start_time = time.time()
        all_passed = True
        
        print("=" * 60)
        print("REChain Bridges Validation Suite")
        print("=" * 60)
        print(f"Started: {datetime.now().isoformat()}")
        print()
        
        # Run validation categories
        all_passed &= self.validate_file_structure()
        all_passed &= self.validate_config_files()
        all_passed &= self.validate_registration_files()
        all_passed &= self.validate_docker_compose()
        all_passed &= self.validate_security_config()
        all_passed &= self.validate_monitoring_config()
        all_passed &= self.validate_documentation()
        
        # Print summary
        self.print_summary()
        
        return all_passed
    
    def validate_file_structure(self) -> bool:
        """Validate bridge directory structure."""
        print("\n📁 File Structure Validation")
        print("-" * 40)
        
        all_passed = True
        
        # Check required files exist
        required_files = [
            "docker-compose.yml",
            "README_Bridges.md",
            "telegram_config.yaml",
            "discord_config.yaml",
            "signal_config.yaml",
            "whatsapp_config.yaml",
            "slack_config.yaml",
        ]
        
        for filename in required_files:
            filepath = self.bridges_dir / filename
            if filepath.exists():
                self.log_result(ValidationResult(
                    name=f"File exists: {filename}",
                    status=ValidationStatus.PASS,
                    message=f"Found {filename}"
                ))
            else:
                all_passed = False
                self.log_result(ValidationResult(
                    name=f"File exists: {filename}",
                    status=ValidationStatus.FAIL,
                    message=f"Missing required file: {filename}"
                ))
        
        # Check telegram_super_tma directory
        tma_dir = self.bridges_dir / "telegram_super_tma"
        if tma_dir.exists():
            self.log_result(ValidationResult(
                name="Telegram Super TMA directory",
                status=ValidationStatus.PASS,
                message="Telegram Super TMA directory exists"
            ))
        else:
            all_passed = False
            self.log_result(ValidationResult(
                name="Telegram Super TMA directory",
                status=ValidationStatus.FAIL,
                message="Telegram Super TMA directory not found"
            ))
        
        return all_passed
    
    def validate_config_files(self) -> bool:
        """Validate bridge configuration files."""
        print("\n⚙️  Configuration Validation")
        print("-" * 40)
        
        all_passed = True
        
        config_files = list(self.bridges_dir.glob("*_config.yaml"))
        
        for config_file in config_files:
            result = self._validate_single_config(config_file)
            if result.status == ValidationStatus.FAIL:
                all_passed = False
            self.log_result(result)
        
        return all_passed
    
    def _validate_single_config(self, filepath: Path) -> ValidationResult:
        """Validate a single configuration file."""
        start = time.time()
        
        try:
            with open(filepath) as f:
                config = yaml.safe_load(f)
            
        except yaml.YAMLError as e:
            return ValidationResult(
                name=f"Config validation: {filepath.name}",
                status=ValidationStatus.FAIL,
                message=f"YAML syntax error: {e}",
                duration_ms=(time.time() - start) * 1000
            )
        
        except FileNotFoundError:
            return ValidationResult(
                name=f"Config validation: {filepath.name}",
                status=ValidationStatus.FAIL,
                message=f"File not found",
                duration_ms=(time.time() - start) * 1000
            )
        
        # Check required sections
        required_sections = ["homeserver", "appservice"]
        missing_sections = []
        
        for section in required_sections:
            if section not in config:
                missing_sections.append(section)
        
        if missing_sections:
            return ValidationResult(
                name=f"Config validation: {filepath.name}",
                status=ValidationStatus.FAIL,
                message=f"Missing sections: {', '.join(missing_sections)}",
                duration_ms=(time.time() - start) * 1000
            )
        
        # Check homeserver configuration
        hs = config.get("homeserver", {})
        if "address" not in hs:
            return ValidationResult(
                name=f"Config validation: {filepath.name}",
                status=ValidationStatus.FAIL,
                message="Missing homeserver address",
                duration_ms=(time.time() - start) * 1000
            )
        
        # Check for security settings
        security = config.get("security", {})
        encryption = security.get("encryption", {})
        if not encryption.get("enabled", False):
            return ValidationResult(
                name=f"Config validation: {filepath.name}",
                status=ValidationStatus.WARN,
                message="Encryption not enabled",
                duration_ms=(time.time() - start) * 1000
            )
        
        # Check for performance settings
        performance = config.get("performance", {})
        if "cache" not in performance:
            return ValidationResult(
                name=f"Config validation: {filepath.name}",
                status=ValidationStatus.WARN,
                message="Performance cache not configured",
                duration_ms=(time.time() - start) * 1000
            )
        
        return ValidationResult(
            name=f"Config validation: {filepath.name}",
            status=ValidationStatus.PASS,
            message="Configuration is valid",
            duration_ms=(time.time() - start) * 1000,
            details={
                "sections": list(config.keys()),
                "security_enabled": encryption.get("enabled", False)
            }
        )
    
    def validate_registration_files(self) -> bool:
        """Validate registration files."""
        print("\n📋 Registration Files Validation")
        print("-" * 40)
        
        all_passed = True
        
        reg_files = list(self.bridges_dir.glob("*_registration.yaml"))
        
        for reg_file in reg_files:
            result = self._validate_registration_file(reg_file)
            if result.status == ValidationStatus.FAIL:
                all_passed = False
            self.log_result(result)
        
        return all_passed
    
    def _validate_registration_file(self, filepath: Path) -> ValidationResult:
        """Validate a registration file."""
        start = time.time()
        
        try:
            with open(filepath) as f:
                reg = yaml.safe_load(f)
        
        except Exception as e:
            return ValidationResult(
                name=f"Registration validation: {filepath.name}",
                status=ValidationStatus.FAIL,
                message=f"Parse error: {e}",
                duration_ms=(time.time() - start) * 1000
            )
        
        # Check required fields
        required_fields = ["id", "url", "as_token", "hs_token", "namespaces"]
        missing_fields = []
        
        for field in required_fields:
            if field not in reg:
                missing_fields.append(field)
        
        if missing_fields:
            return ValidationResult(
                name=f"Registration validation: {filepath.name}",
                status=ValidationStatus.FAIL,
                message=f"Missing fields: {', '.join(missing_fields)}",
                duration_ms=(time.time() - start) * 1000
            )
        
        # Check for placeholder tokens
        if reg.get("as_token") == "__CHANGE_ME__":
            return ValidationResult(
                name=f"Registration validation: {filepath.name}",
                status=ValidationStatus.WARN,
                message="AS token not configured (using placeholder)",
                duration_ms=(time.time() - start) * 1000
            )
        
        return ValidationResult(
            name=f"Registration validation: {filepath.name}",
            status=ValidationStatus.PASS,
            message="Registration file is valid",
            duration_ms=(time.time() - start) * 1000
        )
    
    def validate_docker_compose(self) -> bool:
        """Validate docker-compose.yml."""
        print("\n🐳 Docker Compose Validation")
        print("-" * 40)
        
        all_passed = True
        
        compose_file = self.bridges_dir / "docker-compose.yml"
        
        try:
            with open(compose_file) as f:
                compose = yaml.safe_load(f)
        except Exception as e:
            self.log_result(ValidationResult(
                name="Docker Compose validation",
                status=ValidationStatus.FAIL,
                message=f"Parse error: {e}"
            ))
            return False
        
        # Check version
        version = compose.get("version", "unknown")
        if version >= "3.9":
            self.log_result(ValidationResult(
                name="Docker Compose version",
                status=ValidationStatus.PASS,
                message=f"Using version {version}"
            ))
        else:
            self.log_result(ValidationResult(
                name="Docker Compose version",
                status=ValidationStatus.WARN,
                message=f"Version {version} is older than 3.9"
            ))
        
        # Check services
        services = compose.get("services", {})
        
        required_services = ["synapse", "traefik"]
        for service in required_services:
            if service in services:
                self.log_result(ValidationResult(
                    name=f"Service: {service}",
                    status=ValidationStatus.PASS,
                    message=f"Service {service} is configured"
                ))
            else:
                all_passed = False
                self.log_result(ValidationResult(
                    name=f"Service: {service}",
                    status=ValidationStatus.FAIL,
                    message=f"Required service {service} not found"
                ))
        
        # Check bridge services
        bridge_services = [s for s in services.keys() if s.startswith("bridge_")]
        self.log_result(ValidationResult(
            name="Bridge services count",
            status=ValidationStatus.PASS,
            message=f"Found {len(bridge_services)} bridge services"
        ))
        
        # Check for health checks
        services_with_healthcheck = []
        for name, service in services.items():
            if "healthcheck" in service:
                services_with_healthcheck.append(name)
        
        if len(services_with_healthcheck) == len(services):
            self.log_result(ValidationResult(
                name="Health checks",
                status=ValidationStatus.PASS,
                message="All services have health checks"
            ))
        else:
            self.log_result(ValidationResult(
                name="Health checks",
                status=ValidationStatus.WARN,
                message=f"Only {len(services_with_healthcheck)}/{len(services)} services have health checks"
            ))
        
        # Check for resource limits
        services_with_limits = []
        for name, service in services.items():
            if "deploy" in service:
                if "resources" in service["deploy"]:
                    services_with_limits.append(name)
        
        self.log_result(ValidationResult(
            name="Resource limits",
            status=ValidationStatus.PASS if len(services_with_limits) > 0 else ValidationStatus.WARN,
            message=f"{len(services_with_limits)} services have resource limits configured"
        ))
        
        return all_passed
    
    def validate_security_config(self) -> bool:
        """Validate security configuration."""
        print("\n🔒 Security Configuration Validation")
        print("-" * 40)
        
        all_passed = True
        
        security_file = self.bridges_dir / "security_config.yaml"
        
        if not security_file.exists():
            self.log_result(ValidationResult(
                name="Security configuration",
                status=ValidationStatus.WARN,
                message="security_config.yaml not found"
            ))
            return True
        
        try:
            with open(security_file) as f:
                security = yaml.safe_load(f)
        except Exception as e:
            self.log_result(ValidationResult(
                name="Security configuration",
                status=ValidationStatus.FAIL,
                message=f"Parse error: {e}"
            ))
            return False
        
        # Check TLS configuration
        tls = security.get("tls", {})
        if tls.get("enabled"):
            self.log_result(ValidationResult(
                name="TLS configuration",
                status=ValidationStatus.PASS,
                message="TLS is enabled"
            ))
        else:
            self.log_result(ValidationResult(
                name="TLS configuration",
                status=ValidationStatus.WARN,
                message="TLS is not enabled"
            ))
        
        # Check rate limiting
        rate_limiting = security.get("rate_limiting", {})
        if rate_limiting.get("enabled"):
            self.log_result(ValidationResult(
                name="Rate limiting",
                status=ValidationStatus.PASS,
                message="Rate limiting is enabled"
            ))
        else:
            self.log_result(ValidationResult(
                name="Rate limiting",
                status=ValidationStatus.WARN,
                message="Rate limiting is not enabled"
            ))
        
        # Check DDoS protection
        ddos = security.get("ddos_protection", {})
        if ddos.get("enabled"):
            self.log_result(ValidationResult(
                name="DDoS protection",
                status=ValidationStatus.PASS,
                message="DDoS protection is enabled"
            ))
        else:
            self.log_result(ValidationResult(
                name="DDoS protection",
                status=ValidationStatus.WARN,
                message="DDoS protection is not enabled"
            ))
        
        # Check audit logging
        audit = security.get("audit_logging", {})
        if audit.get("enabled"):
            self.log_result(ValidationResult(
                name="Audit logging",
                status=ValidationStatus.PASS,
                message="Audit logging is enabled"
            ))
        else:
            self.log_result(ValidationResult(
                name="Audit logging",
                status=ValidationStatus.WARN,
                message="Audit logging is not enabled"
            ))
        
        return all_passed
    
    def validate_monitoring_config(self) -> bool:
        """Validate monitoring configuration."""
        print("\n📊 Monitoring Configuration Validation")
        print("-" * 40)
        
        all_passed = True
        
        # Check Grafana dashboard
        dashboard_file = (self.bridges_dir / "telegram_super_tma" / 
                         "grafana_dashboard.json")
        if dashboard_file.exists():
            try:
                with open(dashboard_file) as f:
                    dashboard = json.load(f)
                
                panels = dashboard.get("panels", [])
                self.log_result(ValidationResult(
                    name="Grafana dashboard",
                    status=ValidationStatus.PASS,
                    message=f"Found dashboard with {len(panels)} panels"
                ))
            except Exception as e:
                self.log_result(ValidationResult(
                    name="Grafana dashboard",
                    status=ValidationStatus.FAIL,
                    message=f"Parse error: {e}"
                ))
                all_passed = False
        else:
            self.log_result(ValidationResult(
                name="Grafana dashboard",
                status=ValidationStatus.WARN,
                message="Dashboard file not found"
            ))
        
        # Check Prometheus metrics
        metrics_file = (self.bridges_dir / "telegram_super_tma" / 
                       "prometheus_metrics.py")
        if metrics_file.exists():
            self.log_result(ValidationResult(
                name="Prometheus metrics",
                status=ValidationStatus.PASS,
                message="Prometheus metrics exporter found"
            ))
        else:
            self.log_result(ValidationResult(
                name="Prometheus metrics",
                status=ValidationStatus.WARN,
                message="Metrics exporter not found"
            ))
        
        # Check alert rules
        alert_file = (self.bridges_dir / "telegram_super_tma" / 
                     "alert_rules.yml")
        if alert_file.exists():
            try:
                with open(alert_file) as f:
                    alerts = yaml.safe_load(f)
                
                groups = alerts.get("groups", [])
                rule_count = sum(len(g.get("rules", [])) for g in groups)
                self.log_result(ValidationResult(
                    name="Alert rules",
                    status=ValidationStatus.PASS,
                    message=f"Found {rule_count} alert rules in {len(groups)} groups"
                ))
            except Exception as e:
                self.log_result(ValidationResult(
                    name="Alert rules",
                    status=ValidationStatus.FAIL,
                    message=f"Parse error: {e}"
                ))
                all_passed = False
        else:
            self.log_result(ValidationResult(
                name="Alert rules",
                status=ValidationStatus.WARN,
                message="Alert rules file not found"
            ))
        
        return all_passed
    
    def validate_documentation(self) -> bool:
        """Validate documentation."""
        print("\n📚 Documentation Validation")
        print("-" * 40)
        
        all_passed = True
        
        readme_file = self.bridges_dir / "README_Bridges.md"
        
        if not readme_file.exists():
            self.log_result(ValidationResult(
                name="README documentation",
                status=ValidationStatus.FAIL,
                message="README file not found"
            ))
            return False
        
        try:
            with open(readme_file) as f:
                content = f.read()
            
            # Check for required sections
            required_sections = [
                "Introduction",
                "Supported Bridges",
                "Features",
                "Configuration",
                "Installation",
                "Support"
            ]
            
            missing_sections = []
            for section in required_sections:
                if section.lower() not in content.lower():
                    missing_sections.append(section)
            
            if missing_sections:
                self.log_result(ValidationResult(
                    name="README sections",
                    status=ValidationStatus.FAIL,
                    message=f"Missing sections: {', '.join(missing_sections)}"
                ))
                all_passed = False
            else:
                self.log_result(ValidationResult(
                    name="README sections",
                    status=ValidationStatus.PASS,
                    message="All required sections present"
                ))
            
            # Check version
            if "4.2.0" in content:
                self.log_result(ValidationResult(
                    name="Version documentation",
                    status=ValidationStatus.PASS,
                    message="v4.2.0 features documented"
                ))
            else:
                self.log_result(ValidationResult(
                    name="Version documentation",
                    status=ValidationStatus.WARN,
                    message="v4.2.0 not mentioned"
                ))
            
        except Exception as e:
            self.log_result(ValidationResult(
                name="README documentation",
                status=ValidationStatus.FAIL,
                message=f"Read error: {e}"
            ))
            all_passed = False
        
        return all_passed
    
    def print_summary(self):
        """Print validation summary."""
        print("\n" + "=" * 60)
        print("VALIDATION SUMMARY")
        print("=" * 60)
        
        total = len(self.results)
        passed = sum(1 for r in self.results if r.status == ValidationStatus.PASS)
        failed = sum(1 for r in self.results if r.status == ValidationStatus.FAIL)
        warned = sum(1 for r in self.results if r.status == ValidationStatus.WARN)
        skipped = sum(1 for r in self.results if r.status == ValidationStatus.SKIP)
        
        print(f"Total checks: {total}")
        print(f"✅ Passed: {passed}")
        print(f"❌ Failed: {failed}")
        print(f"⚠️  Warnings: {warned}")
        print(f"⏭️  Skipped: {skipped}")
        print(f"Duration: {time.time() - self.start_time:.2f}s")
        print()
        
        if failed == 0:
            print("🎉 All critical validations passed!")
        else:
            print(f"⚠️  {failed} critical validation(s) failed!")
        
        print("=" * 60)


def main():
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description="Validate REChain bridge configurations"
    )
    parser.add_argument(
        "--dir",
        default="bridges",
        help="Path to bridges directory"
    )
    parser.add_argument(
        "--json",
        action="store_true",
        help="Output results as JSON"
    )
    parser.add_argument(
        "--quick",
        action="store_true",
        help="Run quick validation only"
    )
    
    args = parser.parse_args()
    
    validator = BridgeValidator(args.dir)
    
    if args.json:
        # Run validation and output JSON
        validator.validate_all()
        results = [
            {
                "name": r.name,
                "status": r.status.value,
                "message": r.message,
                "details": r.details,
                "duration_ms": r.duration_ms
            }
            for r in validator.results
        ]
        print(json.dumps(results, indent=2))
    else:
        # Run validation and show results
        success = validator.validate_all()
        sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()

