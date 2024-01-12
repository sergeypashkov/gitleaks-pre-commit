#!/bin/bash


# Check if the current directory is a Git repository
if [ ! -d .git ]; then
    echo "Error: This script should be called in an initialized Git repository."
    exit 1
fi

dir=$(pwd)

install_gitleaks() {
	# Remove /tmp/gitleaks if it exists
	if [ -d "/tmp/gitleaks" ]; then
		rm -rf /tmp/gitleaks
	fi

    # Clone gitleaks repository to /tmp
    git clone https://github.com/zricethezav/gitleaks.git /tmp/gitleaks

    # Navigate to the gitleaks directory
    cd /tmp/gitleaks

    # Build gitleaks
    make build

    # Check if the operating system is macOS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Check if /opt/local/bin is already in the PATH
        if [[ ":$PATH:" != *":/opt/local/bin:"* ]]; then
            # If not, add /opt/local/bin to the PATH for the current user
            echo 'export PATH=$PATH:/opt/local/bin' >> ~/.bash_profile

            # Source the updated profile to apply changes immediately
            source ~/.bash_profile

            echo "/opt/local/bin added to the PATH."
        else
            echo "/opt/local/bin is already in the PATH."
        fi

        # Copy gitleaks binary to /opt/local/bin
        sudo cp gitleaks /opt/local/bin/
        echo "gitleaks is now built and installed. The binary is added to /opt/local/bin."

    # Check if the operating system is Linux
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Copy gitleaks binary to /usr/local/bin
        sudo cp gitleaks /usr/local/bin/
        echo "gitleaks is now built and installed. The binary is added to /usr/local/bin."

    else
        echo "Error: Unsupported operating system."
        exit 1
    fi
    
    rm -rf /tmp/gitleaks
}

create_pre_commit_hook() {
	cd "$dir"

    # Create the pre-commit hook
    cat <<'EOF' > .git/hooks/pre-commit
#!/bin/sh
#

enable_gitleaks=$(git config --type=bool hooks.enable-gitleaks)

if [ "$enable_gitleaks" = "true" ]; then
    gitleaks protect --verbose --staged --no-banner

    retVal=$?
    if [ $retVal -ne 0 ]; then
        echo "Error: Commit rejected"
    fi
    exit $retVal
fi
EOF

    chmod +x .git/hooks/pre-commit
    echo "pre-commit hook created and set to executable."

    # Enable the pre-commit hook using git config
    git config --type=bool hooks.enable-gitleaks true
    echo "Enabled gitleaks in the pre-commit hook using git config."
}

# Check if gitleaks is already installed
if ! command -v gitleaks &> /dev/null; then
    # Call the installation function
    install_gitleaks
else
    echo "gitleaks is already installed. Skipping installation."
fi

# Check if pre-commit hook exists before creating
if [ ! -e .git/hooks/pre-commit ]; then
    create_pre_commit_hook
else
    echo "Error: pre-commit hook already exists. Please remove or modify it manually."
    exit 1
fi
