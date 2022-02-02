# uninstalling-odoo

Just follow these steps

service odoo-server stop

#Remove config file(s)
rm -f /etc/odoo-server.conf
rm -f /etc/odoo.conf

#Remove application code
rm -R /opt/odoo

#Remove startup process
update-rc.d -f odoo-server remove
rm -f /etc/init.d/odoo-server

#Remove logs
rm -R /var/log/odoo

#Remove databases
sudo service postgresql stop

apt-get remove postgresql -y

apt-get --purge remove postgresql\* -y

rm -r -f /etc/postgresql/

rm -r -f /etc/postgresql-common/

rm -r -f /var/lib/postgresql/

#Delete users and groups
userdel -r postgres
groupdel postgres

To Remove postgre find the file pg_hba.conf - it may be located, for example in /etc/postgresql-9.1/pg_hba.conf.

cd /etc/postgresql-9.1/

Back it up
cp pg_hba.conf pg_hba.conf-backup

place the following line (as either the first uncommented line, or as the only one):

local all all trust

restart your PostgreSQL server (e.g., on Linux:)

sudo /etc/init.d/postgresql restart

you can now connect as any user. Connect as the superuser postgres (note, the superuser name may be different in your installation. In some systems it is called pgsql, for example.)

psql -U postgres

#Reset password
ALTER USER my_user_name with password 'my_secure_password';

Restore the old pg_hba.conf as it is very dangerous to keep around

cp pg_hba.conf-backup pg_hba.conf

restart the server, in order to run with the safe pg_hba.conf

sudo /etc/init.d/postgresql restart


sudo wget https://raw.githubusercontent.com/sumerbabel/odoo-uninstall-script/master/odoo_uninstall.sh
sudo chmod +x odoo_uninstall.sh

sudo ./odoo_uninstall.sh


rm /etc/systemd/system/odoo
rm /etc/systemd/system/odoo
rm /usr/lib/systemd/system/odoo 
rm /usr/lib/systemd/system/odoo
systemctl daemon-reload
systemctl reset-failed
