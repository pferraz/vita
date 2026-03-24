FROM python:3.12-slim

# System tools
RUN apt-get update && apt-get install -y \
    git \
    git-crypt \
    curl \
    gnupg \
    nodejs \
    npm \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Python deps (add yours here as the project grows)
COPY tools/requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Node deps for apps/
WORKDIR /workspace/apps/dashboard
COPY apps/dashboard/package*.json ./
RUN npm install 2>/dev/null || true

WORKDIR /workspace

# Unlock script — runs at container start if key is present
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]