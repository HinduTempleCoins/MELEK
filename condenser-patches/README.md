# condenser-patches

Ready-to-apply MELEK branding for the melek-condenser fork.

## Contents

```
condenser-patches/
  apply-melek-branding.sh          — run this from root of melek-condenser
  src/app/assets/images/
    logo.svg                       — Kurdish flag 300×200, full size
    logo-small.svg                 — Kurdish flag 64×43, nav bar
  config/
    melek-overlay.json             — reference config values for MELEK chain
```

## How to Use

1. Fork `Blurt-Blockchain/condenser` → `hindutemplecoins/melek-condenser` on GitHub
2. Clone the fork locally (or on Oracle Cloud)
3. Copy this `condenser-patches/` directory into the root of the clone
4. Run:

```bash
bash condenser-patches/apply-melek-branding.sh
```

5. Add `favicon.ico` to `src/app/assets/images/` (can generate from logo.svg)
6. `npm install && npm run build`
7. Update Oracle node IP in `config/default.json`
8. Push to origin

## Chain Config Reference

| Key | Value |
|---|---|
| Token symbol | MELEK |
| Address prefix | MELEK |
| Default RPC | wss://rpc.melek.salon |
| Block interval | 4 seconds |
| Chain ID | sha256("melek") |
