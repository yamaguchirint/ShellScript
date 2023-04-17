#!/usr/bin/bash	

DIR="/home/r_yamaguchi";
cd $DIR;

COUNT=$(find . -type f -mmin +11 -name \*MOJIPITTA.txt | xargs rm |  tee -a /home/r_yamaguchi/log.txt | wc -l)
find . -type f -mmin +11 -name \*MOJIPITTA.txt
# 削除件数を出力
echo "${COUNT} ファイル削除しました"
