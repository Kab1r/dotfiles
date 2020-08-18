FROM alpine
ARG USER=kabir

RUN apk update && \
    apk add --no-cache \
    sudo \
    fish \
    tzdata \
    shadow

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