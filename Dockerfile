FROM alpine:latest

RUN apk update && apk upgrade



RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    openssl \
    openssl-dev \
    wget \
    coreutils \
    zsh \
    zsh-theme-powerlevel10k \
    tmux \
    gcc  \
    build-base


RUN adduser \
    --disabled-password \
    --gecos "" \
    --uid 1000 \
    rust

USER rust 
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN echo "source $HOME/.cargo/env" >> "/home/rust/.zshrc"
RUN source $HOME/.cargo/env && cargo install cargo-watch

RUN mkdir -p ~/.local/share/fonts
COPY fonts/* ~/.local/share/fonts/
COPY zsh/* ~/

RUN echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >> ~/.zshrc
##RUN echo 'tmux -u' >> ~/.zshrc

RUN mkdir -p ~/.local/share/zsh/plugins
RUN ln -s /usr/share/zsh/plugins/powerlevel10k ~/.local/share/zsh/plugins/
RUN touch ~/.tmux.conf && \
    echo "set -g default-shell /bin/zsh" >> ~/.tmux.conf && \
    echo "set -g mouse on" >> ~/.tmux.conf && \
    echo "set-hook -g session-created 'split-window -h'" >> ~/.tmux.conf \
