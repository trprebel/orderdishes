mysqldump -u root -p123456 food > $(pwd)/food.sql
git add .
git commit -m "$1"
git push origin master
