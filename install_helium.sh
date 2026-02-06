#!/bin/bash

set -e  # Exit on error

# Install Docker and Docker Compose
echo "Installing Docker and Docker Compose..."
apt-get update
apt-get install -y docker.io docker-compose

# Start and enable Docker service
systemctl start docker
systemctl enable docker

# Get hostname
HOSTNAME=$(hostname)

# Clone repository
echo "Cloning repository..."
git clone https://github.com/sicXnull/Bobcat300-DebianMinimalDocker.git
cd Bobcat300-DebianMinimalDocker

# Determine compose file and spidev path based on hostname
case "$HOSTNAME" in
    bobcat-29x)
        COMPOSE_FILE="docker-compose-G29X.yml"
        SPIDEV_PATH="/dev/spidev5.0"
        ;;
    bobcat-285)
        COMPOSE_FILE="docker-compose-G285.yml"
        SPIDEV_PATH="/dev/spidev1.0"
        ;;
    *)
        echo "Error: Unknown hostname '$HOSTNAME'. Expected 'bobcat-29x' or 'bobcat-285'"
        exit 1
        ;;
esac

echo "Detected hostname: $HOSTNAME"
echo "Using compose file: $COMPOSE_FILE"
echo "SPI device path: $SPIDEV_PATH"

# Start pktfwd container briefly to generate configs
echo "Starting pktfwd container temporarily..."
docker-compose -f "$COMPOSE_FILE" up -d pktfwd
sleep 1
docker-compose -f "$COMPOSE_FILE" down

# Update global_conf.json with correct spidev_path
echo "Updating spidev_path in global_conf.json..."
sed -i "s|\"spidev_path\": \".*\"|\"spidev_path\": \"$SPIDEV_PATH\"|g" packet_forwarder/configs/global_conf.json

# Start services normally
echo "Starting services..."
docker-compose -f "$COMPOSE_FILE" up -d

echo "Done! Services started successfully."
