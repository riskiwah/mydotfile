FROM ubuntu:18.04

RUN apt-get update && apt install -y \
    git \
    sudo \
    vim

RUN adduser bump && \
    echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user

CMD ["su", "-", "bump", "-c", "/bin/bash"]
