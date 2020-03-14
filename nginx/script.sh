adduser -D www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
mv /tmp/nginx.conf /etc/nginx/
rc-status > /dev/null
touch /run/openrc/softlevel

cp /tmp/index.html /www/
 apk add  --no-cache openssh
 rc-update add sshd
mv -f /tmp/sshd_config /etc/ssh/
rc-status
echo "root:root" | chpasswd
/etc/init.d/sshd restart

apk add openssl;
openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
nginx -s reload;


rc-service  nginx start
 
