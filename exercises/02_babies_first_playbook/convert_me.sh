# Install nginx
apt install nginx --quiet -y nginx

# Copy over files to webroot
cp index.html /var/www/html/index.html
cp index.css /var/www/html/index.css
cp man.gif /var/www/html/man.gif
cp aesthetic.css /var/www/html/aesthetic.css

# start nginx and configure it to run on boot
service nginx start
systemctl enable nginx

# Allow ssh, http, https and enable the firewall
ufw allow 22
ufw allow 80
ufw allow 443
ufw enable
