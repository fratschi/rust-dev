# rust-dev
Docker container for Rust development

# Build Docker Container - Linux
```docker build -t rust-dev --build-arg HOST_UID=$(id -u) .```

# Build Docker Container - MAC
TODO

# Run Docker Container
```docker run --user rust -it -t --mount type=bind,source=/tmp/rust-dev,target=/rust rust-dev /bin/zsh -c "cd /home/rust; tmux -u"```

This starts the container and mounts the local directory /tmp/rust-dev to /rust in the container. The container is started as user rust and the shell is zsh. The tmux session is started in the home directory of user rust.

# Tmux 

## Cargo watch - run the application on file change
```cargo watch -cx run```

## Cargo watch - run the tests on file change
```cargo watch -cx test```