{ config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerdfonts
    hermit
    fira-code
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    corefonts
    ubuntu_font_family
    powerline-fonts
    font-awesome
    source-code-pro
    hack-font
  ];
  }
  
