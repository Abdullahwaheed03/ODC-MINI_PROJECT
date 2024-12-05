#! /bin/bash 

echo "# ODC-MINI_PROJECT" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Abdullahwaheed03/ODC-MINI_PROJECT.git
git push -u origin main