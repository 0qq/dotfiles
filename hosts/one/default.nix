{ pkgs, ... }:

let 
  stateVersion = "20.09";
in
{
  home-manager.config = { pkgs, ... }:
  {
    imports = [
      ../../configs/nix.nix
      ../../configs/zsh.nix
      ../../configs/cli/min.nix
      ../../configs/cli/starship.nix
      ../../configs/cli/fzf.nix
      ../../configs/cli/direnv.nix
      ../../configs/git.nix

    ];
    home.stateVersion = stateVersion;

    home.file.".termux/colors.properties".text = ''
      background:     #282A36
      foreground:     #F8F8F2

      color0:         #000000
      color8:         #4D4D4D

      color1:         #FF5555
      color9:         #FF6E67

      color2:         #50FA7B
      color10:        #5AF78E

      color3:         #F1FA8C
      color11:        #F4F99D

      color4:         #BD93F9
      color12:        #CAA9FA

      color5:         #FF79C6
      color13:        #FF92D0

      color6:         #8BE9FD
      color14:        #9AEDFE

      color7:         #BFBFBF
      color15:        #E6E6E6
    '';
  };


  system.stateVersion = stateVersion;


  user.shell = "${pkgs.zsh}/bin/zsh";
}
