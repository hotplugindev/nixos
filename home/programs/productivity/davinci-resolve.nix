{
  lib,
  config,
  pkgs,
  ...
}:
let
  davinci-resolve = config.gb.home.programs.productivity.davinci-resolve;
in
{
  options = {
    gb.home.programs.productivity.davinci-resolve.enable = lib.mkEnableOption "Enables davinci-resolve";
  };

  config = lib.mkIf davinci-resolve.enable {
    home.packages = [
      pkgs.davinci-resolve
    ];

    home.sessionVariables = {
      RUSTICL_ENABLE = "radeonsi";
      OCL_ICD_VENDORS = "${pkgs.mesa.opencl}/etc/OpenCL/vendors";
    };
  };
}
