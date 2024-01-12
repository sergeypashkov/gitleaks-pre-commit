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

Notes:
1. The script automatically installs gitleaks if it is not found on the system.
2. The default version of gitleaks is v8.18.1.

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

Notes, gitleaks **will not be removed** by default.

If you want to remove the gitleaks binary, execute:

```
curl https://raw.githubusercontent.com/sergeypashkov/gitleaks-pre-commit/main/gitleaks-uninstall-pre-commit.sh | sh -s -- gitleaks_uninstall
```

It only removes gitleaks from locations used by the installation script.

