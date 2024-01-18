#!/bin/bash
read -p 'Commit remark: ' remark
git add .
echo git add .
git commit -m "$remark"
echo git commit -m "$remark"
git push -u origin main
