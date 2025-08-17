#!/bin/bash

# Check if inside a Git repo
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "❌ This is not a Git repository. Run 'git init' first."
    exit 1
fi

# Check if there are changes to commit
if git diff --quiet && git diff --cached --quiet; then
    echo "⚠️  No changes to commit."
    exit 0
fi

# Ask for commit message
read -p "Enter commit message: " commit_msg

# Ask if you want to create a new branch
read -p "Do you want to create a new branch? (y/n): " create_branch

if [ "$create_branch" == "y" ]; then
    read -p "Enter new branch name: " branch_name
    git checkout -b "$branch_name"
else
    # Show current branch
    current_branch=$(git branch --show-current)
    echo "Current branch is: $current_branch"
    read -p "Enter branch to push to (press Enter to use current): " branch_name
    if [ -z "$branch_name" ]; then
        branch_name=$current_branch
    else
        git checkout "$branch_name"
    fi
fi

# Ask for repo link if not already set
read -p "Enter repo link (leave blank if already added): " repo_link
if [ ! -z "$repo_link" ]; then
    git remote add origin "$repo_link" 2>/dev/null
fi

# Stage, commit, push
git add .
git commit -m "$commit_msg"
git push -u origin "$branch_name"
