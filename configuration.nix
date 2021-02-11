{ config, pkgs, options, ... }:

{
  imports = [
    <home-manager/nixos>
    ./hardware
    ./options.nix
  ];


  # burn /tmp
  boot.cleanTmpDir = true;


  # Fix a security hole in place for backwards compatibility. See desc in
  # nixpkgs/nixos/modules/system/boot/loader/systemd-boot/systemd-boot.nix
  boot.loader.systemd-boot.editor = false;


  nix = {
    # package = pkgs.nixUnstable;
    # extraOptions = ''
    #   experimental-features = nix-command flakes
    # '';
    autoOptimiseStore = true;
    trustedUsers = [ "root" "${config.dots.userName}" ];
    nixPath = options.nix.nixPath.default ++ [
      "nixpkgs-overlays=/etc/nixos/overlays"
    ];
  };


  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      nur = import <nur> { inherit pkgs; };
      vimPlugins = pkgs.vimPlugins // pkgs.callPackage ./pkgs/vimPlugins.nix {};
    };
    overlays = [
      (import (builtins.fetchTarball {
        url = https://github.com/mjlbach/neovim-nightly-overlay/archive/master.tar.gz;
      }))
      # (import ./pkgs/tmux.nix)
    ];
  };


  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };


  users.users.${config.dots.userName} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "vboxusers"
      "docker"
      "plugdev"
    ];
    shell = pkgs.zsh;
    initialPassword = "nix";
  };


  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.${config.dots.userName} = {
      home = {
        stateVersion = "${config.system.stateVersion}";
        username = "${config.dots.userName}";
        homeDirectory = "/home/${config.dots.userName}";
      };
      imports = [ ./home.nix ];
    };
  };


  system.stateVersion = "21.03";
}

