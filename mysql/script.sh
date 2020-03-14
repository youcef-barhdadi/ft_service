rc-status > /dev/null
touch /run/openrc/softlevel
DB_DATA_PATH="/var/lib/mysql"
DB_ROOT_PASS="123"
DB_USER="admin"
DB_PASS="123"
MAX_ALLOWED_PACKET="200M"
mysql_install_db --user=mysql --datadir=${DB_DATA_PATH}
rc-service mariadb start
mysqladmin -u root password "${DB_ROOT_PASS}"
sed -i "s|.*bind-address\s*=.*|bind-address=127.0.0.1|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|max_allowed_packet\s*=\s*16M|max_allowed_packet = ${MAX_ALLOWED_PACKET}|g" /etc/mysql/my.cnf
rc-update add mariadb default

apk add openssh
rc-update add sshd
rc-status
/etc/init.d/sshd start


reboot


