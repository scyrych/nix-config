{ config, ... }:

{
  hardware= { 
    opengl = {
     enable = true;
     driSupport = true;
     driSupport32Bit = true;
    };
    pulseaudio.enable = false;
    nvidia= {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
       nvidiaBusId = "PCI:1:0:0";
       amdgpuBusId = "PCI:0:1:0";
      };
    };
  };
}
