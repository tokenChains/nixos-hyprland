{
    disko.devices = {
      disk = {
        vdb = {
          type = "disk";
          device = "/dev/vda";
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
                  passwordFile = "/tmp/secret.key"; 
                  settings = {
                    allowDiscards = true;
                  };
                content = {
                  type = "btrfs";
                  mountpoint = "/";
                  mountOptions = ["noatime"];
                  subvolumes = {
                    "/home" = {};
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