FROM archlinux:latest

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm rustup gcc git neovim clang nodejs npm ripgrep
RUN rustup self upgrade-data
RUN rustup default nightly

WORKDIR /root

RUN git clone https://github.com/NvChad/NvChad /root/.config/nvim
RUN mkdir -p /root/.config/nvim/lua/custom/
COPY . /root/.config/nvim/lua/custom/

RUN nvim --headless "+Lazy! sync" +qa
RUN nvim --headless "+MasonInstallAll" +qa
