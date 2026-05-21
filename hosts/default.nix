{ inputs }:
{
  pc = {
    system = "x86_64-linux";
    class = "desktop";
    roles = [ "workstation" "desktop" "gaming" "development" ];
    desktop = "mango";
    shell = "zsh";
    hardware = {
      cpu = "amd";
      gpu = "amd";
      hasBattery = false;
      hasBluetooth = true;
      hasTouchpad = false;
      hasPrinter = false;
    };
    extraModules = [ ];
  };

  laptop = {
    system = "x86_64-linux";
    class = "laptop";
    roles = [ "workstation" "desktop" "gaming" "development" ];
    desktop = "mango";
    shell = "zsh";
    hardware = {
      cpu = "intel";
      gpu = "intel";
      hasBattery = true;
      hasBluetooth = true;
      hasTouchpad = true;
      hasPrinter = false;
    };
    extraModules = [
      inputs.nixos-hardware.nixosModules.framework-13th-gen-intel
    ];
  };
}
