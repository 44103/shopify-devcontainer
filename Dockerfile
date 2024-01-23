FROM ruby

RUN export DEBIAN_FRONTEND="noninteractive" && \
    curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && \
    apt-get update && apt-get -y install --no-install-recommends \
    git \
    zsh \
    vim \
    make \
    curl ca-certificates \
    nodejs ruby-dev nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @shopify/cli @shopify/theme

WORKDIR /workdir

ENV TZ=Asia/Tokyo
RUN zsh -c "`curl -L raw.github.com/44103/dotfiles/main/install.sh`"
