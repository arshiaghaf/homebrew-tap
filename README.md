# arshighaf's Homebrew Tap

Homebrew tap for my projects.

## Install

```bash
brew tap arshiaghaf/tap
```

## Install Packages

```bash
# cask
brew install --cask arshiaghaf/tap/<name>

# after tapping
brew install --cask <name>
```

## Packages

### Casks

- `baseline` - Manage and update all the apps installed on your Mac in one app.

## Update / Uninstall

```bash
brew update
brew upgrade

brew uninstall --cask arshiaghaf/tap/baseline

# remove user data
brew uninstall --cask --zap arshiaghaf/tap/baseline
```

> [`baseline`](https://github.com/arshiaghaf/baseline) can manage Homebrew app updates and uninstall Homebrew-managed apps for you, including casks from this tap.

## Notes

- Run `brew info --cask arshiaghaf/tap/<name>` for cask details.
- `baseline` does not have a packaged release yet. The cask is staged for the first unsigned DMG release and will install once that release artifact exists.
- `baseline` currently stages an unsigned DMG. macOS Gatekeeper may warn when opening unsigned builds.
