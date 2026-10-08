FROM codercom/code-server:latest

USER root
# Tools you always want go here. They're part of the image, so they survive redeploys
RUN apt-get update && apt-get install -y \
    build-essential python3 python3-pip git nodejs npm \
 && rm -rf /var/lib/apt/lists/*

USER coder
# Extensions come from Open VSX
RUN code-server --install-extension ms-python.python \
 && code-server --install-extension esbenp.prettier-vscode

RUN mkdir -p /home/coder/project
EXPOSE 8080
ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "--auth", "password", "/home/coder/project"]
