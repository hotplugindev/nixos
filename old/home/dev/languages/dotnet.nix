{
  lib,
  config,
  pkgs,
  ...
}:
let
  dotnet = config.gb.home.dev.languages.dotnet;
  combinedDotnet = pkgs.dotnetCorePackages.combinePackages dotnet.sdks;
in
{
  options = {
    gb.home.dev.languages.dotnet.enable = lib.mkEnableOption "Enable .NET development tools";
    gb.home.dev.languages.dotnet.sdks = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ pkgs.dotnetCorePackages.sdk_9_0 ];
      description = "List of .NET SDKs to install";
    };
  };

  config = lib.mkIf dotnet.enable {
    home.packages = [
      combinedDotnet
    ];

    home.sessionVariables = {
      DOTNET_ROOT = "${combinedDotnet}/share/dotnet";
    };
  };
}
