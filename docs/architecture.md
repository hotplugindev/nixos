# Configuration Architecture Guide

This repository uses a **request/capability ownership model** for both system and home configuration.

The goal is predictable behavior:

- every setting has exactly one owner
- shared behavior is enabled through explicit requests
- hosts and users stay declarative and small
- architecture decisions are visible from the folder structure

---

## 1) Core design rules

### Single-owner rule
Any setting must be defined by one authoritative module.  
No duplicate ownership across profiles, programs, hosts, or desktop layers.

### Request over direct coupling
Modules that need shared behavior do not configure that behavior directly.  
They request it through request namespaces, and the owning capability applies it.

### Clear responsibility boundaries
- **Profiles** decide intent (what kind of machine/session this is).
- **Capabilities** provide shared platform features.
- **Programs** configure only the program itself.
- **Hosts** hold machine facts and host-specific selections.
- **Users** hold identity metadata and user-home entry wiring.

### Explicit composition
Top-level aggregates import modules intentionally.  
No hidden recursive auto-discovery.

---

## 2) Layer model

### `modules/core`
Defines foundational typed options and request namespaces.  
This is the contract layer used by the rest of the repository.

### `modules/profiles`
Expresses role-based defaults and policy.  
Profiles request capabilities instead of taking ownership of shared settings.

### `modules/capabilities`
Implements shared system/home features.  
A capability is the single owner of its setting domain and activates when requested.

### `modules/programs`
Contains application-specific modules.  
These modules should never become owners of unrelated platform concerns.

### `modules/desktop`
Contains desktop-stack composition and desktop-specific integration.

### `hosts`
Contains per-machine data and host-specific overrides:
- machine metadata/facts
- hardware/storage declarations
- host-level selections

### `users`
Contains user identity metadata and home entry wiring.

### `old`
Archive/reference only.  
It is retained for migration history, not active configuration ownership.

---

## 3) Request/capability flow

1. A profile, program, or host expresses need through a request key.
2. The capability module for that key checks if requests exist.
3. The capability applies the shared configuration it owns.
4. Any module can read outcomes, but ownership remains in the capability.

This keeps cross-cutting behavior centralized while still allowing distributed intent.

---

## 4) How to add things

### Add a new shared feature
1. Define or extend a request key in core requests.
2. Add one capability module as the sole owner of the feature.
3. Import the capability in the appropriate aggregate.
4. Request it from relevant profiles/hosts/program modules.
5. Ensure no other module writes the same settings.

### Add a new profile
1. Create profile module under the profile layer.
2. Encode role intent (request capabilities, set profile-local policy).
3. Keep it independent of host-specific hardware details.
4. Wire/import it through the aggregate layer.

### Add a new program module
1. Create module in the program layer.
2. Keep scope limited to program options/packages/config.
3. If it needs shared platform behavior, request a capability.
4. Avoid direct ownership of cross-cutting system/home settings.

### Add a new host
1. Add host metadata and host module files.
2. Keep host files focused on machine facts and host overrides.
3. Reuse profiles/capabilities for shared behavior.
4. Keep hardware/storage local to the host directory.

### Add a new user
1. Add user metadata in the users layer.
2. Attach a user home entry module.
3. Keep user identity separate from host policy.

---

## 5) How to remove things

### Remove a capability
1. Remove requests to the capability.
2. Remove capability import from aggregate.
3. Remove the capability module.
4. Verify no module still depends on its outputs/options.

### Remove a profile or program
1. Remove imports/wiring first.
2. Remove all remaining requests or references.
3. Delete module files after dependency cleanup.

### Remove host/user
1. Remove its registration from top-level wiring.
2. Remove host/user-specific files.
3. Ensure no remaining references in profiles/programs/capabilities.

---

## 6) How to change things safely

### Change ownership
If a setting must move, do it as a transfer:
1. identify current owner
2. move ownership to one new module
3. remove old owner writes
4. keep callers as requesters only

Never leave overlapping ownership during final state.

### Change behavior
Prefer changing:
- profile intent (policy), or
- capability implementation (shared behavior), or
- program module (app-local behavior)

Choose the layer by responsibility, not convenience.

### Change host behavior
Use host files only for machine-local facts/overrides.  
If multiple hosts need it, move to profile/capability.

---

## 7) Anti-patterns to avoid

- same setting written by multiple modules
- program modules owning shared platform behavior
- host files becoming policy bundles
- profiles directly implementing capability internals
- importing archived `old/` config into active paths

---

## 8) Review checklist for PRs

- Is ownership of each changed setting unambiguous?
- Are shared concerns requested through capabilities?
- Is layer responsibility preserved?
- Are host/user files still minimal and declarative?
- Is `old/` kept archive-only?
- Is the aggregate import graph explicit and coherent?

If all answers are yes, the change is aligned with the architecture.
