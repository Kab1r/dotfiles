FROM debian
ARG USER=kabir

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -qq \
    sudo \
    fish \
    tzdata

RUN useradd -ms /usr/bin/fish $USER
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER
WORKDIR /home/$USER/

COPY . .local/share/chezmoi/

RUN SETUP_SCRIPT=$HOME/.local/share/chezmoi/executable_dot_setup.sh && \
    sudo chmod +x $SETUP_SCRIPT && \
    export CI=True  && \
    sh $SETUP_SCRIPT && \
    unset CI