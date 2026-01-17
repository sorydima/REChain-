# REChain Performance Benchmarks

## 📊 Comprehensive Performance Testing Suite

**Version:** 4.1.10+1160  
**Last Updated:** 2025-12-06  
**Status:** ✅ Active Development

---

## 📋 Table of Contents

1. [Overview](#overview)
2. [Benchmark Categories](#benchmark-categories)
3. [Quick Start](#quick-start)
4. [Running Benchmarks](#running-benchmarks)
5. [Benchmark Scripts](#benchmark-scripts)
6. [Results Analysis](#results-analysis)
7. [Performance Targets](#performance-targets)
8. [Continuous Integration](#continuous-integration)
9. [Reporting](#reporting)

---

## 1. Overview

This directory contains comprehensive performance benchmarking scripts and results
for the REChain project. Benchmarks help ensure optimal performance across all
critical components.

### Purpose

- **Measure** performance of critical components
- **Track** performance over time
- **Identify** regression issues
- **Optimize** resource usage
- **Validate** performance targets

### Benchmark Philosophy

1. **Automated**: Run automatically in CI/CD
2. **Reproducible**: Consistent results across runs
3. **Comprehensive**: Cover all critical paths
4. **Actionable**: Clear pass/fail criteria

---

## 2. Benchmark Categories

### 📱 Application Benchmarks

| Benchmark | Description | Target |
|-----------|-------------|--------|
| Startup Time | Time to interactive | < 3s |
| Memory Usage | Baseline memory footprint | < 150MB |
| UI Responsiveness | 60fps rendering | > 55fps |
| Battery Drain | Per-hour usage | < 5% |
| Cold Start | App launch time | < 5s |

### 💬 Matrix Protocol Benchmarks

| Benchmark | Description | Target |
|-----------|-------------|--------|
| Sync Latency | Initial sync time | < 2s |
| Message Send | End-to-end send time | < 500ms |
| Room Join | Join room time | < 1s |
| Typing Indicator | Typing notification | < 100ms |
| Read Receipt | Read receipt delivery | < 200ms |
| Key Exchange | E2EE key negotiation | < 1s |

### ⛓️ Blockchain Benchmarks

| Benchmark | Description | Target |
|-----------|-------------|--------|
| Wallet Connect | Connection time | < 2s |
| Balance Fetch | Get balance latency | < 500ms |
| Transaction Sign | Sign transaction | < 1s |
| Transaction Send | Broadcast transaction | < 5s |
| Gas Estimation | Estimate gas limit | < 200ms |
| Token Transfer | ERC20 transfer | < 10s |

### 📦 IPFS Benchmarks

| Benchmark | Description | Target |
|-----------|-------------|--------|
| Upload Small | < 1MB file upload | < 3s |
| Upload Large | > 100MB file upload | < 30s |
| Download Small | < 1MB file download | < 2s |
| Download Large | > 100MB file download | < 25s |
| Pin Operation | Pin content | < 1s |
| DHT Lookup | Find provider | < 2s |

### 🧠 AI Services Benchmarks

| Benchmark | Description | Target |
|-----------|-------------|--------|
| Text Moderation | Content analysis | < 200ms |
| Translation | Language translation | < 500ms |
| Sentiment Analysis | Emotion detection | < 300ms |
| Summarization | Text summarization | < 1s |
| Tokenization | Word segmentation | < 50ms |

### 🔒 Security Benchmarks

| Benchmark | Description | Target |
|-----------|-------------|--------|
| Encryption (Message) | E2EE message | < 50ms |
| Encryption (File) | File encryption | < 100ms |
| Key Generation | New key pair | < 500ms |
| Signature Verification | Verify signature | < 100ms |
| Backup Encryption | Encrypted backup | < 2s |

---

## 3. Quick Start

### Prerequisites

```bash
# Flutter for app benchmarks
flutter --version

# Python 3.8+ for scripts
python3 --version

# Additional tools
pip install matplotlib pandas numpy
```

### Run All Benchmarks

```bash
cd benchmarks

# Run all benchmark suites
python3 run_benchmarks.py --all

# Run specific category
python3 run_benchmarks.py --matrix
python3 run_benchmarks.py --blockchain
python3 run_benchmarks.py --ipfs
python3 run_benchmarks.py --ai
```

### Generate Report

```bash
python3 generate_report.py --input results/ --output report.html
```

---

## 4. Running Benchmarks

### Individual Benchmarks

#### Application Benchmarks

```bash
# Startup time benchmark
./scripts/benchmark_startup.sh

# Memory usage benchmark
./scripts/benchmark_memory.sh --duration 60

# UI performance benchmark
./scripts/benchmark_ui.sh --iterations 100

# Battery drain benchmark
./scripts/benchmark_battery.sh --duration 3600
```

#### Matrix Protocol Benchmarks

```bash
# Sync performance
python3 matrix/benchmark_sync.py \
    --homeserver https://matrix.marinchik.ink \
    --duration 300

# Message throughput
python3 matrix/benchmark_messages.py \
    --room !room:server \
    --count 100

# E2EE performance
python3 matrix/benchmark_encryption.py \
    --iterations 50
```

#### Blockchain Benchmarks

```bash
# Wallet connection
python3 blockchain/benchmark_wallet.py \
    --network ton \
    --operations 10

# Transaction benchmarks
python3 blockchain/benchmark_transactions.py \
    --network ethereum \
    --iterations 20
```

#### IPFS Benchmarks

```bash
# Upload performance
python3 ipfs/benchmark_upload.py \
    --file-size 104857600 \
    --iterations 5

# Download performance
python3 ipfs/benchmark_download.py \
    --cid Qm... \
    --iterations 5
```

#### AI Services Benchmarks

```bash
# AI response times
python3 ai/benchmark_services.py \
    --requests 100 \
    --concurrency 10
```

---

## 5. Benchmark Scripts

### Directory Structure

```
benchmarks/
├── README.md                           ✅ This file
├── run_benchmarks.py                   ✅ Main runner script
├── generate_report.py                  ✅ Report generator
├── requirements.txt                    ✅ Python dependencies
│
├── scripts/                            ✅ Shell scripts
│   ├── benchmark_startup.sh            ✅ App startup
│   ├── benchmark_memory.sh             ✅ Memory usage
│   ├── benchmark_ui.sh                 ✅ UI performance
│   └── benchmark_battery.sh            ✅ Battery drain
│
├── matrix/                             ✅ Matrix benchmarks
│   ├── benchmark_sync.py               ✅ Sync performance
│   ├── benchmark_messages.py           ✅ Message throughput
│   ├── benchmark_encryption.py         ✅ E2EE performance
│   ├── __init__.py
│   └── config.py
│
├── blockchain/                         ✅ Blockchain benchmarks
│   ├── benchmark_wallet.py             ✅ Wallet operations
│   ├── benchmark_transactions.py       ✅ Transaction processing
│   ├── __init__.py
│   └── config.py
│
├── ipfs/                               ✅ IPFS benchmarks
│   ├── benchmark_upload.py             ✅ Upload performance
│   ├── benchmark_download.py           ✅ Download performance
│   ├── __init__.py
│   └── config.py
│
├── ai/                                 ✅ AI services benchmarks
│   ├── benchmark_services.py           ✅ Service response times
│   ├── __init__.py
│   └── config.py
│
├── results/                            ✅ Results storage
│   └── .gitkeep
│
└── reports/                            ✅ Generated reports
    └── .gitkeep
```

### Main Runner Script

```python
#!/usr/bin/env python3
"""
REChain Benchmark Runner
Version: 4.1.10+1160
"""

import argparse
import sys
import time
from pathlib import Path

class BenchmarkRunner:
    def __init__(self):
        self.results_dir = Path(__file__).parent / "results"
        self.results_dir.mkdir(exist_ok=True)
    
    def run_all(self):
        """Run all benchmark suites"""
        suites = [
            ("Application", self.run_application),
            ("Matrix", self.run_matrix),
            ("Blockchain", self.run_blockchain),
            ("IPFS", self.run_ipfs),
            ("AI", self.run_ai),
        ]
        
        for name, suite_func in suites:
            print(f"\n{'='*60}")
            print(f"Running {name} Benchmarks")
            print(f"{'='*60}")
            start = time.time()
            suite_func()
            elapsed = time.time() - start
            print(f"\n{name} benchmarks completed in {elapsed:.2f}s")
    
    def run_application(self):
        """Run application benchmarks"""
        from scripts.benchmark_startup import BenchmarkStartup
        from scripts.benchmark_memory import BenchmarkMemory
        
        BenchmarkStartup().run()
        BenchmarkMemory().run()
    
    def run_matrix(self):
        """Run Matrix protocol benchmarks"""
        from matrix.benchmark_sync import SyncBenchmark
        from matrix.benchmark_messages import MessageBenchmark
        
        SyncBenchmark().run()
        MessageBenchmark().run()
    
    def run_blockchain(self):
        """Run blockchain benchmarks"""
        from blockchain.benchmark_wallet import WalletBenchmark
        from blockchain.benchmark_transactions import TransactionBenchmark
        
        WalletBenchmark().run()
        TransactionBenchmark().run()
    
    def run_ipfs(self):
        """Run IPFS benchmarks"""
        from ipfs.benchmark_upload import UploadBenchmark
        from ipfs.benchmark_download import DownloadBenchmark
        
        UploadBenchmark().run()
        DownloadBenchmark().run()
    
    def run_ai(self):
        """Run AI services benchmarks"""
        from ai.benchmark_services import AIBenchmark
        
        AIBenchmark().run()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="REChain Benchmark Runner")
    parser.add_argument("--all", action="store_true", help="Run all benchmarks")
    parser.add_argument("--application", action="store_true", help="Run application benchmarks")
    parser.add_argument("--matrix", action="store_true", help="Run Matrix benchmarks")
    parser.add_argument("--blockchain", action="store_true", help="Run blockchain benchmarks")
    parser.add_argument("--ipfs", action="store_true", help="Run IPFS benchmarks")
    parser.add_argument("--ai", action="store_true", help="Run AI benchmarks")
    
    args = parser.parse_args()
    
    runner = BenchmarkRunner()
    
    if args.all or not any([args.application, args.matrix, 
                           args.blockchain, args.ipfs, args.ai]):
        runner.run_all()
    else:
        if args.application:
            runner.run_application()
        if args.matrix:
            runner.run_matrix()
        if args.blockchain:
            runner.run_blockchain()
        if args.ipfs:
            runner.run_ipfs()
        if args.ai:
            runner.run_ai()
```

---

## 6. Results Analysis

### Result Files

Benchmarks generate JSON result files:

```json
{
  "benchmark": "matrix_sync",
  "timestamp": "2025-12-06T10:30:00Z",
  "duration": 300,
  "iterations": 10,
  "results": {
    "mean": 1.234,
    "median": 1.200,
    "std_dev": 0.123,
    "min": 1.050,
    "max": 1.567,
    "p95": 1.456,
    "p99": 1.534
  },
  "target": {
    "max": 2.0,
    "unit": "seconds"
  },
  "status": "PASS"
}
```

### Analysis Commands

```bash
# Generate statistics
python3 analyze_results.py --input results/ --output analysis/

# Compare with baseline
python3 compare_results.py --baseline baseline/ --current results/

# Generate visualization
python3 visualize_results.py --input results/ --format png
```

---

## 7. Performance Targets

### Target Matrix

| Category | Metric | Target | Warning | Critical |
|----------|--------|--------|---------|----------|
| App | Startup Time | < 3s | < 4s | < 5s |
| App | Memory Usage | < 150MB | < 200MB | < 250MB |
| App | UI FPS | > 55 | > 50 | > 45 |
| Matrix | Sync Latency | < 2s | < 3s | < 5s |
| Matrix | Message Send | < 500ms | < 750ms | < 1s |
| Blockchain | Transaction | < 5s | < 10s | < 20s |
| IPFS | Upload 10MB | < 5s | < 8s | < 15s |
| AI | Moderation | < 200ms | < 300ms | < 500ms |

### Pass Criteria

- **PASS**: All metrics within target
- **WARN**: Some metrics in warning zone
- **FAIL**: Any metric in critical zone

---

## 8. Continuous Integration

### GitHub Actions Workflow

```yaml
name: Performance Benchmarks

on:
  schedule:
    - cron: '0 0 * * 0'  # Weekly on Sunday
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  benchmark:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.10'
      
      - name: Install dependencies
        run: |
          pip install -r benchmarks/requirements.txt
      
      - name: Run benchmarks
        run: |
          cd benchmarks
          python3 run_benchmarks.py --all
      
      - name: Upload results
        uses: actions/upload-artifact@v4
        with:
          name: benchmark-results
          path: benchmarks/results/
      
      - name: Comment on PR
        if: github.event_name == 'pull_request'
        run: |
          python3 .github/scripts/benchmark_comment.py
```

---

## 9. Reporting

### Generate HTML Report

```bash
python3 generate_report.py \
    --input results/ \
    --output reports/benchmark_report.html \
    --format html
```

### Report Contents

1. **Executive Summary**
   - Overall status (PASS/WARN/FAIL)
   - Key metrics comparison
   - Trend analysis

2. **Detailed Results**
   - Per-category breakdown
   - Statistical analysis
   - Performance graphs

3. **Recommendations**
   - Optimization suggestions
   - Regression alerts
   - Capacity planning

---

## 📁 Files Reference

| File | Description |
|------|-------------|
| `run_benchmarks.py` | Main benchmark runner |
| `generate_report.py` | Report generator |
| `requirements.txt` | Python dependencies |
| `scripts/*.sh` | Shell benchmark scripts |
| `matrix/*.py` | Matrix protocol benchmarks |
| `blockchain/*.py` | Blockchain benchmarks |
| `ipfs/*.py` | IPFS benchmarks |
| `ai/*.py` | AI services benchmarks |

---

## 📞 Support

- **Issues:** https://github.com/sorydima/REChain-/issues
- **Matrix Community:** #chatting:matrix.katya.wtf
- **Email:** support@rechain.network

---

## 📝 Version History

| Version | Date | Changes |
|---------|------|---------|
| 4.1.10+1160 | 2025-12-06 | Complete benchmark suite |
| 4.1.10+1152 | 2025-07-08 | Initial benchmark framework |
| 4.1.9+1147 | 2025-06-01 | Pre-release benchmarks |

---

**REChain: Building the Digital Infrastructure of Autonomous Organizations** 🚀

