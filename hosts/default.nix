{ inputs }:
{
  pc = {
    hostType = "desktop";
    hostModule = ./pc;
    extraModules = [
      inputs.lanzaboote.nixosModules.lanzaboote
    ];
  };

  laptop = {
    hostType = "laptop";
    hostModule = ./laptop;
    extraModules = [
      inputs.nixos-hardware.nixosModules.framework-13th-gen-intel
    ];
  };
}
