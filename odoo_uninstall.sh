#!/bin/bash
################################################################################
# Script for uninstalling Odoo V9 on Ubuntu 14.04 LTS (could be used for other version too)
# Author: Abdulhamid Alsalman
#-------------------------------------------------------------------------------
# Make a new file:
# sudo nano odoo-uninstall.sh
# Place this content in it and then make the file executable:
# sudo chmod +x odoo-uninstall.sh
# Execute the script to uninstall Odoo:
# ./odoo-uninstall
################################################################################

## Stop service 
sudo service odoo-server stop
sudo pkill -u odoo

# Remove config file(s)
sudo rm -f /etc/odoo-server.conf
sudo rm -f /etc/odoo.conf

# Remove application code
sudo rm -R /odoo

# Remove startup process
sudo update-rc.d -f odoo-server remove
sudo rm -f /etc/init.d/odoo-server

# Remove logs
sudo rm -R /var/log/odoo

# Remove databases
sudo service postgresql stop
sudo apt-get remove postgresql -y
sudo apt-get --purge remove postgresql\* -y
sudo rm -r -f /etc/postgresql/
sudo rm -r -f /etc/postgresql-common/
sudo rm -r -f /var/lib/postgresql/

# Delete users and groups
sudo userdel -r postgres
sudo groupdel postgres
sudo userdel -r odoo
sudo groupdel odoo

