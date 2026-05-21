# Architecture

This configuration is organized around explicit capabilities and requests. Every real setting has a single owner module, and modules that need something ask for it instead of configuring it directly.

## Principles

- Each setting has a single owner module.
- App modules install/configure only the app itself.
- Cross-module needs are expressed via `gb.requires.*` lists.
- Hosts contain only machine facts, hardware imports, storage, and host-specific overrides or selections.
- Aggregates import modules explicitly; no recursive auto-imports.

## Capability requests

Requests are lists of strings identifying the requester. A capability enables itself when its request list is non-empty.

Examples:

- `gb.requires.system.audio.pipewire = [ "profiles.system.workstation" ];`
- `gb.requires.home.git = [ "profiles.home.development" ];`

## Repository layout

- `modules/core`: typed options and request namespaces.
- `modules/profiles`: role-based defaults that request capabilities.
- `modules/capabilities`: single-owner modules for shared system/home features.
- `modules/programs`: app modules that only install/configure the app.
- `modules/desktop`: Mango and QuickShell integration.
- `hosts`: per-host facts, hardware imports, storage, and app selections.
- `users`: user metadata and Home Manager setup.
- `old`: legacy configuration retained during migration.
