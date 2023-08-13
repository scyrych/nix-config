{ config, ... }:

{
  hardware= { 
    opengl = {
     enable = true;
     driSupport = true;
     driSupport32Bit = true;
    };
    pulseaudio = { 
      enable = true;
      daemon.config = {
        default-sample-format = "float32le";
        default-sample-rate = "48000";
        alternate-sample-rate = "44100";
        default-sample-channels = "2";
        default-channel-map = "front-left,front-right";
        resample-method = "soxr-vhq";
	remixing-produce-lfe = "no";
	remixing-consume-lfe = "no";
        high-priority = "yes";
        nice-level = "-11";
        realtime-scheduling = "yes";
        realtime-priority = "9";
        rlimit-rtprio = "9";
        daemonize = "no";
      };
    };
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
