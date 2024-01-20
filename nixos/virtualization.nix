{ config, pkgs, ... }:
{
    virtualisation.libvirtd = {
    enable = true;
    qemu = {
      ovmf.enable = true;
      runAsRoot = false;
    };
    onBoot = "ignore";
    onShutdown = "shutdown";
  };
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    enableNvidia = true;
    enableOnBoot = true;
  };
  systemd.enableUnifiedCgroupHierarchy = false;
  programs.virt-manager.enable = true;
}