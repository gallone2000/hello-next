# Hello Next — Starter Template

This repository is a small **Next.js (App Router)** project intended to be used as a **starting point / template** for future projects.

It includes:
- Next.js App Router setup (`app/`)
- Docker setup for local development and production
- A `Makefile` with common commands

## Requirements

To run this project locally you only need:
- **Docker**
- **Docker Compose**
- **make** (optional but recommended)

No Node.js installation is required on your machine.

## Quick start

After cloning the repo:

```bash
git clone <REPO_URL>
cd hello-next
```

### Run in development (hot reload)

```bash
make dev-up
```

Open: http://localhost:3000

Stop:

```bash
make dev-down
```

### Run in production-like mode (Dockerfile build)

```bash
make prod-up
```

Open: http://localhost:3000

Stop:

```bash
make prod-down
```

## Useful commands

- View dev logs:
  ```bash
  make dev-logs
  ```

- Open a shell in the dev container:
  ```bash
  make dev-shell
  ```

- Stop everything (keeps volumes):
  ```bash
  make clean
  ```

- Full reset (removes volumes, including `node_modules`):
  ```bash
  make nuke
  ```

## Notes

- Dependencies are managed via `package.json` + `package-lock.json`.
- In dev, `node_modules` is stored in a Docker volume so you don’t need it on the host.
