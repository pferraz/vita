# ── my-life-repo Makefile (Podman) ────────────────────────────────────────────
# Run from the repo root on your host machine
# Requires: brew install podman podman-compose

.PHONY: up up-detached down shell build rebuild logs init-crypt podman-start

# ── Podman machine ─────────────────────────────────────────────────────────────

# Start the Podman VM (run once after reboot if containers stop working)
podman-start:
	podman machine start
	$(eval PODMAN_SOCK := $(shell podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}'))
	export DOCKER_HOST="unix://$(PODMAN_SOCK)"
	@echo "✓ Podman machine running"

# ── Container commands ─────────────────────────────────────────────────────────

# Build the image
build:
	podman-compose -f docker/docker-compose.yml build

# Force a full rebuild (use after adding system packages to Dockerfile)
rebuild:
	podman-compose -f docker/docker-compose.yml build --no-cache

# Start container and drop into a shell (unlocks git-crypt automatically)
up:
	podman-compose -f docker/docker-compose.yml run --rm workspace

# Start detached (for running the dashboard web server in background)
up-detached:
	podman-compose -f docker/docker-compose.yml up -d

# Stop everything
down:
	podman-compose -f docker/docker-compose.yml down

# Open a shell in an already-running container
shell:
	podman exec -it my-life-repo bash

# Follow container logs
logs:
	podman-compose -f docker/docker-compose.yml logs -f

# ── First-time git-crypt setup ─────────────────────────────────────────────────
# Run ONCE on the machine where you initialize the repo

init-crypt:
	@echo "Initializing git-crypt..."
	git-crypt init
	git-crypt export-key ~/.git-crypt-key
	@echo ""
	@echo "✓ Key saved to ~/.git-crypt-key"
	@echo ""
	@echo "Add this to your ~/.zshrc:"
	@echo "  export GIT_CRYPT_KEY_B64=\$$(base64 < ~/.git-crypt-key)"
	@echo ""
	@echo "Then: source ~/.zshrc && make build && make up"