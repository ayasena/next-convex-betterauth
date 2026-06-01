{
  pkgs,
  lib,
  # config,
  # inputs,
  ...
}:

{
  # https://devenv.sh/basics/
  env.GREET = "next-convex-betterauth";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    bun
    nodejs
  ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  # https://devenv.sh/processes/
  processes.dev.exec = "bun x convex dev";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  # https://devenv.sh/basics/
  enterShell = ''
    hello         # Run scripts directly
    git --version # Use packages
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/git-hooks/
  git-hooks.hooks.prettier = {
    enable = true;
    entry = "bun format";
  };
  git-hooks.hooks.eslint = {
    enable = true;
    entry = "bun lint";
  };

  # See full reference at https://devenv.sh/reference/options/
}
