FROM alpine:edge

RUN apk add --no-cache rustup gcc git neovim nodejs npm ripgrep zip unzip
RUN rustup self upgrade-data
RUN rustup default nightly

WORKDIR /root

RUN git clone https://github.com/NvChad/NvChad /root/.config/nvim
RUN mkdir -p /root/.config/nvim/lua/custom/
COPY . /root/.config/nvim/lua/custom/

RUN nvim --headless "+Lazy! sync" +qa
RUN nvim --headless "+MasonInstallAll" +qa
