#!/bin/bash
# 备份数据库和删除N天前的记录

# config
mysql_dump='/usr/local/mysql/bin/mysqldump'
db_file_path='/root/db/caipu/'
db_name='caipu'
db_user='root'
db_pwd='123456'
prefix='caipu_' 
before_day=10





# dump
today=`date '+%Y_%m_%d'`
file_name=$prefix$today.sql.gz
db_file=$db_file_path$file_name
$mysql_dump -u $db_user -p$db_pwd $db_name | gzip > $db_file

# clean
before_date=`date '+%Y_%m_%d' -d "-$before_day day"`
delete_file_name=$prefix$before_date.sql.gz
delete_db_file=$db_file_path$delete_file_name
rm -f $delete_db_file
