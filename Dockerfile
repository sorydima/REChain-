# Dockerfile for REChain version 4.1.8+1152 - latest release as of 2025-07-08

# Use Cirrus CI Flutter image as builder
FROM ghcr.io/cirruslabs/flutter as builder

# Install necessary tools
RUN sudo apt update && sudo apt install -y curl wget jq

# Download yq for YAML processing
WORKDIR /tmp
RUN wget https://github.com/mikefarah/yq/releases/download/v4.40.5/yq_linux_amd64.tar.gz
RUN tar -xzvf ./yq_linux_amd64.tar.gz
RUN mv yq_linux_amd64 /usr/bin/yq

# Copy project files and build Flutter web app
COPY . /app
WORKDIR /app
RUN ./scripts/prepare-web.sh
COPY config.* /app/
RUN flutter pub get
RUN flutter build web --dart-define=FLUTTER_WEB_CANVASKIT_URL=canvaskit/ --release --source-maps

# Use nginx alpine image to serve the built web app
FROM docker.io/nginx:alpine
RUN rm -rf /usr/share/nginx/html
COPY --from=builder /app/build/web /usr/share/nginx/html
