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

## Repository layout

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