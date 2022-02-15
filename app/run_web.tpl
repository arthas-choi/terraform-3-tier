#!/bin/bash

sudo amazon-linux-extras install -y nginx1
sudo service nginx start

sudo yum install -y httpd
sudo systemctl start httpd

cat <<EOF | sudo tee -a /etc/httpd/conf.d/was.conf
<VirtualHost *:80>
    ErrorLog logs/${apache_com_error}
    CustomLog logs/${apache_access} common

    # Put this in the main section of your configuration (or desired virtual host, if using Apache virtual hosts)
    ProxyRequests Off
    ProxyPreserveHost On

        <Proxy *>
                Order deny,allow
                Allow from all
        </Proxy>

        ## mywebapp 설정
        ProxyPass /${web_app} http://${web_alb_dns}:${web_alb_port}/${was_app}
        ProxyPassReverse /${web_app} http://${web_alb_dns}:${web_alb_port}/${was_app}
        <Location /${was_app}>
                Order allow,deny
                Allow from all
        </Location>
</VirtualHost>
EOF

sudo systemctl restart httpd
