#!/bin/sh

set -e

# Check if the current directory is a Git repository
if [ ! -d .git ]; then
    echo "Error: This script should be called in an initialized Git repository."
    exit 1
fi

uninstall_gitleaks() {

    # Check if the operating system is macOS
    if [ "$(uname)" = "Darwin" ]; then
    	gitleaks_path="/opt/local/bin/gitleaks"
    # Check if the operating system is Linux
    elif [ "$(uname)" = "Linux" ]; then
       gitleaks_path="/usr/local/bin/gitleaks"
    else
        echo "Error: Unsupported operating system."
        exit 1
    fi
    
    if [ ! -f "$gitleaks_path" ]; then
		echo "Error:  $gitleaks_path is not found, uninstallation skipped"
	else
		sudo rm "$gitleaks_path"
		echo "$gitleaks_path uninstalled."
	fi 
}

remove_pre_commit_hook() {
	if [ ! -f .git/hooks/pre-commit ]; then
		echo "Error: pre-commit hook doesn't exists."
		exit 1
	else
    	rm .git/hooks/pre-commit
    	echo "pre-commit hook removed."
	fi   
}

if [ "$1" = "gitleaks_uninstall" ]; then
	uninstall_gitleaks
fi

remove_pre_commit_hook
