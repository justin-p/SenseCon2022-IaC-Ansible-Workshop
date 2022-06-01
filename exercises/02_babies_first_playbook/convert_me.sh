# Install nginx
apt install nginx --quiet -y nginx

# Start nginx and configure it to run on boot
service nginx start
systemctl enable nginx

# Copy over files to webroot
cp index.html /var/www/html/index.html
cp index.css /var/www/html/index.css
cp man.gif /var/www/html/man.gif
cp aesthetic.css /var/www/html/aesthetic.css

# Upload new vhost
cp default.vhost /etc/nginx/sites-enabled/default.vhost

# Remove existing vhost
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default

# Retart nginx to load new vhost
service nginx restart

# Allow ssh, http, https and enable the firewall
ufw allow 22
ufw allow 80
ufw allow 443
ufw enable
