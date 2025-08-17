# GitFlow Script  

A simple Bash script to automate common Git tasks:  
- Adding changes  
- Committing with a message  
- Creating or switching branches  
- Connecting to a remote repo  
- Pushing to the right branch  

This saves you from typing the same commands every time.

---

## 🚀 Features  
- Prompts for a **commit message**  
- Option to **create a new branch** or use an existing one  
- Automatically stages changes (`git add .`)  
- Checks if there are changes before committing (no empty commits)  
- Asks for the remote repo link if not already set  
- Pushes to the correct branch  

---

## ⚙️ Setup  

1. Copy the script into your project folder as `gitflow.sh`.  
2. Make it executable:  
   ```bash
   chmod +x gitflow.sh
