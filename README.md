# gitleaks-pre-commit
Repository with scripts to install gitleaks and add pre-commit hook using it.

Requirements: git, go, curl.

## Usage on macOS and Linux ##

### Installation ###
1. Go to the repository folder
2. Execute:

```
    curl https://raw.githubusercontent.com/sergeypashkov/gitleaks-pre-commit/main/gitleaks-install-pre-commit.sh | sh
```

### Uninstallation ###

1. Go to the repository folder
2. Execute:

```
  curl https://raw.githubusercontent.com/sergeypashkov/gitleaks-pre-commit/main/gitleaks-uninstall-pre-commit.sh | sh
```

Note, gitleaks **will not be removed** by default.

if you want to remove the gitleaks binary from the location used by the installation script, execute:

```
curl https://raw.githubusercontent.com/sergeypashkov/gitleaks-pre-commit/main/gitleaks-uninstall-pre-commit.sh | sh -s -- uninstall_gitleaks
```
