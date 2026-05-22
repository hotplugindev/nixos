{ lib, host ? {}, hostName ? null, ... }:
let
  hostMeta = host;
  hardwareMeta = hostMeta.hardware or { };
  defaultStr = value: if value == null then "" else value;
  defaultList = value: if value == null then [ ] else value;
  defaultBool = value: if value == null then false else value;
  defaultEnum = value: if value == null then "none" else value;
  defaultClass = value: if value == null then "desktop" else value;
  defaultCpu = value: if value == null then "generic" else value;
  defaultGpu = value: if value == null then "none" else value;
  defaultShell = value: if value == null then "none" else value;
  nameValue = if hostName != null then hostName else (hostMeta.name or "");
  systemValue = hostMeta.system or "";
  classValue = defaultClass (hostMeta.class or null);
  rolesValue = defaultList (hostMeta.roles or null);
  desktopValue = defaultEnum (hostMeta.desktop or null);
  shellValue = defaultShell (hostMeta.shell or null);
  cpuValue = defaultCpu (hardwareMeta.cpu or null);
  gpuValue = defaultGpu (hardwareMeta.gpu or null);
  hasBatteryValue = defaultBool (hardwareMeta.hasBattery or null);
  hasBluetoothValue = defaultBool (hardwareMeta.hasBluetooth or null);
  hasTouchpadValue = defaultBool (hardwareMeta.hasTouchpad or null);
  hasPrinterValue = defaultBool (hardwareMeta.hasPrinter or null);
in
{
  options.gb.host = {
    name = lib.mkOption {
      type = lib.types.str;
      default = defaultStr nameValue;
      description = "Host name";
    };
    system = lib.mkOption {
      type = lib.types.str;
      default = defaultStr systemValue;
      description = "Host system";
    };
    class = lib.mkOption {
      type = lib.types.enum [ "desktop" "laptop" "server" "vm" ];
      default = classValue;
      description = "Host class";
    };
    roles = lib.mkOption {
      type = lib.types.listOf (lib.types.enum [ "workstation" "desktop" "gaming" "development" "server" "minimal" ]);
      default = rolesValue;
      description = "Host roles";
    };
    desktop = lib.mkOption {
      type = lib.types.enum [ "mango" "hyprland" "gnome" "none" ];
      default = desktopValue;
      description = "Desktop stack";
    };
    shell = lib.mkOption {
      type = lib.types.enum [ "zsh" "bash" "fish" "none" ];
      default = shellValue;
      description = "User shell";
    };
    hardware = {
      cpu = lib.mkOption {
        type = lib.types.enum [ "amd" "intel" "generic" ];
        default = cpuValue;
        description = "CPU vendor";
      };
      gpu = lib.mkOption {
        type = lib.types.enum [ "amd" "intel" "nvidia" "virtio" "none" ];
        default = gpuValue;
        description = "GPU vendor";
      };
      hasBattery = lib.mkOption {
        type = lib.types.bool;
        default = hasBatteryValue;
        description = "Host has battery";
      };
      hasBluetooth = lib.mkOption {
        type = lib.types.bool;
        default = hasBluetoothValue;
        description = "Host has bluetooth";
      };
      hasTouchpad = lib.mkOption {
        type = lib.types.bool;
        default = hasTouchpadValue;
        description = "Host has touchpad";
      };
      hasPrinter = lib.mkOption {
        type = lib.types.bool;
        default = hasPrinterValue;
        description = "Host has printer";
      };
    };
  };
}
