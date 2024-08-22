# PowerShell script: git_commit.ps1

# Add all changes to the staging area
git add .

# Commit the changes with the message from the file scripts/message.txt
git commit -eF GIT/message.txt

# Push the changes to the remote repository
git push
