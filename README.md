# KOAGEN seed project

## License
KOAGEN seed project is under the <a href="http://www.opensource.org/licenses/MIT">MIT License</a>

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions



* ...

* Full calendar
http://qiita.com/ttaka66/items/016ae8b889060693948c

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.


* サーバー関連

``
sudo rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
nginxのインストール

sudo yum install -y nginx --disablerepo=* --enablerepo=nginx
バージョンの確認

nginx -v
nginx version: nginx/1.8.0
rails server -d -b 0.0.0.0 -p 80
ps awux | grep -v grep | grep 'rails server'

``

http://qiita.com/akito1986/items/56198edcafc222b320a8
http://qiita.com/Salinger/items/5350b23f8b4e0dcdbe23


mysql
$ sudo mkdir /var/log/mysql
$ sudo chown mysql:mysql /var/log/mysql

$ sudo vi /etc/my.cnf
・・・
[mysqld]
・・・
general_log=1
general_log_file=/var/log/mysql/query.log

$ sudo service mysqld restart

mysql > alter table posts character set utf8;
[mysqld]
character-set-server=utf8

