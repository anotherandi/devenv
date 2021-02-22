FROM ubuntu:20.04 as devenv

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    apt-utils

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    sudo \
    gpgconf \
    openssh-client \
    git \
    git-lfs

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    python3 \
    python3-yaml \
    python3-jsonschema \
    python3-jinja2 \
    python3-pip

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    asciidoctor \
    plantuml \
    xsltproc \
    libsaxon-java \
    libsaxonb-java \
    libxslthl-java \
    docbook-xsl \
    fop \
    libavalon-framework-java

RUN gem install asciidoctor-diagram


FROM devenv as devenv_cpp

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    python3-clang

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    build-essential \
    ccache \
    clang \
    clang-format \
    clang-tidy \
    lldb \
    cmake \
    ninja-build \
    valgrind \
    gcovr

RUN pip3 install conan --no-warn-script-location

FROM devenv as devenv_full

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    flake8 \
    mc