# rust-dev
Docker container for Rust development

# Build Docker Container
docker build -t rust-dev .


# Run Docker Container
docker run --user rust -it -t --mount type=bind,source=/tmp/rust-dev,target=/rust rust-dev


# Start tmux when container runs
tmux -u