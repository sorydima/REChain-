#!/bin/bash

# REChain Demo Setup Script
# This script sets up a demonstration environment showcasing REChain's capabilities

echo "🚀 Setting up REChain Demo Environment..."

# Function to write colored output
write_status() {
    local message="$1"
    local color="$2"
    case $color in
        "green") echo -e "\033[32m[$(date '+%H:%M:%S')] $message\033[0m" ;;
        "yellow") echo -e "\033[33m[$(date '+%H:%M:%S')] $message\033[0m" ;;
        "red") echo -e "\033[31m[$(date '+%H:%M:%S')] $message\033[0m" ;;
        *) echo -e "[$(date '+%H:%M:%S')] $message" ;;
    esac
}

# Step 1: Environment Setup
write_status "Setting up development environment..." "yellow"
source scripts/fix_rust_environment.sh

# Step 2: Build Demo Application
write_status "Building REChain demo application..." "yellow"
export PATH="$PATH:$HOME/flutter/bin"

# Create demo configuration
write_status "Creating demo configuration..." "yellow"
cat > demo_config.json << EOF
{
  "demo_mode": true,
  "features": {
    "matrix_integration": true,
    "ai_agents": true,
    "blockchain": true,
    "ipfs_storage": true,
    "digital_workspaces": true
  },
  "demo_data": {
    "users": 1000,
    "transactions": 50000,
    "ai_agents": 25,
    "workspaces": 50
  }
}
EOF

# Step 3: Build for multiple platforms
write_status "Building for multiple platforms..." "yellow"

# Linux build
if flutter build linux --debug; then
    write_status "✅ Linux build successful!" "green"
else
    write_status "⚠️ Linux build failed, continuing..." "yellow"
fi

# Web build
if flutter build web --release; then
    write_status "✅ Web build successful!" "green"
else
    write_status "⚠️ Web build failed, continuing..." "yellow"
fi

# Step 4: Create Demo Documentation
write_status "Creating demo documentation..." "yellow"
cat > DEMO_GUIDE.md << 'EOF'
# REChain Demo Guide

## Quick Start Demo

### 1. Platform Overview
- **Matrix Integration**: Decentralized messaging and collaboration
- **AI Agents**: Julia AI & Magic AI for business automation
- **Blockchain**: Smart contracts and decentralized governance
- **IPFS Storage**: Distributed file storage and content addressing
- **Digital Workspaces**: Collaborative environments with autonomous agents

### 2. Key Features Demonstrated
- **Multi-Agent Protocols**: Autonomous business processes
- **Digital Sovereignty**: Self-sovereign identity management
- **AI + Blockchain Fusion**: Intelligent automation and compliance
- **Real-World Asset (RWA)**: Tokenization and legal transparency
- **Global Impact**: NGO support and community programs

### 3. Demo Scenarios
- **Business Process Automation**: AI-driven workflow management
- **Decentralized Collaboration**: Matrix-based team communication
- **Smart Contract Governance**: Automated compliance and auditing
- **Data Sovereignty**: User-controlled data management
- **Cross-Platform Integration**: Seamless protocol interoperability

### 4. Technical Architecture
- **Modular Design**: Scalable and maintainable architecture
- **Security First**: Multi-layered cybersecurity framework
- **Privacy by Design**: Zero-knowledge proofs and data minimization
- **Interoperability**: Multi-protocol support and bridge infrastructure

## Running the Demo

1. **Start the Application**:
   ```bash
   flutter run -d linux
   # or
   flutter run -d chrome
   ```

2. **Access Demo Features**:
   - Matrix chat rooms for collaboration
   - AI agent dashboard for automation
   - Blockchain explorer for transactions
   - Digital workspace for project management

3. **Demo Credentials**:
   - Username: demo@rechain.online
   - Password: demo123
   - Workspace: REChain Demo Environment

## Next Steps

- **Partnership Opportunities**: Contact us for collaboration
- **Technical Integration**: Access our APIs and SDKs
- **Community Participation**: Join our developer community
- **Impact Initiatives**: Support our social impact programs

For more information, visit: https://rechain.online
EOF

# Step 5: Create Demo Scripts
write_status "Creating demo automation scripts..." "yellow"

# Demo automation script
cat > scripts/run_demo.sh << 'EOF'
#!/bin/bash

echo "🎬 Starting REChain Demo..."

# Start the application
flutter run -d linux &
DEMO_PID=$!

# Wait for application to start
sleep 10

echo "✅ Demo application started!"
echo "📱 Access the demo at: http://localhost:8080"
echo "🔑 Demo credentials: demo@rechain.online / demo123"
echo ""
echo "Press Ctrl+C to stop the demo"

# Wait for user to stop
wait $DEMO_PID
EOF

chmod +x scripts/run_demo.sh

# Step 6: Create Presentation Materials
write_status "Creating presentation materials..." "yellow"

cat > PRESENTATION.md << 'EOF'
# REChain Presentation: Digital Infrastructure of Autonomous Organizations

## Executive Summary
REChain is the foundational "Digital Spine" for the next generation of autonomous organizations, bridging traditional enterprise systems with emerging Web4.0 technologies.

## Key Value Propositions

### 1. Multi-Agent Protocols & Autonomous Ecosystems
- **Why 2025 is the Year of Autonomous Agent Systems**
- **REChain Workspaces**: Decentralized Digital Workforce
- **Zero Human Middleware**: Replacing routine with agents

### 2. Digital Sovereignty & Trusted Web 4.0
- **Alliance for Free, Secure, and Transparent Internet**
- **Sovereign Network Identities** for Business and Users
- **Interoperability and Protocol Diplomacy**

### 3. AI + Blockchain: The Fusion Layer
- **Julia AI & Magic AI**: Autonomous Business Assistants
- **AI-driven DAO** and automated process management
- **AI-powered compliance** and audits in Web3 ecosystems

### 4. Real-World Assets (RWA) & LegalTech
- **Legal transparency** in RWA transactions
- **On-chain documents** and electronic contracts
- **KYC/AML automation** and compliance

### 5. Global Impact & Community
- **Zero-Cost Protocol Access** for NGOs
- **Social pilots**: Piglet Initiative and other programs
- **REChain as ImpactTech Platform**

## Technical Architecture
- **Modular Design**: Scalable and maintainable
- **Multi-Protocol Support**: Matrix, IPFS, Blockchain
- **Security First**: Beyond Web3 security standards
- **Privacy by Design**: Zero-knowledge proofs

## Market Opportunity
- **Target Market**: Autonomous organizations, DAOs, GovTech
- **Geographic Focus**: MENA, BRICS, Global expansion
- **Revenue Model**: Sustainable monetization without speculation
- **Competitive Advantage**: Comprehensive ecosystem approach

## Roadmap 2025-2030
- **Phase 1 (2025)**: Foundation and core platform
- **Phase 2 (2026-2027)**: Global expansion and ecosystem growth
- **Phase 3 (2028-2029)**: Advanced AI integration
- **Phase 4 (2030)**: Digital autonomy infrastructure

## Call to Action
Join us in building the digital infrastructure of autonomous organizations for a more efficient, transparent, and autonomous digital future.

**Contact**: contact@rechain.online
**Website**: https://rechain.online
**Documentation**: https://docs.rechain.online
EOF

write_status "✅ Demo environment setup completed!" "green"
write_status "📁 Demo files created:" "yellow"
write_status "   - demo_config.json" "yellow"
write_status "   - DEMO_GUIDE.md" "yellow"
write_status "   - scripts/run_demo.sh" "yellow"
write_status "   - PRESENTATION.md" "yellow"
write_status "" "yellow"
write_status "🚀 To start the demo, run: ./scripts/run_demo.sh" "green" 