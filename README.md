# Morsel - the integrated restaurant service

**N.B - I have left the Slim 3 readme at the bottom of this file for quick reference - some of you may not have used it before.**

## Objectve

1. To practice using modern technologies in a project with real life application.
2. To practice collaboration, design and development stratergies, applicable to working in any modern software house.

*Find a list of some useful resources here* [Resources](RESOURCES.md) 

[Project Trello Board](https://trello.com/b/JXsVb3el) - contact ross.w.eastman@gmail.com


# Slim Framework 3 Skeleton Application

Use this skeleton application to quickly setup and start working on a new Slim Framework 3 application. This application uses the latest Slim 3 with the PHP-View template renderer. It also uses the Monolog logger.

This skeleton application was built for Composer. This makes setting up a new Slim Framework application quick and easy.

## Install the Application

Run this command from the directory in which you want to install your new Slim Framework application.

    php composer.phar create-project slim/slim-skeleton [my-app-name]

Replace `[my-app-name]` with the desired directory name for your new application. You'll want to:

* Point your virtual host document root to your new application's `public/` directory.
* Ensure `logs/` is web writeable.

To run the application in development, you can also run this command. 

	php composer.phar start

Run this command to run the test suite

	php composer.phar test

That's it! Now go build something cool.
