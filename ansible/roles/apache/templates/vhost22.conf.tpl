# Default Apache virtualhost template

<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot {{ apache.docroot_contents }}
    ServerName {{ apache.servername_contents }}

    <Directory {{ apache.docroot }}>
        AllowOverride All
        Options -Indexes FollowSymLinks
        Order allow,deny
        Allow from all
    </Directory>
    SetEnv FUEL_ENV {{ apache.fuel_env }}
</VirtualHost>

<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot {{ apache.docroot }}
    ServerName {{ apache.servername }}

    <Directory {{ apache.docroot }}>
        AllowOverride All
        Options -Indexes FollowSymLinks
        Order allow,deny
        Allow from all

        Order deny,allow
        Deny from all
        Allow from 192.168.0.0/16    # local machine
        Allow from 125.234.96.138    # vtlabo
        Allow from 125.100.175.162   # aucfan office
        Allow from 125.100.175.171   # NETSEA
    </Directory>
    SetEnv FUEL_ENV {{ apache.fuel_env }}
</VirtualHost>
