# NixOS Configuration

This repository contains a multi-host NixOS and Home Manager configuration using a strict request/capability architecture.

The goal is not just to split files into folders. The goal is to make ownership obvious:

- each real setting has one owner
- shared behavior is requested through capabilities
- hosts stay small and declarative
- programs do not secretly configure unrelated system behavior
- profiles describe intent, not low-level implementation
- the active configuration does not depend on the archived `old/` tree

The current hosts are:

| Host | Class | Desktop | Roles |
| --- | --- | --- | --- |
| `pc` | desktop | Mango | workstation, desktop, gaming, development |
| `laptop` | laptop | Mango | workstation, desktop, gaming, development |

The main user is:

| Username | Full name | Email |
| --- | --- | --- |
| `hotplugin` | Giona Berti | mail@gberti.com |

---

## Repository Layout

```text
.
├── flake.nix
├── flake.lock
├── hosts/
│   ├── default.nix
│   ├── pc/
│   │   ├── default.nix
│   │   ├── hardware.nix
│   │   ├── hardware-configuration.nix
│   │   ├── storage.nix
│   │   └── home.nix
│   └── laptop/
│       ├── default.nix
│       ├── hardware.nix
│       ├── hardware-configuration.nix
│       ├── storage.nix
│       └── home.nix
├── users/
│   ├── default.nix
│   └── hotplugin.nix
├── modules/
│   ├── aggregate/
│   ├── core/
│   ├── profiles/
│   ├── capabilities/
│   ├── programs/
│   └── desktop/
├── docs/
│   └── audit/
└── old/
```

The `old/` directory is only a migration archive. It must not be imported by active configuration. Once the new configuration builds correctly and no active file references `old/`, it can be removed.

---

## Architecture Overview

The configuration is built around five concepts:

```text
facts -> profiles -> requests -> capabilities -> implementation
```

The important rule is:

> Program modules do not configure shared platform behavior directly. They request capabilities. Capability modules provide that behavior once.

For example:

- Codex may request Git and shell support.
- Wine may request Windows fonts, runtime libraries, and locale support.
- The desktop profile may request XDG, theme, terminal, fonts, audio, and Polkit.
- The capability modules actually implement Git, Zsh, fonts, PipeWire, NetworkManager, and other shared systems.

---

## Flake

The root `flake.nix` defines inputs and builds the configured hosts.

Important inputs include:

- `nixpkgs`
- `nixpkgs-unstable`
- `nixos-hardware`
- `home-manager`
- `mango`
- `dms`
- `lanzaboote`
- `nixvim`
- `stylix`

The flake builds:

```text
nixosConfigurations.pc
nixosConfigurations.laptop
```

It wires Home Manager into each NixOS system and imports:

```text
modules/aggregate/nixos.nix
modules/aggregate/home.nix
```

The aggregate files are the explicit module import graph.

---

## Hosts

Hosts are declared in:

```text
hosts/default.nix
```

Each host has:

- a system architecture
- typed host metadata
- a NixOS host module
- a Home Manager host module
- optional extra modules

Example host metadata:

```nix
{
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
}
```

Host metadata should describe the machine. It should not implement services directly.

Good:

```nix
class = "laptop";
desktop = "mango";
hardware.hasTouchpad = true;
```

Bad:

```nix
services.pipewire.enable = true;
programs.git.enable = true;
fonts.packages = [ ... ];
```

---

## Host Files

Each host has a system file and a Home Manager file.

```text
hosts/pc/default.nix
hosts/pc/home.nix
hosts/laptop/default.nix
hosts/laptop/home.nix
```

### System Host Files

System host files are for machine-specific system details:

- hardware imports
- storage imports
- hostname
- host-specific firewall ports
- Wake-on-LAN
- host-specific service choices
- host-specific hardware requests
- host-specific program selections

Examples:

```nix
networking.hostName = config.gb.host.name;
gb.programs.steam.enable = true;
gb.programs.wine.enable = true;
gb.programs.sunshine.enable = true;
```

System host files should not contain reusable implementation that belongs in modules.

### Home Host Files

Home host files are for machine-specific user choices:

- host-specific apps
- host-specific editor/language choices
- Mango monitor layout
- Mango touchpad/session settings
- terminal font size overrides

Example:

```nix
{
  gb.home.programs.ai.codex.enable = true;
  gb.home.programs.remote.tigervnc.enable = true;
  gb.home.programs.remote.moonlight-qt.enable = true;

  gb.home.desktop.mango.monitors = [
    "name:eDP-1,width:2256,height:1504,refresh:60,x:0,y:10,scale:1.333,vrr:0,rr:0"
  ];

  gb.home.desktop.mango.settings.values = {
    trackpad_natural_scrolling = 1;
    tap_to_click = 1;
    disable_while_typing = 1;
  };
}
```

---

## Users

Users are declared in:

```text
users/default.nix
```

The main user is currently `hotplugin`.

User information is exposed through `gb.user`, for example:

```nix
config.gb.user.username
config.gb.user.fullName
config.gb.user.email
```

This allows modules like Git to use the correct user identity without hardcoding it in multiple places.

---

## Core Modules

Core modules define the configuration framework.

```text
modules/core/
├── host/
├── user/
├── requests/
└── debug/
```

Core modules should not install apps or configure desktop behavior. They define typed options and shared namespaces.

### Host Options

Host options live in:

```text
modules/core/host/options.nix
```

They define the shape of `gb.host`.

Expected host metadata includes:

```text
gb.host.name
gb.host.system
gb.host.class
gb.host.roles
gb.host.desktop
gb.host.shell
gb.host.hardware.cpu
gb.host.hardware.gpu
gb.host.hardware.hasBattery
gb.host.hardware.hasBluetooth
gb.host.hardware.hasTouchpad
gb.host.hardware.hasPrinter
```

These options should use strict types and enums where possible. Invalid host metadata should fail early.

### User Options

User options live in:

```text
modules/core/user/options.nix
```

They define:

```text
gb.user.username
gb.user.fullName
gb.user.email
```

### Request Options

Request options live in:

```text
modules/core/requests/system.nix
modules/core/requests/home.nix
```

Requests are lists of strings. The strings identify who requested a capability.

Example:

```nix
gb.requires.home.git = [ "profile.home.development" ];
```

This means:

```text
The Home development profile needs Git.
```

It does not configure Git directly.

Another example:

```nix
gb.requires.system.fonts.windows = [ "programs.system.wine" ];
```

This means:

```text
Wine needs Windows-compatible fonts.
```

The actual font configuration belongs to the font capability.

---

## Profiles

Profiles describe intent.

They live in:

```text
modules/profiles/system/
modules/profiles/home/
```

Examples:

```text
workstation
desktop
laptop
gaming
development
```

Profiles are allowed to enable multiple defaults or request capabilities.

### System Profiles

A system workstation profile may request:

- NetworkManager
- PipeWire
- core fonts
- emoji fonts
- Polkit

A laptop profile may request:

- touchpad support
- firmware updates
- power profile support

A gaming profile may enable:

- Steam
- GameMode

### Home Profiles

A Home development profile may request:

- Git
- shell support

A Home desktop profile may request:

- terminal
- theme
- XDG integration
- Mango home integration
- QuickShell/DMS integration

Profiles should not own low-level implementation details. They should express what a machine is meant to be.

---

## Requests

Requests are the dependency graph of this configuration.

A module that needs shared functionality should request it instead of configuring it directly.

Good:

```nix
gb.requires.home.git = [ "programs.home.ai.codex" ];
```

Bad:

```nix
programs.git.enable = true;
```

Good:

```nix
gb.requires.system.fonts.windows = [ "programs.system.wine" ];
```

Bad:

```nix
fonts.packages = [
  pkgs.corefonts
  pkgs.liberation_ttf
];
```

The request lists are intentionally lists of strings instead of booleans. This makes debugging easier because it shows who requested a capability.

Example evaluated request list:

```json
{
  "git": [
    "profile.home.development",
    "programs.home.ai.codex"
  ]
}
```

That means Git was enabled because both the development profile and Codex requested it.

---

## Capabilities

Capabilities provide shared platform behavior.

They live in:

```text
modules/capabilities/system/
modules/capabilities/home/
```

A capability owns one real domain.

Examples:

| Capability | Owns |
| --- | --- |
| `modules/capabilities/home/git/default.nix` | `programs.git` |
| `modules/capabilities/home/shell/default.nix` | `programs.zsh` |
| `modules/capabilities/home/terminal/foot.nix` | Foot terminal configuration |
| `modules/capabilities/home/theme/default.nix` | Home theme integration |
| `modules/capabilities/home/xdg/default.nix` | Home XDG integration |
| `modules/capabilities/system/audio/pipewire.nix` | `services.pipewire` and `security.rtkit` |
| `modules/capabilities/system/fonts/core.nix` | core system fonts |
| `modules/capabilities/system/fonts/windows.nix` | Windows/Wine fonts |
| `modules/capabilities/system/networking/networkmanager.nix` | NetworkManager |
| `modules/capabilities/system/networking/openssh.nix` | OpenSSH |
| `modules/capabilities/system/compat/wine-libraries.nix` | Wine runtime libraries |
| `modules/capabilities/system/locale/glibc.nix` | glibc locale support |
| `modules/capabilities/system/virtualisation/libvirt.nix` | libvirt |
| `modules/capabilities/system/virtualisation/docker.nix` | Docker |

A capability usually activates when it is explicitly enabled or when its request list is non-empty.

Example:

```nix
{ lib, config, ... }:

let
  requests = config.gb.requires.home.git;
in
{
  config = lib.mkIf (requests != [ ]) {
    programs.git.enable = true;
  };
}
```

This allows many modules to depend on Git without many modules configuring Git.

---

## Programs

Program modules configure applications.

They live in:

```text
modules/programs/system/
modules/programs/home/
```

System programs include things like:

```text
modules/programs/system/steam.nix
modules/programs/system/wine.nix
modules/programs/system/sunshine.nix
```

Home programs include things like:

```text
modules/programs/home/ai/codex.nix
modules/programs/home/gaming/bottles.nix
modules/programs/home/gaming/ckan.nix
modules/programs/home/multimedia/spotify.nix
modules/programs/home/remote/moonlight-qt.nix
modules/programs/home/remote/tigervnc.nix
```

Program modules should configure only the application itself.

### Simple App Example

Spotify is a simple app module:

```nix
{ lib, config, pkgs, ... }:

let
  cfg = config.gb.home.programs.multimedia.spotify;
in
{
  options.gb.home.programs.multimedia.spotify.enable =
    lib.mkEnableOption "Spotify";

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.spotify
    ];
  };
}
```

Spotify installs Spotify. It does not configure audio, fonts, portals, Git, shell, or desktop integration.

### App With Requests Example

Codex may need Git and shell integration.

```nix
{ lib, config, pkgs-unstable, ... }:

let
  cfg = config.gb.home.programs.ai.codex;
in
{
  options.gb.home.programs.ai.codex.enable =
    lib.mkEnableOption "Codex CLI";

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs-unstable.codex
    ];

    gb.requires.home.git = [ "programs.home.ai.codex" ];
    gb.requires.home.shell = [ "programs.home.ai.codex" ];
  };
}
```

Codex installs Codex. Git and shell are provided by capabilities.

### Wine Example

Wine is intentionally split.

The Wine program module owns:

- Wine package
- Winetricks

It does not own:

- runtime libraries
- Windows fonts
- locale support

Instead it requests them:

```nix
gb.requires.system.compat.wineLibraries = [ "programs.system.wine" ];
gb.requires.system.fonts.windows = [ "programs.system.wine" ];
gb.requires.system.locale.glibc = [ "programs.system.wine" ];
```

Then the relevant capabilities provide the implementation.

---

## Desktop

The active desktop stack is Mango.

Desktop modules live under:

```text
modules/desktop/
```

Important areas:

```text
modules/desktop/mango/
modules/desktop/quickshell/
```

### Mango

Mango is split into system and home layers:

```text
modules/desktop/mango/system/default.nix
modules/desktop/mango/home/default.nix
```

The system module owns system/session-level Mango behavior.

The home module owns user-level Mango configuration, including:

- MangoWC config
- monitor declarations
- settings values
- Mango-related user configuration

Host-specific monitor values stay in host Home Manager files.

Example:

```nix
gb.home.desktop.mango.monitors = [
  "name:eDP-1,width:2256,height:1504,refresh:60,x:0,y:10,scale:1.333,vrr:0,rr:0"
];
```

### QuickShell / Dank Material Shell

QuickShell and Dank Material Shell integration lives under:

```text
modules/desktop/quickshell/
```

This keeps shell UI integration separate from Mango itself.

A host or profile should be able to select a profile such as:

```nix
gb.home.desktop.quickshell.profile = "dms";
```

The QuickShell module handles the implementation.

---

## Aggregate Modules

Aggregate modules are the explicit import lists.

```text
modules/aggregate/nixos.nix
modules/aggregate/home.nix
```

They import:

- core options
- request namespaces
- profiles
- capabilities
- program modules
- desktop modules

This repository intentionally avoids hidden recursive auto-import magic. If a module exists but is not imported by an aggregate, it probably does nothing.

When adding a new module, always add it to the correct aggregate file.

---

## How Activation Works

Example: the laptop.

### 1. Host Facts

`hosts/default.nix` says the laptop is:

```nix
{
  class = "laptop";
  roles = [ "workstation" "desktop" "gaming" "development" ];
  desktop = "mango";
  shell = "zsh";

  hardware = {
    cpu = "intel";
    gpu = "intel";
    hasBattery = true;
    hasTouchpad = true;
  };
}
```

### 2. Profiles React

The workstation profile requests:

- NetworkManager
- PipeWire
- core fonts
- emoji fonts
- Polkit

The laptop profile requests:

- touchpad support
- firmware/power behavior

The gaming profile enables:

- Steam

The development profile requests:

- Git
- shell support

### 3. Capabilities React

The request lists become non-empty.

So capabilities activate:

- NetworkManager configures networking
- PipeWire configures audio
- font capabilities install fonts
- Git configures `programs.git`
- shell configures `programs.zsh`
- touchpad configures `services.libinput`

### 4. Program Modules React

Host files enable programs like:

```nix
gb.home.programs.ai.codex.enable = true;
gb.home.programs.remote.tigervnc.enable = true;
gb.home.programs.remote.moonlight-qt.enable = true;
```

Those modules install their apps and request capabilities when needed.

### 5. Host Overrides Apply

Host-specific values like monitor layout are applied:

```nix
gb.home.desktop.mango.monitors = [
  "name:eDP-1,width:2256,height:1504,refresh:60,x:0,y:10,scale:1.333,vrr:0,rr:0"
];
```

The Mango home module consumes those values and writes the final config.

---

## Adding a New App

Example: adding Vesktop.

1. Create a module:

```text
modules/programs/home/communication/vesktop.nix
```

2. Add:

```nix
{ lib, config, pkgs, ... }:

let
  cfg = config.gb.home.programs.communication.vesktop;
in
{
  options.gb.home.programs.communication.vesktop.enable =
    lib.mkEnableOption "Vesktop";

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.vesktop
    ];
  };
}
```

3. Import it in the relevant aggregate or category module.

4. Enable it in a host:

```nix
gb.home.programs.communication.vesktop.enable = true;
```

Do not configure unrelated capabilities in the app module.

---

## Adding a New Capability

Example: adding a Docker capability.

1. Add a request option in `modules/core/requests/system.nix`:

```nix
gb.requires.system.virtualisation.docker
```

2. Create:

```text
modules/capabilities/system/virtualisation/docker.nix
```

3. Implement:

```nix
{ lib, config, ... }:

let
  requests = config.gb.requires.system.virtualisation.docker;
in
{
  config = lib.mkIf (requests != [ ]) {
    virtualisation.docker.enable = true;
  };
}
```

4. Import the capability in:

```text
modules/aggregate/nixos.nix
```

5. Request it from a profile, host, or program:

```nix
gb.requires.system.virtualisation.docker = [ "profile.system.development" ];
```

---

## Adding a New Host

1. Add metadata in:

```text
hosts/default.nix
```

Example:

```nix
newhost = {
  system = "x86_64-linux";

  metadata = {
    class = "desktop";
    roles = [ "workstation" "desktop" ];
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
  };

  nixosModule = ./newhost;
  homeModule = ./newhost/home.nix;
  extraModules = [ ];
};
```

2. Create:

```text
hosts/newhost/default.nix
hosts/newhost/home.nix
hosts/newhost/hardware.nix
hosts/newhost/hardware-configuration.nix
hosts/newhost/storage.nix
```

3. Add host-specific system behavior in:

```text
hosts/newhost/default.nix
```

4. Add host-specific Home Manager behavior in:

```text
hosts/newhost/home.nix
```

5. Test the new host:

```bash
nix build .#nixosConfigurations.newhost.config.system.build.toplevel --show-trace
```

---

## Testing

Format the repository:

```bash
nix fmt
```

If no formatter is configured:

```bash
nix run nixpkgs#nixfmt-rfc-style -- .
```

Check the flake:

```bash
nix flake check --show-trace
```

Build both systems:

```bash
nix build .#nixosConfigurations.pc.config.system.build.toplevel --show-trace
nix build .#nixosConfigurations.laptop.config.system.build.toplevel --show-trace
```

Build Home Manager activation packages:

```bash
nix build .#nixosConfigurations.pc.config.home-manager.users.hotplugin.activationPackage --show-trace
nix build .#nixosConfigurations.laptop.config.home-manager.users.hotplugin.activationPackage --show-trace
```

Test the current host:

```bash
sudo nixos-rebuild test --flake .#$(hostname) --show-trace
```

Switch the current host:

```bash
sudo nixos-rebuild switch --flake .#$(hostname) --show-trace
```

If `$(hostname)` is not exactly `pc` or `laptop`, use the explicit flake target:

```bash
sudo nixos-rebuild test --flake .#pc --show-trace
sudo nixos-rebuild test --flake .#laptop --show-trace
```

---

## Debugging Ownership

Use these commands to find duplicate ownership:

```bash
grep -R "programs.git" -n . --exclude-dir=.git --exclude-dir=old
grep -R "programs.zsh" -n . --exclude-dir=.git --exclude-dir=old
grep -R "fonts.packages" -n . --exclude-dir=.git --exclude-dir=old
grep -R "services.pipewire" -n . --exclude-dir=.git --exclude-dir=old
grep -R "programs.steam" -n . --exclude-dir=.git --exclude-dir=old
grep -R "services.openssh" -n . --exclude-dir=.git --exclude-dir=old
```

Expected ownership:

| Setting | Expected owner |
| --- | --- |
| `programs.git` | `modules/capabilities/home/git/default.nix` |
| `programs.zsh` | `modules/capabilities/home/shell/default.nix` |
| `fonts.packages` | `modules/capabilities/system/fonts/*` |
| `services.pipewire` | `modules/capabilities/system/audio/pipewire.nix` |
| `programs.steam` | `modules/programs/system/steam.nix` |
| `services.openssh` | `modules/capabilities/system/networking/openssh.nix` |

If one of these appears in random program, profile, or host files, the architecture is being violated.

---

## Debugging Requests

Inspect evaluated system requests:

```bash
nix eval .#nixosConfigurations.pc.config.gb.requires.system --json
nix eval .#nixosConfigurations.laptop.config.gb.requires.system --json
```

Inspect evaluated Home Manager requests:

```bash
nix eval .#nixosConfigurations.pc.config.home-manager.users.hotplugin.gb.requires.home --json
nix eval .#nixosConfigurations.laptop.config.home-manager.users.hotplugin.gb.requires.home --json
```

Inspect host metadata:

```bash
nix eval .#nixosConfigurations.pc.config.gb.host --json
nix eval .#nixosConfigurations.laptop.config.gb.host --json
```

These commands help answer:

- why was Git enabled?
- why was PipeWire enabled?
- does Wine request the correct runtime support?
- does the laptop request touchpad support?
- does the desktop profile request terminal/theme/XDG integration?

---

## Removing `old/`

`old/` is a migration archive only.

Before deleting it, verify no active file imports it:

```bash
grep -R "old/" -n . \
  --exclude-dir=.git \
  --exclude-dir=old
```

Then verify both systems build:

```bash
nix flake check --show-trace
nix build .#nixosConfigurations.pc.config.system.build.toplevel --show-trace
nix build .#nixosConfigurations.laptop.config.system.build.toplevel --show-trace
nix build .#nixosConfigurations.pc.config.home-manager.users.hotplugin.activationPackage --show-trace
nix build .#nixosConfigurations.laptop.config.home-manager.users.hotplugin.activationPackage --show-trace
```

If all checks pass:

```bash
git rm -r old
git commit -m "Remove archived old configuration"
git push
```

Do not delete `old/` if any active module still imports it.

---

## Maintenance Rules

1. One real setting has one owner.
2. Program modules configure only their program.
3. Shared behavior goes through request/capability modules.
4. Profiles express intent.
5. Hosts contain machine-specific facts and overrides.
6. Aggregate imports stay explicit.
7. `old/` must not be active configuration.
8. If multiple hosts need the same behavior, move it out of host files.
9. If multiple programs need the same dependency, make or use a capability.
10. Always test both hosts before switching.

---

## Common Commands

Update inputs:

```bash
nix flake update
```

Format:

```bash
nix fmt
```

Check:

```bash
nix flake check --show-trace
```

Build PC:

```bash
nix build .#nixosConfigurations.pc.config.system.build.toplevel --show-trace
```

Build laptop:

```bash
nix build .#nixosConfigurations.laptop.config.system.build.toplevel --show-trace
```

Build Home Manager activation packages:

```bash
nix build .#nixosConfigurations.pc.config.home-manager.users.hotplugin.activationPackage --show-trace
nix build .#nixosConfigurations.laptop.config.home-manager.users.hotplugin.activationPackage --show-trace
```

Test current host:

```bash
sudo nixos-rebuild test --flake .#$(hostname) --show-trace
```

Switch current host:

```bash
sudo nixos-rebuild switch --flake .#$(hostname) --show-trace
```

Commit and push:

```bash
git add .
git commit -m "Describe change"
git push
```

---

## Design Philosophy

This repository is built to avoid hidden behavior.

A bad module does this:

```nix
{
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.some-app ];
    programs.git.enable = true;
    programs.zsh.enable = true;
    fonts.packages = [ pkgs.noto-fonts ];
  };
}
```

A good module does this:

```nix
{
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.some-app ];

    gb.requires.home.git = [ "programs.home.some-app" ];
    gb.requires.home.shell = [ "programs.home.some-app" ];
    gb.requires.system.fonts.core = [ "programs.home.some-app" ];
  };
}
```

The implementation stays in the capability modules.

That is the core rule of this configuration.