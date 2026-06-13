{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        #Enable = "Source,Sink,Media,Socket";
        Experimental = true;
        KernelExperimental = true;
      };
    };
  };

  services.blueman.enable = true;
}
