with (import (fetchTarball https://github.com/nixos/nixpkgs/archive/nixos-22.05.tar.gz)  {});
  # Uses NixOS 22.05 to get access to PHP 8.1

stdenv.mkDerivation rec {
  name = "php-laravel-assessment";

  env = buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
    php81
    nodejs-14_x
    #nodePackages.npm
  ];

  # Environment variables can be defined here
  shellHook = ''
    # Personal Preference for shell prompt; this could
    # also be defined in .bashrc
    #
    # NOTE:  I'd like "PS1" to be defined in ".bashrc", but
    # I'm not sure how to inherit it from the parent shell.
    export PS1="cd \[\e[1;36m\]\w\[\e[m\] \[\e[1;49;33m\]\`parse_git_branch\`\[\e[m\]\n\[\e[1;32m\]  <] \u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[1;32m\]\h [> \[\e[m\]\[\e[37;40m\]\\[\e[m\]"
    export MYNIXPROMPT="\[\e[1;31m\]{\e[1;49;33m\]marvel-nix-env\[\e[1;31m\]} $PS1"

    if [[ ! -z $MYNIXPROMPT ]]; then
        export PS1=$MYNIXPROMPT
    fi

    # Set the path to libraries specific for this project
    # Note that, for now at least, this is a highly localized setting;
    # the specific path should be the place where NixOS stores various
    # libraries for the project.
    export LD_LIBRARY_PATH="$env/lib"
    export LIBGL_DRIVERS_PATH="$env/lib/dri"

    ### For debugging purposes -- the directory where NixOS
    ### installs libraries, drivers, and such
    echo "ENVIRONMENT HASH DIR $env"
  '';
}

