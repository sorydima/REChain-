# Code Coverage Guide for REChain

This document explains how to measure and maintain code coverage in the REChain project.

## Overview

Code coverage measures the percentage of code that is executed during testing. It helps ensure that our tests are comprehensive.

## Tools Used

- Flutter test coverage: `flutter test --coverage`
- lcov for coverage reports
- Codecov or Coveralls for CI integration

## Running Coverage

### Local Coverage
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### CI Coverage
Coverage is automatically run in CI pipelines and uploaded to coverage services.

## Coverage Goals

- Minimum 80% overall coverage
- 90%+ for critical components
- Regular monitoring and improvement

## Interpreting Reports

- Lines: Executed lines of code
- Functions: Executed functions
- Branches: Executed conditional branches

## Best Practices

- Write tests for new features
- Maintain coverage when refactoring
- Review coverage reports regularly
- Focus on meaningful coverage, not just numbers

---

*This code coverage guide is part of the REChain documentation suite.*
