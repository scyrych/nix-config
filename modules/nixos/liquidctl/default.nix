{ pkgs, ...}:
{
  services.udev.packages = [
    (pkgs.writeTextFile {
      name = "liquidctl_udev";
      text = builtins.readFile ./71-liquidctl.rules;
      destination = "/etc/udev/rules.d/71-liquidctl.rules";
    })
    (pkgs.writeTextFile {
      name = "liquidctl_udev_hwd";
      text = builtins.readFile ./99-liquidctl-custom.rules;
      destination = "/etc/udev/rules.d/99-liquidctl-custom.rules";
    })
  ];
  
  systemd.services = {
    liquidctl = {
      enable = true;
      description = "AIO startup service";
      requires = [ "dev-kraken.device" ];
      after = [ "dev-kraken.device" ];
      serviceConfig = { 
        Type = "oneshot";
	ExecStart = [ 
	 "${pkgs.liquidctl}/bin/liquidctl initialize all"
	 "${pkgs.liquidctl}/bin/liquidctl --match kraken set pump speed 30 70 34 80 40 90 50 100"
	 "${pkgs.liquidctl}/bin/liquidctl --match kraken set ring color spectrum-wave"
	 "${pkgs.liquidctl}/bin/liquidctl --match kraken set logo color fixed 006400"
	];
      };
      wantedBy = ["default.target"];
    };
  };
}
