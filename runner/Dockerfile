# Use ARM64 base image
FROM arm64v8/ubuntu:22.04

WORKDIR /actions-runner

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    tar \
    jq \
    git \
    libicu-dev \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user to execute the runner
RUN useradd -m -d /home/runner -s /bin/bash runner

WORKDIR /home/runner/actions-runner

# Download runner packages
ENV RUNNER_VERSION=2.321.0
RUN curl -o actions-runner-linux-arm64-${RUNNER_VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-arm64-${RUNNER_VERSION}.tar.gz \
    && echo "62cc5735d63057d8d07441507c3d6974e90c1854bdb33e9c8b26c0da086336e1  actions-runner-linux-arm64-2.321.0.tar.gz" | shasum -a 256 -c - \
    && tar xzf ./actions-runner-linux-arm64-${RUNNER_VERSION}.tar.gz \
    && rm actions-runner-linux-arm64-${RUNNER_VERSION}.tar.gz

# Copy script and make it executable
COPY entrypoint.sh /home/runner/actions-runner/entrypoint.sh
RUN chmod +x /home/runner/actions-runner/entrypoint.sh

USER runner

# Define entrypoint
ENTRYPOINT ["./entrypoint.sh"]
