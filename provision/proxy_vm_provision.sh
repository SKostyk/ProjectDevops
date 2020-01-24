
yum install -y epel-release
yum install -y nginx vim

cp /vagrant/distro/nginx.conf /etc/nginx/nginx.conf  


# unlink /etc/nginx/sites-enabled/default


# cat > /etc/nginx/sites-available/reverse-proxy.conf <<EOF
# server {
#     listen 13422;
#     ssl on;
#     ssl_certificate /etc/ssl/your_domain_name.pem; (or  bundle.crt)
#   ssl_certificate_key /etc/ssl/your_domain_name.key;
#     location / {
#         proxy_pass http://10.0.0.20;
#     }
# }
# EOF

systemctl start nginx
systemctl enable nginx

# service nginx configtest
# service nginx restart
