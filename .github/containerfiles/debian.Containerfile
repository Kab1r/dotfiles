FROM debian
LABEL maintainer="kabir@kwatra.me"

ARG USER=kabir
ARG BUILD_DATE=""
ARG VCS_REF=""
ARG BUILD_VERSION=""
ARG OCI_NAME="kabirkwatra/dotfiles"
ARG OCI_AUTHOR="Kabir Kwatra"
ARG OCI_DESCRIPTION="Kabir Kwatra's Containerized DotFiles"
ARG OCI_URL="https://dotfiles.kwatra.me"
ARG OCI_SRC_URL="https://github.com/kabirkwatra/dotfiles"
ARG OCI_LICENSE="AGPL-3.0"

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name=$OCI_NAME \
      org.label-schema.vendor=$OCI_AUTHOR \
      org.label-schema.description=$OCI_DESCRIPTION \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$BUILD_VERSION \
      org.label-schema.vcs-url=$OCI_SRC_URL \
      org.label-schema.url=$OCI_URL \
      org.opencontainers.image.title=$OCI_NAME \
      org.opencontainers.image.authors=$OCI_AUTHOR \
      org.opencontainers.image.vendor=$OCI_AUTHOR \
      org.opencontainers.image.description=$OCI_DESCRIPTION \
      org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.version=$BUILD_VERSION \
      org.opencontainers.image.documentation=$OCI_SRC_URL \
      org.opencontainers.image.url=$OCI_URL \
      org.opencontainers.image.source=$OCI_SRC_URL \
      org.opencontainers.image.licenses=$OCI_LICENSE

ENV SHELL=fish

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -qq \
    sudo \
    $SHELL \
    tzdata

RUN useradd -ms /usr/bin/$SHELL $USER
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USER
WORKDIR /home/$USER/

COPY . .local/share/chezmoi/

RUN sudo chown $USER -R .local

RUN SETUP_SCRIPT=$HOME/.local/share/chezmoi/executable_dot_setup.sh && \
    sudo chmod +x $SETUP_SCRIPT && \
    export CI=True  && \
    sh $SETUP_SCRIPT && \
    unset CI

CMD $SHELL
