{ ... }:
{
  fileSystems."/mnt/CloudDrive" = {
    device = "10.0.0.24:/mnt/user/CloudDrive";
    fsType = "nfs";
    options = [ "_netdev" "nofail" "x-systemd.automount" "soft" "timeo=50" "retrans=2" ];
  };

  fileSystems."/mnt/DockerStorage" = {
    device = "10.0.0.24:/mnt/user/DockerStorage";
    fsType = "nfs";
    options = [ "_netdev" "nofail" "x-systemd.automount" "soft" "timeo=50" "retrans=2" ];
  };
}
