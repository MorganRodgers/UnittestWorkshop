FROM debian:buster-slim

ENV DOTNET_VERSION='2.1.810 3.1.402'
ENV NODEJS_VERSION='12.16.3'
ENV PYTHON_VERSION='3.9.2'

# RUN calls sh -c and we need some Bash-isms, so put those into a script
COPY ./installer.sh /tmp/

RUN apt-get update -y \
    && apt-get install -y \
        build-essential \
        curl \
        dirmngr \
        gawk \
        git \
        gpg \
        libbz2-dev \
        libffi-dev \
        libgdbm-dev \
        liblzma-dev \
        libncurses5-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        llvm \
        python-openssl \
        tk-dev \
        wget \
        xz-utils \
        zlib1g-dev \
    && git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0 \
    && echo '. $HOME/.asdf/asdf.sh' >> "$HOME/.bashrc" \
    && bash /tmp/installer.sh \
    && apt-get remove -y build-essential \
    && apt-get autoremove -y
