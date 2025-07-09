
# Getting Started with REChain

## Latest Release Information

This guide is updated for REChain version 4.1.6+1149, released on 2025-07-08.

Refer to [RELEASE_NOTES.md](./RELEASE_NOTES.md) for detailed release information.

---

## Prerequisites
Ensure the following tools and dependencies are installed on your system:
- **Rust** (for node software development): [Install Rust](https://www.rust-lang.org/learn/get-started)
- **Git** (for version control): [Install Git](https://git-scm.com/)
- **Flutter** (for front-end development): [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart** (Flutter's underlying language): [Install Dart](https://dart.dev/get-dart)

## Setup Instructions

### Node Development (Rust)
1. **Clone the repository**:
   ```bash
   git clone https://github.com/sorydima/REChain-.git
   cd REChain-
   ```

2. **Build the project using Cargo**:
   REChain is built using Rust, and `cargo` (Rust's package manager) will handle the compilation and dependencies.
   ```bash
   cargo build --release
   ```

3. **Run the REChain Node**:
   Start a REChain node after building it. This will connect your machine to the decentralized REChain network.
   ```bash
   ./target/release/rechain-node --config ./config/config.toml
   ```

### Frontend Development (Flutter)
1. **Set up Flutter**:
   Install Flutter and ensure it is correctly configured by running:
   ```bash
   flutter doctor
   ```

2. **Clone the frontend repository** (if applicable):
   ```bash
   git clone https://github.com/sorydima/REChain-Frontend.git
   cd REChain-Frontend
   ```

3. **Run the Flutter app**:
   Install dependencies and run the app:
   ```bash
   flutter pub get
   flutter run
   ```

---

