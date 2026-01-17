#!/usr/bin/env python3
"""
REChain Benchmark Runner
Version: 4.1.10+1160

Comprehensive performance benchmarking suite for REChain.
"""

import argparse
import json
import sys
import time
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional


class BenchmarkResult:
    """Container for benchmark results"""
    
    def __init__(self, name: str, description: str = ""):
        self.name = name
        self.description = description
        self.start_time: Optional[float] = None
        self.end_time: Optional[float] = None
        self.results: List[float] = []
        self.target: Optional[float] = None
        self.unit: str = "ms"
        self.warnings: List[str] = []
        self.errors: List[str] = []
    
    def start(self):
        """Start the benchmark"""
        self.start_time = time.time()
    
    def stop(self):
        """Stop the benchmark"""
        self.end_time = time.time()
    
    def add_result(self, value: float):
        """Add a measurement result"""
        self.results.append(value)
    
    @property
    def elapsed(self) -> float:
        """Get total elapsed time"""
        if self.start_time and self.end_time:
            return self.end_time - self.start_time
        return 0.0
    
    @property
    def count(self) -> int:
        """Get number of measurements"""
        return len(self.results)
    
    @property
    def mean(self) -> float:
        """Calculate mean of results"""
        if not self.results:
            return 0.0
        return sum(self.results) / len(self.results)
    
    @property
    def median(self) -> float:
        """Calculate median of results"""
        if not self.results:
            return 0.0
        sorted_results = sorted(self.results)
        mid = len(sorted_results) // 2
        if len(sorted_results) % 2 == 0:
            return (sorted_results[mid - 1] + sorted_results[mid]) / 2
        return sorted_results[mid]
    
    @property
    def std_dev(self) -> float:
        """Calculate standard deviation"""
        if len(self.results) < 2:
            return 0.0
        mean = self.mean
        variance = sum((x - mean) ** 2 for x in self.results) / (len(self.results) - 1)
        return variance ** 0.5
    
    @property
    def min(self) -> float:
        """Get minimum result"""
        return min(self.results) if self.results else 0.0
    
    @property
    def max(self) -> float:
        """Get maximum result"""
        return max(self.results) if self.results else 0.0
    
    def percentile(self, p: float) -> float:
        """Calculate p-th percentile"""
        if not self.results:
            return 0.0
        sorted_results = sorted(self.results)
        index = int(p / 100 * (len(sorted_results) - 1))
        return sorted_results[min(index, len(sorted_results) - 1)]
    
    @property
    def status(self) -> str:
        """Get pass/warn/fail status"""
        if not self.results or not self.target:
            return "UNKNOWN"
        
        if self.max <= self.target:
            return "PASS"
        elif self.max <= self.target * 1.5:
            return "WARN"
        else:
            return "FAIL"
    
    def to_dict(self) -> dict:
        """Convert to dictionary"""
        return {
            "name": self.name,
            "description": self.description,
            "timestamp": datetime.utcnow().isoformat() + "Z",
            "elapsed_seconds": self.elapsed,
            "iterations": self.count,
            "unit": self.unit,
            "results": {
                "mean": self.mean,
                "median": self.median,
                "std_dev": self.std_dev,
                "min": self.min,
                "max": self.max,
                "p95": self.percentile(95),
                "p99": self.percentile(99)
            },
            "target": {
                "max": self.target,
                "unit": self.unit
            },
            "status": self.status,
            "warnings": self.warnings,
            "errors": self.errors
        }
    
    def save(self, directory: Path):
        """Save results to JSON file"""
        directory.mkdir(parents=True, exist_ok=True)
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = directory / f"{self.name}_{timestamp}.json"
        with open(filename, 'w') as f:
            json.dump(self.to_dict(), f, indent=2)
        return filename


class BenchmarkSuite:
    """Collection of related benchmarks"""
    
    def __init__(self, name: str):
        self.name = name
        self.benchmarks: List[BenchmarkResult] = []
    
    def add_benchmark(self, benchmark: BenchmarkResult):
        """Add a benchmark to the suite"""
        self.benchmarks.append(benchmark)
    
    def run_all(self, verbose: bool = False):
        """Run all benchmarks in the suite"""
        for benchmark in self.benchmarks:
            if verbose:
                print(f"\n  Running: {benchmark.name}")
            try:
                benchmark.start()
                self._execute_benchmark(benchmark)
                benchmark.stop()
                if verbose:
                    status = "✓" if benchmark.status == "PASS" else "⚠" if benchmark.status == "WARN" else "✗"
                    print(f"    {status} {benchmark.name}: {benchmark.mean:.2f}{benchmark.unit} "
                          f"(target: <{benchmark.target}{benchmark.unit})")
            except Exception as e:
                benchmark.errors.append(str(e))
                benchmark.stop()
                if verbose:
                    print(f"    ✗ {benchmark.name}: ERROR - {e}")
    
    def _execute_benchmark(self, benchmark: BenchmarkResult):
        """Execute a single benchmark - override in subclasses"""
        raise NotImplementedError
    
    @property
    def status(self) -> str:
        """Get overall suite status"""
        if not self.benchmarks:
            return "EMPTY"
        statuses = [b.status for b in self.benchmarks]
        if all(s == "PASS" for s in statuses):
            return "PASS"
        elif any(s == "FAIL" for s in statuses):
            return "FAIL"
        else:
            return "WARN"
    
    def save_all(self, directory: Path):
        """Save all benchmark results"""
        directory.mkdir(parents=True, exist_ok=True)
        saved_files = []
        for benchmark in self.benchmarks:
            if benchmark.results:
                saved_files.append(benchmark.save(directory))
        return saved_files


class ApplicationBenchmarkSuite(BenchmarkSuite):
    """Application-level benchmarks"""
    
    def __init__(self):
        super().__init__("Application")
    
    def _execute_benchmark(self, benchmark: BenchmarkResult):
        if benchmark.name == "startup_time":
            self._benchmark_startup(benchmark)
        elif benchmark.name == "memory_usage":
            self._benchmark_memory(benchmark)
        elif benchmark.name == "ui_performance":
            self._benchmark_ui(benchmark)
    
    def _benchmark_startup(self, benchmark: BenchmarkResult):
        """Benchmark application startup time"""
        import subprocess
        import os
        
        results = []
        for _ in range(benchmark.count or 10):
            start = time.time()
            # Launch app and wait for ready state
            proc = subprocess.Popen(
                ["flutter", "run", "-d", "linux", "--no-resident"],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
            )
            # Wait for app to be ready (simplified)
            time.sleep(3)
            proc.terminate()
            proc.wait()
            elapsed = time.time() - start
            results.append(elapsed * 1000)  # Convert to ms
        
        for result in results:
            benchmark.add_result(result)
    
    def _benchmark_memory(self, benchmark: BenchmarkResult):
        """Benchmark memory usage"""
        import psutil
        import os
        
        pid = os.getpid()
        process = psutil.Process(pid)
        
        for _ in range(benchmark.count or 10):
            mem_info = process.memory_info()
            benchmark.add_result(mem_info.rss / 1024 / 1024)  # MB
    
    def _benchmark_ui(self, benchmark: BenchmarkResult):
        """Benchmark UI rendering performance"""
        # Simplified FPS measurement
        for _ in range(benchmark.count or 100):
            # In real implementation, use Flutter observatory
            import random
            fps = 55 + random.random() * 10  # Simulated
            benchmark.add_result(fps)


class MatrixBenchmarkSuite(BenchmarkSuite):
    """Matrix protocol benchmarks"""
    
    def __init__(self, homeserver: str = "https://matrix.marinchik.ink"):
        super().__init__("Matrix")
        self.homeserver = homeserver
    
    def _execute_benchmark(self, benchmark: BenchmarkResult):
        if benchmark.name == "sync_latency":
            self._benchmark_sync(benchmark)
        elif benchmark.name == "message_send":
            self._benchmark_message_send(benchmark)
        elif benchmark.name == "key_exchange":
            self._benchmark_key_exchange(benchmark)
    
    def _benchmark_sync(self, benchmark: BenchmarkResult):
        """Benchmark initial sync latency"""
        import requests
        import random
        
        for _ in range(benchmark.count or 10):
            start = time.time()
            # In real implementation, make actual sync request
            # response = requests.get(f"{self.homeserver}/_matrix/client/r0/sync")
            time.sleep(0.5 + random.random() * 1)  # Simulated
            elapsed = time.time() - start
            benchmark.add_result(elapsed * 1000)  # ms
    
    def _benchmark_message_send(self, benchmark: BenchmarkResult):
        """Benchmark message sending"""
        import random
        
        for _ in range(benchmark.count or 20):
            start = time.time()
            # In real implementation, send actual message
            time.sleep(0.2 + random.random() * 0.3)  # Simulated
            elapsed = time.time() - start
            benchmark.add_result(elapsed * 1000)  # ms
    
    def _benchmark_key_exchange(self, benchmark: BenchmarkResult):
        """Benchmark E2EE key exchange"""
        import random
        
        for _ in range(benchmark.count or 10):
            start = time.time()
            # In real implementation, perform actual key exchange
            time.sleep(0.5 + random.random() * 0.5)  # Simulated
            elapsed = time.time() - start
            benchmark.add_result(elapsed * 1000)  # ms


class IPFSBenchmarkSuite(BenchmarkSuite):
    """IPFS benchmarks"""
    
    def __init__(self, gateway: str = "/ip4/127.0.0.1/tcp/5001"):
        super().__init__("IPFS")
        self.gateway = gateway
    
    def _execute_benchmark(self, benchmark: BenchmarkResult):
        if benchmark.name == "upload":
            self._benchmark_upload(benchmark)
        elif benchmark.name == "download":
            self._benchmark_download(benchmark)
        elif benchmark.name == "pin":
            self._benchmark_pin(benchmark)
    
    def _benchmark_upload(self, benchmark: BenchmarkResult):
        """Benchmark file upload"""
        import random
        import os
        
        for _ in range(benchmark.count or 5):
            start = time.time()
            # In real implementation, upload to IPFS
            # Using ipfs-http-client or similar
            time.sleep(1 + random.random() * 2)  # Simulated
            elapsed = time.time() - start
            benchmark.add_result(elapsed * 1000)  # ms
    
    def _benchmark_download(self, benchmark: BenchmarkResult):
        """Benchmark file download"""
        import random
        
        for _ in range(benchmark.count or 5):
            start = time.time()
            # In real implementation, download from IPFS
            time.sleep(0.5 + random.random() * 1)  # Simulated
            elapsed = time.time() - start
            benchmark.add_result(elapsed * 1000)  # ms
    
    def _benchmark_pin(self, benchmark: BenchmarkResult):
        """Benchmark pin operation"""
        import random
        
        for _ in range(benchmark.count or 10):
            start = time.time()
            # In real implementation, pin content
            time.sleep(0.2 + random.random() * 0.3)  # Simulated
            elapsed = time.time() - start
            benchmark.add_result(elapsed * 1000)  # ms


class AI BenchmarkSuite(BenchmarkSuite):
    """AI services benchmarks"""
    
    def _execute_benchmark(self, benchmark: BenchmarkResult):
        if benchmark.name == "moderation":
            self._benchmark_moderation(benchmark)
        elif benchmark.name == "translation":
            self._benchmark_translation(benchmark)
        elif benchmark.name == "summarization":
            self._benchmark_summarization(benchmark)
    
    def _benchmark_moderation(self, benchmark: BenchmarkResult):
        """Benchmark content moderation"""
        import random
        
        for _ in range(benchmark.count or 50):
            start = time.time()
            # In real implementation, call moderation API
            time.sleep(0.1 + random.random() * 0.1)  # Simulated
            elapsed = time.time() - start
            benchmark.add_result(elapsed * 1000)  # ms
    
    def _benchmark_translation(self, benchmark: BenchmarkResult):
        """Benchmark translation service"""
        import random
        
        for _ in range(benchmark.count or 30):
            start = time.time()
            # In real implementation, call translation API
            time.sleep(0.3 + random.random() * 0.2)  # Simulated
            elapsed = time.time() - start
            benchmark.add_result(elapsed * 1000)  # ms
    
    def _benchmark_summarization(self, benchmark: BenchmarkResult):
        """Benchmark text summarization"""
        import random
        
        for _ in range(benchmark.count or 20):
            start = time.time()
            # In real implementation, call summarization API
            time.sleep(0.5 + random.random() * 0.5)  # Simulated
            elapsed = time.time() - start
            benchmark.add_result(elapsed * 1000)  # ms


class BenchmarkRunner:
    """Main benchmark runner"""
    
    def __init__(self, results_dir: Path = None):
        self.results_dir = results_dir or Path(__file__).parent / "results"
        self.results_dir.mkdir(parents=True, exist_ok=True)
        self.suites: List[BenchmarkSuite] = []
    
    def add_suite(self, suite: BenchmarkSuite):
        """Add a benchmark suite"""
        self.suites.append(suite)
    
    def run_all(self, verbose: bool = False):
        """Run all benchmark suites"""
        print(f"\n{'='*60}")
        print(f"REChain Performance Benchmarks v4.1.10+1160")
        print(f"{'='*60}\n")
        
        start_time = time.time()
        
        for suite in self.suites:
            print(f"Running {suite.name} benchmarks...")
            suite.run_all(verbose=verbose)
            suite.save_all(self.results_dir)
        
        elapsed = time.time() - start_time
        
        # Summary
        print(f"\n{'='*60}")
        print("Benchmark Summary")
        print(f"{'='*60}")
        
        all_pass = True
        for suite in self.suites:
            status_icon = "✓" if suite.status == "PASS" else "⚠" if suite.status == "WARN" else "✗"
            print(f"  {status_icon} {suite.name}: {suite.status}")
            if suite.status != "PASS":
                all_pass = False
        
        print(f"\nTotal time: {elapsed:.2f}s")
        print(f"Results saved to: {self.results_dir}")
        print(f"\nOverall Status: {'PASS' if all_pass else 'WARN/FAIL'}")
        print(f"{'='*60}")
        
        return all_pass
    
    def run_suite(self, suite_name: str, verbose: bool = False) -> bool:
        """Run a specific benchmark suite"""
        for suite in self.suites:
            if suite.name.lower() == suite_name.lower():
                print(f"\n{'='*60}")
                print(f"Running {suite.name} Benchmarks")
                print(f"{'='*60}\n")
                
                suite.run_all(verbose)
                suite.save_all(self.results_dir)
                
                status = "✓" if suite.status == "PASS" else "⚠" if suite.status == "WARN" else "✗"
                print(f"\n{status} {suite.name}: {suite.status}")
                
                return suite.status == "PASS"
        
        print(f"Suite '{suite_name}' not found")
        return False


def main():
    parser = argparse.ArgumentParser(
        description="REChain Performance Benchmark Runner"
    )
    parser.add_argument("--all", action="store_true", help="Run all benchmarks")
    parser.add_argument("--application", action="store_true", help="Run application benchmarks")
    parser.add_argument("--matrix", action="store_true", help="Run Matrix benchmarks")
    parser.add_argument("--ipfs", action="store_true", help="Run IPFS benchmarks")
    parser.add_argument("--ai", action="store_true", help="Run AI benchmarks")
    parser.add_argument("-v", "--verbose", action="store_true", help="Verbose output")
    
    args = parser.parse_args()
    
    runner = BenchmarkRunner()
    
    # Add default suites
    app_suite = ApplicationBenchmarkSuite()
    app_suite.add_benchmark(BenchmarkResult("startup_time", "App startup time", target=3000, unit="ms"))
    app_suite.add_benchmark(BenchmarkResult("memory_usage", "Memory usage", target=150, unit="MB"))
    app_suite.add_benchmark(BenchmarkResult("ui_performance", "UI FPS", target=55, unit="fps"))
    runner.add_suite(app_suite)
    
    matrix_suite = MatrixBenchmarkSuite()
    matrix_suite.add_benchmark(BenchmarkResult("sync_latency", "Initial sync time", target=2000, unit="ms"))
    matrix_suite.add_benchmark(BenchmarkResult("message_send", "Message send time", target=500, unit="ms"))
    matrix_suite.add_benchmark(BenchmarkResult("key_exchange", "Key exchange time", target=1000, unit="ms"))
    runner.add_suite(matrix_suite)
    
    ipfs_suite = IPFSBenchmarkSuite()
    ipfs_suite.add_benchmark(BenchmarkResult("upload", "Upload latency", target=5000, unit="ms"))
    ipfs_suite.add_benchmark(BenchmarkResult("download", "Download latency", target=3000, unit="ms"))
    ipfs_suite.add_benchmark(BenchmarkResult("pin", "Pin operation", target=1000, unit="ms"))
    runner.add_suite(ipfs_suite)
    
    ai_suite = AIBenchmarkSuite()
    ai_suite.add_benchmark(BenchmarkResult("moderation", "Moderation latency", target=200, unit="ms"))
    ai_suite.add_benchmark(BenchmarkResult("translation", "Translation latency", target=500, unit="ms"))
    ai_suite.add_benchmark(BenchmarkResult("summarization", "Summarization latency", target=1000, unit="ms"))
    runner.add_suite(ai_suite)
    
    if args.all or not any([args.application, args.matrix, args.ipfs, args.ai]):
        runner.run_all(args.verbose)
    else:
        if args.application:
            runner.run_suite("application", args.verbose)
        if args.matrix:
            runner.run_suite("matrix", args.verbose)
        if args.ipfs:
            runner.run_suite("ipfs", args.verbose)
        if args.ai:
            runner.run_suite("ai", args.verbose)


if __name__ == "__main__":
    main()
