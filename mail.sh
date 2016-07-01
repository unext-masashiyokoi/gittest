#!/bin/bash

############################
## メール添付ファイルスクリプト
## コマンドラインから添付付きメールを送信するスクリプトです.
## ※日本語部分対応のため、完全ではございません.
##
## mail.sh {fromアドレス} {toアドレス} {タイトル} {本文} {添付ファイル名}
##
############################

## 初期化
from_address='koagen server'
to_address='masashi.yokoi@koagen.com'
subject='backup'
mail='dddd'
TMP_FILE='koagendevdump'
boundary=`date +%Y%m%d%H%M%N`
content_type=`file --mime 'koagen server' | cut -d' ' -f2`
filename=`echo 'koagendevdump' | sed -e "s/.*\/\(.*$\)/\1/"`

## メール情報付与
echo "From: $from_address" > $TMP_FILE
echo "To: $to_address" >> $TMP_FILE
echo "Subject: $subject" >> $TMP_FILE
echo "MIME-Version: 1.0" >> $TMP_FILE
echo "Content-type: multipart/mixed; boundary=\"----$boundary\"" >> $TMP_FILE
echo "Content-Transfer-Encoding: 7bit" >> $TMP_FILE
echo "" >> $TMP_FILE
echo "This is a multi-part message in MIME format." >> $TMP_FILE
echo "" >> $TMP_FILE

## 本文
echo "------$boundary" >> $TMP_FILE
echo "Content-type: text/plain; charset=iso-2022-jp" >> $TMP_FILE
echo "Content-Transfer-Encoding: 7bit" >> $TMP_FILE
echo "" >> $TMP_FILE
echo "$main" >> $TMP_FILE
echo "" >> $TMP_FILE

## ファイル情報(base64で送信)
echo "------$boundary" >> $TMP_FILE
echo "Content-type: $content_type" >> $TMP_FILE
echo " name=$filename" >> $TMP_FILE
echo "Content-Transfer-Encoding: base64" >> $TMP_FILE
echo "Content-Disposition : attachment;" >> $TMP_FILE
echo " filename=$filename" >> $TMP_FILE
echo "" >> $TMP_FILE
cat $5 | base64 >> $TMP_FILE
echo "" >> $TMP_FILE
echo "------$boundary--" >> $TMP_FILE

## メールを送信
sendmail -i $to_address < $TMP_FILE

## 一時ファイルを削除
rm -f $TMP_FILE

exit 0
