FROM alpine
ARG USER=kabir
ENV SHELL=fish

RUN apk update && \
    apk add --no-cache \
    sudo \
    $SHELL \
    tzdata \
    shadow

RUN useradd -ms /usr/bin/$SHELL $USER
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER
ENV HOME /home/$USER/
WORKDIR $HOME

COPY . .local/share/chezmoi/

RUN SETUP_SCRIPT=$HOME/.local/share/chezmoi/executable_dot_setup.sh && \
    sudo chmod +x $SETUP_SCRIPT && \
    export CI=True  && \
    sh $SETUP_SCRIPT && \
    unset CI

CMD $SHELL