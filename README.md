## 🛠️ Building & Dependencies

### Prerequisites
```bash
# Install Xcode command line tools
xcode-select --install

# Install Homebrew (if missing)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Dependencies
```bash
# Required tools
brew install gh  # GitHub CLI

# For development
brew install swiftlint  # Optional linter
```

### Build & Install
```bash
# 1. Clone repository
git clone https://github.com/jamielesouef/jt.git
cd jt

# 2. Build release binary
swift build -c release

# 3. Install globally
cp .build/release/jt /usr/local/bin/

# Verify installation
jt --version
```

### Development
```bash
# Run tests (requires Swift 5.10+)
swift test

# Debug build
swift build

# Update dependencies
swift package update
```

### Dependency Graph
```
jt
├── swift-argument-parser (Apple)
├── Rainbow (onevcat)
└── swift-testing (Apple, tests only)
```

### Troubleshooting
- **Missing _TestingInternals**:
  ```bash
  xcode-select -s /Applications/Xcode.app/Contents/Developer
  ```
- **Authentication issues**:
  ```bash
  gh auth login --web
  jt auth status
  ```
- **Clean rebuild**:
  ```bash
  rm -rf .build
  swift package reset
  ```

---

📦 **Repository**: [github.com/jamielesouef/jt](https://github.com/jamielesouef/jt)
