FROM ubuntu:24.04 AS builder

# Install build dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    make \
    cmake \
    pkg-config \
    libssl-dev \
    libsqlite3-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Build arguments
ARG VERSION=4.2.0
ARG GIT_COMMIT=unknown

# Set environment
ENV VERSION=${VERSION}
ENV GIT_COMMIT=${GIT_COMMIT}
ENV DEBIAN_FRONTEND=noninteractive

# Create user
RUN useradd -m -s /bin/bash rechain

# Build application
WORKDIR /build
COPY . .

RUN echo "Building REChain ${VERSION} (${GIT_COMMIT})" && \
    if [ -f CMakeLists.txt ]; then \
        mkdir -p build && \
        cd build && \
        cmake -DCMAKE_BUILD_TYPE=Release .. && \
        make -j$(nproc) && \
        cp rechain /usr/local/bin/; \
    elif [ -f Makefile ]; then \
        make -j$(nproc) && \
        cp rechain /usr/local/bin/; \
    else \
        echo "No build system found"; \
    fi

# Final stage
FROM ubuntu:24.04

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    libssl3 \
    libcrypto3 \
    libsqlite3-0 \
    libcurl4 \
    zlib1g \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Create rechain user
RUN useradd -m -s /bin/bash rechain

# Copy binary from builder
COPY --from=builder /usr/local/bin/rechain /usr/local/bin/rechain
RUN chmod +x /usr/local/bin/rechain

# Create directories
RUN mkdir -p /etc/rechain /var/lib/rechain /var/log/rechain
RUN chown -R rechain:rechain /var/lib/rechain /var/log/rechain
RUN chown root:root /etc/rechain
RUN chmod 755 /etc/rechain

# Copy default configuration
COPY --from=builder /build/dist/templates/config.yaml /etc/rechain/config.yaml

# Expose port
EXPOSE 8008

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8008/_matrix/client/versions || exit 1

# Set working directory
WORKDIR /var/lib/rechain

# Switch to rechain user
USER rechain

# Default command
CMD ["/usr/local/bin/rechain"]

# Labels
LABEL maintainer="REChain Team <support@rechain.network>"
LABEL version="${VERSION}"
LABEL description="REChain Secure Messaging Server"
LABEL org.opencontainers.image.source="https://github.com/sorydima/REChain-"
