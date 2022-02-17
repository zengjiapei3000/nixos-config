{ config, pkgs, ... }:

{
   networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.unmanaged = [
  #   "wlp3s0"
  # ];

   networking.interfaces =
    {
      wlp3s0 = {
        ipv4 = {
          addresses = [
            {
              address = "192.168.0.185";
              prefixLength = 24;
            }
          ];
        };
      };
    };

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp4s0f2.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
   networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.wifi.powersave = false;
  networking.networkmanager.extraConfig = 
    "rc-manager = none"
    ;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
