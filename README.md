Marvelous Assessment:  PHP - Laravel
====================================

An app for listing favorite Marvel 


Setup
-----

I used NixOS to install PHP 8.1 locally, so that I wouldn't have to have PHP installed on my
home computer when I'm done (and also so I could preserve the ability to run different versions
of PHP in the future).  This also makes it easier to try this assessment on different computers
(so long as they run Linux, MacOS, or other Unix-ish environments that support NixOS).  The NixOS
configuration can be found in `shell.nix`, and activated (after NixOS is installed) via the command

```bash
    nix-shell
```
run from the main directory of this project.  It should be possible to install Composer and
Laravel from `shell.nix`, but I'm still uncomfortable with installing these this way.  Thus,
once the shell is activated, it's necessary to install these by hand:

```bash
    # Install Composer
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
```

NOTE:  Since I want to keep this installation local, rather than run "composer.phar" directly, it's
necessary to run Composer via
```bash
    php composer.phar
```

To install Laravel 8 and create a project:

```bash
    # Install Laravel and create a project
    php composer.phar create-project --prefer-dist laravel/laravel assessment-app 9

    # Confirm installment was successful:
    cd assessment-app
    php artisan -V
    # This should output something like:  "Laravel Framework 9"
```

I'm thinking of using Vue.js for this project, although I may decide to just stick with
vanilla JavaScript.

To install Vue.js ()(via this tutorial)[https://techvblogs.com/blog/how-to-install-vue3-laravel-9]):

```bash
    # In project directory:
    npm install --save vue@next
    npm install --save-dev vue-loader@next
    npm run dev
    nmp run watch
```

