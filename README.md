# gitleaks-pre-commit
Repository with scripts to manage gitleaks and pre-commit hook using it.

Requirements: git, go, curl.

Supported OS: macOS, Linux.

## Usage ##

### Installation ###

1. Go to the repository folder
2. Execute:

```
curl https://raw.githubusercontent.com/sergeypashkov/gitleaks-pre-commit/main/gitleaks-install-pre-commit.sh | sh
```

The default installed version of gitleaks is v8.18.1.

If you need the latest version, execute:

```
curl https://raw.githubusercontent.com/sergeypashkov/gitleaks-pre-commit/main/gitleaks-install-pre-commit.sh | sh -s -- gitleaks_latest
```

### Uninstallation ###

1. Go to the repository folder
2. Execute:

```
curl https://raw.githubusercontent.com/sergeypashkov/gitleaks-pre-commit/main/gitleaks-uninstall-pre-commit.sh | sh
```

Notes:
1. gitleaks **will not be removed** by default.
2. It only removes gitleaks from location used by the installation script 

If you want to remove the gitleaks binary, execute:

```
curl https://raw.githubusercontent.com/sergeypashkov/gitleaks-pre-commit/main/gitleaks-uninstall-pre-commit.sh | sh -s -- gitleaks_uninstall
```
