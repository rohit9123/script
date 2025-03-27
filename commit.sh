#!/bin/bash

# Set repo path (change this to your actual repo path inside Codespace)
repoPath="/workspaces"  # Default Codespace workspace path

# Navigate to repo directory
mkdir -p "$repoPath"
cd "$repoPath" || exit

# Remove existing .git folder if needed
rm -rf .git

# Initialize a new Git repository
git init

# Configure Git user
git config user.name "Rohit Kumar"
git config user.email "rohitkumpan01@gmail.com"

# Define commit messages
commitMessages=(
    "Refactored some code"
    "Fixed a small bug"
    "Added a new feature"
    "Improved performance"
    "Updated documentation"
    "Optimized database query"
    "Fixed UI alignment"
    "Enhanced security"
    "Code cleanup"
    "Added more tests"
)

# Create commits for the last 180 days with a random number of commits per day
days=180

for ((i=days; i>=0; i--)); do
    date=$(date --date="$i days ago" +%Y-%m-%d)
    numCommits=$((RANDOM % 5 + 1))  # Random number of commits (1 to 5 per day)

    for ((j=1; j<=numCommits; j++)); do
        message=${commitMessages[$RANDOM % ${#commitMessages[@]}]}
        echo "Commit on $date: $message ($j/$numCommits)" > activity.txt
        git add activity.txt
        GIT_COMMITTER_DATE="$date 12:00:00" GIT_AUTHOR_DATE="$date 12:00:00" git commit -m "$message"
    done
done

# Set up the remote repository
git branch -M main
git remote remove origin 2>/dev/null  # Remove previous remote if it exists
git remote add origin https://github.com/rohit9123/script  # Change this to your actual repo

# Push commits to GitHub
git push -f origin main  # Force push
