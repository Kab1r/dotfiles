FROM archlinux
ARG USER=kabir
ENV SHELL=fish

RUN pacman -Syu --noconfirm \
    sudo \
    $SHELL \
    tzdata

RUN useradd -ms /usr/bin/$SHELL $USER
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER
WORKDIR /home/$USER/

COPY . .local/share/chezmoi/

RUN SETUP_SCRIPT=$HOME/.local/share/chezmoi/executable_dot_setup.sh && \
    sudo chmod +x $SETUP_SCRIPT && \
    export CI=True  && \
    sh $SETUP_SCRIPT && \
    unset CI

CMD $SHELL