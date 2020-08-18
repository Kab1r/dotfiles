FROM alpine
LABEL maintainer="kabir@kwatra.me"

ARG USER=kabir
ARG BUILD_DATE=""
ARG VCS_REF=""
ARG BUILD_VERSION=""
ARG OCI_NAME="kabirkwatra/dot"
ARG OCI_AUTHOR="Kabir Kwatra"
ARG OCI_DESCRIPTION="Kabir Kwatra's Containerized DotFiles"
ARG OCI_URL="https://dotfiles.kwatra.me"
ARG OCI_SRC_URL="https://github.com/kabirkwatra/dotfiles"
ARG OCI_LICENSE="AGPL-3.0"

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name=$OCI_NAME
LABEL org.label-schema.vendor=$OCI_AUTHOR
LABEL org.label-schema.description=$OCI_DESCRIPTION
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.vcs-url=$OCI_SRC_URL
LABEL org.label-schema.url=$OCI_URL
LABEL org.opencontainers.image.title=$OCI_NAME
LABEL org.opencontainers.image.authors=$OCI_AUTHOR
LABEL org.opencontainers.image.vendor=$OCI_AUTHOR
LABEL org.opencontainers.image.description=$OCI_DESCRIPTION
LABEL org.opencontainers.image.created=$BUILD_DATE
LABEL org.opencontainers.image.version=$BUILD_VERSION
LABEL org.opencontainers.image.documentation=$OCI_SRC_URL
LABEL org.opencontainers.image.url=$OCI_URL
LABEL org.opencontainers.image.source=$OCI_SRC_URL
LABEL org.opencontainers.image.licenses=$OCI_LICENSE

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

RUN sudo chown $USER -R .local

RUN SETUP_SCRIPT=$HOME/.local/share/chezmoi/executable_dot_setup.sh && \
    sudo chmod +x $SETUP_SCRIPT && \
    export CI=True  && \
    sh $SETUP_SCRIPT && \
    unset CI

CMD $SHELL
