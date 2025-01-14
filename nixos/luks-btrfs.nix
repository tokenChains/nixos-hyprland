{
    disko.devices = {
      disk = {
        nvme0n1 = {
          type = "disk";
          device = "/dev/nvme0n1";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "512M";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [
                    "defaults"
                  ];
                };
              };
              luks = {
                size = "100%";
                content = {
                  type = "luks";
                  name = "crypted-root";
                  # passwordFile = "/tmp/secret.key"; 
                  settings = {
                    allowDiscards = true;
                  };
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = [ "compress=zstd" "space_cache=v2" "noatime" ];
                    };
                    "/home" = {
                      mountpoint = "/home";
                      mountOptions = [ "compress=zstd" "space_cache=v2" "noatime" ];
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "compress=zstd" "space_cache=v2" "noatime" ];
                    };
                    "/swap" = {
                      mountpoint = "/.swapvol";
                      swap.swapfile.size = "16G";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
