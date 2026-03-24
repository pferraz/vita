FROM python:3.12-slim

LABEL maintainer="my-life-repo"
LABEL description="Personal & Work knowledge base container"

# ── System packages ────────────────────────────────────────────────────────────
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    git-crypt \
    curl \
    gnupg \
    jq \
    make \
    tree \
    ripgrep \
    nodejs \
    npm \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ── Workspace ──────────────────────────────────────────────────────────────────
WORKDIR /workspace

# ── Entrypoint (inlined — avoids podman-compose build context path issues) ─────
RUN cat > /entrypoint.sh << 'ENTRYPOINT_EOF'
#!/bin/bash
set -e

RESET="\033[0m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"

echo ""
echo -e "${CYAN}╔══════════════════════════════════════╗${RESET}"
echo -e "${CYAN}║        Vita workspace                ║${RESET}"
echo -e "${CYAN}╚══════════════════════════════════════╝${RESET}"
echo ""

if [ -n "$GIT_CRYPT_KEY_B64" ]; then
    echo -e "${CYAN}→ Unlocking encrypted files...${RESET}"
    echo "$GIT_CRYPT_KEY_B64" | base64 -d > /tmp/git-crypt-key
    chmod 600 /tmp/git-crypt-key
    git -C /workspace crypt unlock /tmp/git-crypt-key 2>/dev/null \
        && echo -e "${GREEN}✓ Repo unlocked — personal/ and work/ are decrypted${RESET}" \
        || echo -e "${YELLOW}⚠ Already unlocked or not yet initialized${RESET}"
    rm -f /tmp/git-crypt-key
else
    echo -e "${YELLOW}⚠ GIT_CRYPT_KEY_B64 not set — encrypted files stay locked${RESET}"
    echo -e "${YELLOW}  export GIT_CRYPT_KEY_B64=\$(base64 < ~/.git-crypt-key)${RESET}"
fi

echo ""

if [ -f /workspace/tools/requirements.txt ]; then
    echo -e "${CYAN}→ Syncing Python deps...${RESET}"
    pip install --quiet --no-cache-dir -r /workspace/tools/requirements.txt
    echo -e "${GREEN}✓ Python deps ready${RESET}"
fi

echo ""
echo -e "${CYAN}Available commands:${RESET}"
echo -e "  ${GREEN}python tools/ai-router.py --inbox work/_inbox/${RESET}"
echo -e "  ${GREEN}python tools/ai-router.py --inbox personal/_inbox/${RESET}"
echo -e "  ${GREEN}bash tools/new-doc.sh${RESET}"
echo -e "  ${GREEN}cd apps/dashboard && npm run dev${RESET}"
echo ""

exec "$@"
ENTRYPOINT_EOF

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]