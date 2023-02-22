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

Route API calls are made via API routes, found in "assessment-app/routes/api.php".  These routes
include:

    * POST http://127.0.0.1:8000/marvel_query

They are displayed by:

    * resources/js/components/MarvelousQueryForm.vue

To activate the backend API, it is necessary to add "MARVEL_PUB_API_KEY=[Personal/Project Public Marvel API Key]"
and "MARVEL_PVT_API_KEY=[Personal/Project Private Marvel API Key]to ".env".

To prevent GET requests from becoming unwieldy (and to prevent buffer attacks), a cap is placed on search terms.
This cap is set in ".env" via "MAX_ARGUMENT_LENGTH" and the default is 50.

To install Vue.js (via this tutorial)[https://techvblogs.com/blog/how-to-install-vue3-laravel-9]), add
the changes to the various files described in the tutorial, and then run:

```bash
    # In project directory:
    npm install --save vue@next
    npm install --save-dev vue-loader@next
    npm run dev
    nmp run watch
```


TODO Wishlist
=============

 * Add a way to mark favorites
   - Make sure that favorites aren't duplicated when they are in the search results
   - Make sure favorites boxes are checked if they are already chosen
   - Consider adding favorites to a database or cookies for persistence
 * Add multiple fields to search by (eg by comic, story, event, etc)
 * Add Series, Stories, and other Character information to display
 * Factor out the API function into a separate file, to make it easier to add API functionality
 * Add tests for API endpoints and UI components


