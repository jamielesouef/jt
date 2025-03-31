# jt
A collection of helpers that speed up my day

## 🔍 GitHub Search (`jt g`)

Search GitHub repositories directly from your terminal with enhanced formatting.

## Usage

```bash
jt g -s <search_term> [options]
```

## Examples

```bash
# Basic search
jt g -s "SwiftUI"

# With options
jt g -s "Python" --limit 5 --verbose
```

## Options

| Option | Short | Description |
|--------|-------|-------------|
| `--search` | `-s` | **Required** Search term |
| `--limit` | `-l` | Limit results (default: 30) |
| `--verbose` | `-v` | Show full descriptions |
| `--language` | `-L` | Filter by language (e.g. `-L swift`) |

## Output Format
```text
🔍 Results for "SwiftUI":
───────────────────────────────
🚀 Alamofire-SwiftUI
   - URL: https://github.com/user/repo
   - Description: SwiftUI wrapper for Alamofire

🚀 Awesome-SwiftUI
   - URL: https://github.com/curated/list
   - Description: Curated SwiftUI resources
```

## Tips
- Use quotes for multi-word searches (`-s "machine learning"`)
- Combine with `auth` for private repo access:
  ```bash
  jt auth login
  jt g -s "private-repo" --verbose
  ```
