
## 🐦 Shorebird Integration (Code Push Updates)

This project uses **[Shorebird](https://shorebird.dev/)** for code push updates in Flutter apps.

### ⚙️ How to Install Shorebird CLI:
```bash
curl https://get.shorebird.dev | bash
export PATH="$HOME/.shorebird/bin:$PATH"
shorebird --version
```

### 🚀 Initialize Shorebird in This Project:
```bash
shorebird init
```

This command will:
- Set up Shorebird in the project.
- Add the required `shorebird_code_push` package.
- Configure native projects (`android`, `ios`, etc).

---

### 📲 Running the App with Shorebird:
In `lib/main.dart`:
```dart
import 'package:shorebird_code_push/shorebird_code_push.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ShorebirdCodePush.instance.ensureInitialized();
  runApp(const MyApp());
}
```

---

### 🏗️ Building with Shorebird:
```bash
shorebird build apk
shorebird build ios
shorebird build appbundle
```

---

### ⚡️ Manual Update Control (Optional):
To manually control updates, edit `.shorebird/shorebird.yaml`:
```yaml
auto_update: false
```

Then, in your app:
```dart
final update = await ShorebirdCodePush.instance.checkForUpdate();
if (update != null) {
  await update.downloadAndInstall();
}
```

---

### 📦 Releasing Patches:
```bash
shorebird patch android
```

---

### 📝 Docs:
- [Shorebird Documentation](https://docs.shorebird.dev/)
- [Shorebird Code Push Package](https://pub.dev/packages/shorebird_code_push)

https://api.codemagic.io/apps/688f97e647fd81ea2dff2a29/688f97e647fd81ea2dff2a28/status_badge.svg

[![Codemagic build status](https://api.codemagic.io/apps/688f97e647fd81ea2dff2a29/688f97e647fd81ea2dff2a28/status_badge.svg)](https://codemagic.io/app/688f97e647fd81ea2dff2a29/688f97e647fd81ea2dff2a28/latest_build)

# REChain Ecosystem

A next-generation, open-source, modular ecosystem for decentralized communication, blockchain, AI, and Web3 integrations. Built with Flutter, Dart, and modern cloud-native technologies.

---

## 🚀 Overview
REChain is a comprehensive platform that unifies Matrix protocol, blockchain, IPFS, AI, and external services into a seamless, extensible, and developer-friendly ecosystem. It empowers users and developers to build, scale, and secure decentralized apps, bots, and integrations for the future of the internet.

---

## ✨ Key Features
- **Matrix Protocol**: Multi-client, multi-server, bridges, bots, federation, and advanced Matrix integrations
- **Blockchain**: TON, Ethereum, Bitget, Web3, smart contracts, token/NFT support, on-chain identity
- **IPFS**: Multi-provider decentralized storage, file manager, encryption, quotas, analytics, REST/gRPC API
- **AI & Analytics**: GPT, moderation, translation, code analysis, monitoring, dashboards
- **Serverless & API**: REST, GraphQL, gRPC, WebSocket, serverless hooks, monitoring
- **Security**: Encryption, quotas, advanced logging, best practices
- **Modern UI/UX**: Flutter-based, responsive, accessible, beautiful dashboards and tools

---

![Screenshot](https://github.com/sorydima/REChain-/blob/main/assets/banner.png)

### **REChain Messenger** 🪐🔒  

https://api.codemagic.io/apps/6849dcd1411f3e1270f933cd/6849dcd1411f3e1270f933cc/status_badge.svg

[![Codemagic build status](https://api.codemagic.io/apps/6849dcd1411f3e1270f933cd/6849dcd1411f3e1270f933cc/status_badge.svg)](https://codemagic.io/app/6849dcd1411f3e1270f933cd/6849dcd1411f3e1270f933cc/latest_build)

**REChain Messenger** is a decentralized messaging app focused on privacy, security, and unrestricted communication. It operates without centralized servers, eliminating censorship, data leaks, and third-party surveillance.  

## 🔹 **Key Features**  


Before We start!

Termius provides a secure, reliable, and collaborative SSH client.

![termius-logo-1444-black](https://github.com/user-attachments/assets/3480ec66-4b3a-40e8-8241-69c4aa37f383)

![termius-icon-1024](https://github.com/user-attachments/assets/29871120-f7ce-4d98-a2ba-087917d2769a)

### **1. Fully Decentralized Architecture**  
- No central servers – all messages are transmitted through a distributed network.  
- Users can deploy their own nodes, ensuring network resilience.  

### **2. End-to-End Encryption**  
- Advanced cryptographic algorithms protect messages and files.  
- Only the sender and recipient can decrypt conversations.  

### **3. True Anonymity**  
- No phone number or email required for registration.  
- One-time IDs for anonymous communication.  

### **4. Built-in Wallet & Token Support**  
- Send digital assets directly within chats.  
- Smart contract support and integration with REChain Network.  

### **5. Censorship & Block Resistance**  
- A decentralized network prevents full shutdowns.  
- Dynamic node support for bypassing restrictions.  

## 🔥 **Why Choose REChain Messenger?**  
This messenger is designed for those who value freedom, security, and innovation in digital communication. It is perfect for activists, developers, the crypto community, and anyone who wants to protect their data from third-party interference.  

👉 **REChain Messenger is the new standard of privacy in the digital world!** 🚀

[https://api.codemagic.io/apps/675837aa04e89a7e9f69389a/675837aa04e89a7e9f693899/status_badge.svg](https://api.codemagic.io/apps/67c9699cafcf4725ff136c53/67c9699cafcf4725ff136c52/status_badge.svg)

[![Codemagic build status](https://api.codemagic.io/apps/67c9699cafcf4725ff136c53/67c9699cafcf4725ff136c52/status_badge.svg)](https://codemagic.io/app/67c9699cafcf4725ff136c53/67c9699cafcf4725ff136c52/latest_build)

[REChain ®️ 🪐 ✨](https://online.rechain.network/) is an primarily designed as a security and privacy analysis analogue fully focused on the use of platform moments and messages for communication, built on a source code library, including those developed by us, for those who respect freedom and privacy, as well as the safety and security of personal data. 🌤 Our task was to make a tool pleasant and enjoyable to use, with which each of you can communicate, expand content, create workspaces, organize a workflow. 🌈 We strive to show all the world's giants that it is possible to create cool products that are of great importance for society, for people to interact with each other, without selling advertising, personal data of users, their rights and freedoms! 🦄 It's written in [Flutter](https://flutter.dev). Our mission is to create an easy to use instant messenger which is open source and accessible for everyone.

# Industry Impact:

[![Intro Promo](https://github.com/sorydima/REChain-/blob/main/assets/Desktop.png)]

REChain Network Solutions is contributing significantly to the modernization of the energy sector. By utilizing blockchain, the company helps in reducing operational costs, increasing the speed and security of transactions, and promoting the adoption of renewable energy sources. Its solutions are particularly relevant in regions where there is a push towards decentralization of the energy grid and increased reliance on renewable energy.

# Strategic Partnerships:

To enhance its offerings, REChain collaborates with various stakeholders in the energy sector, including renewable energy producers, grid operators, and government agencies. These partnerships are crucial for integrating its technology into existing energy infrastructures and for scaling its solutions across different markets.

# Future Prospects:

As the global demand for renewable energy continues to rise, the role of blockchain in managing energy resources is expected to grow. REChain Network Solutions is well-positioned to capitalize on this trend, offering innovative solutions that not only meet current industry needs but also anticipate future developments in energy technology and policy.

### Links:

- 🌍 [[Katya ® 👽 AI 🧠 REChain ® 🪐 Blockchain Node Network] Join the community!](https://matrix.to/#/#chatting:matrix.katya.wtf)
- 👀 [[DAPP!] Launch dAPP on CodeMagic!](https://onchain.codemagic.app)

### Our Goal:

# Features:

Here's the expanded version with your additions:

- 📩 **Send all kinds of messages, images, and files!**
- 🎙️ **Voice messages for seamless communication!**
- 📍 **Location sharing to stay connected anywhere!**
- 🔔 **Push notifications to never miss an update!**
- 💬 **Unlimited private and public group chats** to build communities and stay in touch with friends.
- 📣 **Public channels** with thousands of participants for broader discussions and content sharing.
- 🛠️ **Feature-rich group moderation**, including all **Katya ® 👽 AI 🧠 REChain ® 🪐 Blockchain Node Network** functionalities for seamless management.
- 🔍 **Discover and join public groups** with just a few clicks.
- 🌙 **Dark mode** for a comfortable browsing experience anytime.
- 🎨 **"Material You" design** for a personalized interface that adapts to your style.
- 📟 **Hides complexity** of the **Katya ® 👽 AI 🧠 REChain ® 🪐 Blockchain Node Network** IDs behind simple **QR codes** for ease of use.
- 😄 **Custom emotes and stickers** to express yourself in fun, creative ways.
- 🌌 **Spaces!** Create unique environments for your community and content.
- 🔄 **Compatible with Element, Nheko, NeoChat, and all other Matrix apps** for cross-platform connectivity.
- 🔐 **End-to-end encryption** for private, secure conversations.
- 🔒 **Encrypted chat backup** to keep your messages safe even if you switch devices.
- 😀 **Emoji verification & cross-signing** for a fast and user-friendly security check!

...and **much more** to discover! Dive into a world of advanced features, powered by the cutting-edge **REChain ® 🪐 Blockchain Node Network**.

# Installation:

Please, visit the website for the installation instructions 🪐:

- https://online.rechain.network 

# Donate US! ⌛️ 

### For tea, coffee! For the future of decentralized and distributed internet. We do cool and, in my opinion, useful things for the safety and security of users' personal data. And on a completely non-commercial basis! 😎

## Tether - (USDT) - 🍕: TRZ7jyMBNtRtqokkkJ7g5BJDzFycDv8cBm

# Socials! 🦄

* <a href="https://twitter.com/rechain_inc">Twitter/X.com</a>

* <a href="https://instagram.com/rechain_inc">Instagram</a>

* <a href="https://facebook.com/rechainINC">Facebook</a>

* <a href="https://matrix.to/#/#lab:matrix.tanya.city">#lab:matrix.tanya.city</a>  
* <a href="https://matrix.to/#/#workdao:matrix.tanya.city">#workdao:matrix.tanya.city</a>  
* <a href="https://matrix.to/#/#ai:hackliberty.org">#ai:hackliberty.org</a>  
* <a href="https://matrix.to/#/#foodies:devture.com">#foodies:devture.com</a>  
* <a href="https://matrix.to/#/#FreeCodeCamp_linux:gitter.im">#FreeCodeCamp_linux:gitter.im</a>  
* <a href="https://matrix.to/#/#design:gossip.land">#design:gossip.land</a>  
* <a href="https://matrix.to/#/#basketball:gossip.land">#basketball:gossip.land</a>  
* <a href="https://matrix.to/#/#books:gossip.land">#books:gossip.land</a>  
* <a href="https://matrix.to/#/#cats:gossip.land">#cats:gossip.land</a>  
* <a href="https://matrix.to/#/#dogs:gossip.land">#dogs:gossip.land</a>  
* <a href="https://matrix.to/#/#film:gossip.land">#film:gossip.land</a>  
* <a href="https://matrix.to/#/#football:gossip.land">#football:gossip.land</a>  
* <a href="https://matrix.to/#/#oslo:gossip.land">#oslo:gossip.land</a>  
* <a href="https://matrix.to/#/#music:gossip.land">#music:gossip.land</a>  
* <a href="https://matrix.to/#/#news:gossip.land">#news:gossip.land</a>  
* <a href="https://matrix.to/#/#science:gossip.land">#science:gossip.land</a>  
* <a href="https://matrix.to/#/#sports:gossip.land">#sports:gossip.land</a>  
* <a href="https://matrix.to/#/#technology:gossip.land">#technology:gossip.land</a>  
* <a href="https://matrix.to/#/#rechain:matrix.tanya.city">#rechain:matrix.tanya.city</a>  
* <a href="https://matrix.to/#/#chatting:matrix.katya.wtf">#chatting:matrix.katya.wtf</a>  
* <a href="https://matrix.to/#/#bitspace:matrix.katya.wtf">#bitspace:matrix.katya.wtf</a>  
* <a href="https://matrix.to/#/#bit:matrix.katya.wtf">#bit:matrix.katya.wtf</a>  
* <a href="https://matrix.to/#/#bitthebot:matrix.org">#bitthebot:matrix.org</a>  
* <a href="https://matrix.to/#/#marinamoda:matrix.org">#marinamoda:matrix.org</a>  
* <a href="https://matrix.to/#/#marinamodaru:matrix.org">#marinamodaru:matrix.org</a>  
* <a href="https://matrix.to/#/#marinamodaen:matrix.org">#marinamodaen:matrix.org</a>  
* <a href="https://matrix.to/#/#toncity:matrix.org">#toncity:matrix.org</a>  
* <a href="https://matrix.to/#/#marinamodacity:matrix.org">#marinamodacity:matrix.org</a>  
* <a href="https://matrix.to/#/#marinadao:matrix.org">#marinadao:matrix.org</a>  
* <a href="https://matrix.to/#/#durovshater:matrix.org">#durovshater:matrix.org</a>  
* <a href="https://matrix.to/#/#slackware:matrix.org">#slackware:matrix.org</a>  
* <a href="https://matrix.to/#/#altlinux-ru:matrix.org">#altlinux-ru:matrix.org</a>  
* <a href="https://matrix.to/#/#stickers:squirrel.rocks">#stickers:squirrel.rocks</a>  
* <a href="https://matrix.to/#/#space:alt-gnome.ru">#space:alt-gnome.ru</a>  
* <a href="https://matrix.to/#/#chat:alt-gnome.ru">#chat:alt-gnome.ru</a>

* <a href="https://t.me/+aNI7CzqG3OAxZDdi">Community for the Lab Venture Builder & Incubator 💡👀💭</a>

* <a href="https://t.me/durovshaterspace">Dmitry's Space 🤳</a>

* <a href="https://t.me/marinamodadao">DAO by Marina.Moda ®</a>

* <a href="https://t.me/marinamodachat">Marina.Moda ® 💖</a>

* <a href="https://t.me/bitbotchain">🎨 Катерина - Профессионал. 🙆 ЦФА и УЦП. 🪙</a>

* <a href="https://t.me/rechainchat">REChain ®️. 🪐</a>

# Special thanks!

* <a href="https://github.com/googlefonts/noto-emoji/">Noto Emoji Font</a> for the awesome emojis!

* <a href="https://github.com/madsrh/WoodenBeaver">WoodenBeaver</a> sound theme for the notification sound!

* The Matrix Foundation for making and maintaining the [Emoji Translations](https://github.com/matrix-org/matrix-doc/blob/main/data-definitions/sas-emoji.json) used for Emoji verification, licensed Apache 2.0!

# HowTO - Building!

Please, send US an E-Mail to support@rechain.network for the build instructions! 👻

Copyright © 2019-2025 Need help? 🤔 Donate US! ⌛️ For tea, coffee! For the future of decentralized and distributed internet. We do cool and, in my opinion, useful things for the safety and security of users' personal data. And on a completely non-commercial basis! 😎 Email us! 👇 A Dmitry Sorokin production. All rights reserved. Powered by REChain ®️. 🪐 Copyright © 2019-2025 REChain, Inc REChain ® is a registered trademark support@rechain.network Please allow anywhere from 1 to 5 business days for E-mail responses! 💌 Our Stats! 👀 At the end of 2023, the number of downloads from the Open-Source Places, Apple AppStore, Google Play Market, and the REChain.Store, namely the Domestic application store from the REChain ®️ brand 🪐, а именно Отечественный магазин приложений от бренда REChain ®️ 🪐 ✨ exceeded 29 million downloads. 😈 👀

## ⚡ Quickstart

### 1. **Clone the repo**
```sh
git clone https://github.com/sorydima/REChain-.git
cd REChain-
```

### 2. **Install dependencies**
```sh
flutter pub get
```

### 3. **Run the app**
```sh
flutter run
```

### 4. **Test**
```sh
flutter test
```

---

## 🔗 Integrations & Usage
- **Matrix**: Use the Matrix dashboard for client/server/bridge/bot management
- **Blockchain**: Manage wallets, smart contracts, and on-chain assets in the Blockchain dashboard
- **IPFS**: Upload, share, encrypt, and manage files in the IPFS dashboard; REST/gRPC API for backend/serverless
- **AI**: Access GPT, moderation, translation, and analytics in the AI dashboard
- **Serverless/API**: Expose and consume REST/gRPC endpoints for all major services

See [docs/](docs/) and the [wiki](https://github.com/sorydima/REChain-/wiki) for full guides, API reference, and code samples.

---

## 🤝 Contributing
We welcome contributions from the community!
- See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for guidelines
- Open issues and pull requests for features, bugs, and docs
- Join discussions in the [wiki](https://github.com/sorydima/REChain-/wiki)

---

## 📚 Documentation
- [docs/](docs/): In-depth guides, API reference, architecture, security, and more
- [wiki/](https://github.com/sorydima/REChain-/wiki): How-tos, troubleshooting, best practices, community

---

## 🛡️ License
[MIT License](LICENSE)

---

## 🌐 Links
- [Project Home](https://github.com/sorydima/REChain-)
- [Docs](docs/)
- [Wiki](https://github.com/sorydima/REChain-/wiki)
- [Contributing](docs/CONTRIBUTING.md)
- [Security](docs/SECURITY.md)

---

*Build the future of decentralized, secure, and intelligent communication with REChain.*

## 🦄 Aurora OS (Sailfish/Aurora) Support

REChain supports Aurora OS via the [flutter-aurora](https://github.com/auroraos/flutaurora) toolchain.

---

## 🐉 Harmony OS Support

We have added support for building REChain for Harmony OS as a new product flavor in the Android build configuration.

### Building for Harmony OS

To build the app for Harmony OS, use the following commands:

```bash
./gradlew assembleHarmonyosRelease
```

or from Flutter:

```bash
flutter build apk --flavor harmonyos
```

### Assets

Harmony OS specific assets should be placed in `android/app/src/harmonyos/res/` directories.

---

## 📢 Release v4.1.7+1150 - 2025-07-08

We are excited to announce the release of REChain version 4.1.7+1150! This release brings major integrations including Matrix, Telegram, blockchain, IPFS, and AI services, along with a dynamic plugin system, unified APIs, and enhanced developer and user experiences.


For detailed information, please see the [CHANGELOG](./CHANGELOG.md) and [RELEASE NOTES](./RELEASE_NOTES.md).

Thank you for your continued support and contributions to the REChain ecosystem!

### Prerequisites
- Install [flutter-aurora](https://github.com/auroraos/flutaurora) and add it to your PATH
- Install Git Bash (Windows) or use a Linux/macOS shell

### Build for Aurora OS
```sh
# Fetch dependencies using flutter-aurora
git clone https://github.com/auroraos/flutaurora.git
cd flutaurora
./setup.sh
export PATH="$PWD/bin:$PATH" # Or add to your shell profile
cd /path/to/REChain-
flutter-aurora pub get
flutter-aurora build aurora
```

### Project Structure for Aurora OS
- `aurora/` — CMake, main.cpp, icons, desktop files, RPM spec
- `REChainPWAForAuroraOS/` — PWA and QML integration (if needed)

### Notes
- Some plugins may require extra permissions or tweaks for Aurora OS.
- Test on a real device or emulator for best results.
- For packaging, see `aurora/rpm/com.rechain.online.spec`.

For more, see [docs/](docs/) and the [wiki](https://github.com/sorydima/REChain-/wiki).

