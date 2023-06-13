FROM alpine:edge

RUN apk add --no-cache gcc git neovim nodejs npm ripgrep zip unzip

WORKDIR /root

RUN git clone https://github.com/NvChad/NvChad /root/.config/nvim
RUN mkdir -p /root/.config/nvim/lua/custom/
COPY . /root/.config/nvim/lua/custom/

RUN nvim --headless "+Lazy! sync" +qa
RUN nvim --headless "+MasonInstallAll" +qa
