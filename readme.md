# Build your PW Webserver Panel


## Installation

> [Want a 10-minutes video overview?](https://www.youtube.com/watch?v=m5Jmh9JKnyQ)


## Laravel 4.2 and Below

The Project is build under Laravel Framework through Composer

You can install Composer Global into your system by following this link

> [Install Composer](https://getcomposer.org/doc/00-intro.md)

Next, update Composer from the Terminal: (if your composer is set properly as Global run)

    composer update --dev

Next, Edit your http.config for match your public folder of this WebPlatform Pack

	As i'm using Bitnami Stack on my local mine is located here :
	C:\Bitnami\wampstack-5.4.36-0\apache2\conf\
	Be sure that you mod_rewrite is enabled

	<VirtualHost 192.168.2.10:80>
    ServerAdmin root@localhost
    ServerName dev.demopanel
    DocumentRoot "C:/Bitnami/wampstack-5.4.36-0/frameworks/laravel/demopanel/public"
    <Directory "C:/Bitnami/wampstack-5.4.36-0/frameworks/laravel/demopanel/public/">
    Options +MultiViews
    AllowOverride All
        <IfVersion < 2.3 >
            Order allow,deny
            Allow from all
        </IfVersion>
        <IfVersion >= 2.3>
            Require all granted
        </IfVersion>
    </Directory>
	</VirtualHost>

From Above it's mean Public folder will be your webstie 
```
http://dev.demopanel
```
Restart your apache when this folder is created

Now Put all the project into this folder C:/Bitnami/wampstack-5.4.36-0/frameworks/laravel/demopanel/
Remember this Folder link is for demo purpose that may be different depend of your web setting

Once this operation completes, the final step is to create your database and run the sql file provide in the package (Only if you gonna fresh install database for your server)

(Incoming...)
