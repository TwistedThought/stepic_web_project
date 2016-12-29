#nginx conf
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart

#gunicorn conf
sudo ln -s /home/box/web/etc/gunicorn.conf   /etc/gunicorn.d/ask
sudo /etc/init.d/gunicorn restart 

#database conf
mysql -uroot -e "CREATE DATABASE ASK"
mysql -uroot -e "CREATE USER 'sa'@'localhost' IDENTIFIED BY 'sa'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON ASK.* TO 'sa'@'localhost'"


python /home/box/web/ask/manage.py syncdb
