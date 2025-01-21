## Emacs, make this -*- mode: sh; -*-

FROM debian:testing

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"

## Set a default user. Available via runtime flag `--user docker`
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
## User should also have & own a home directory (for rstudio or linked volumes to work properly).
RUN useradd -s /bin/bash -m docker \
    && usermod -a -G staff docker

## NB: No 'apt-get upgrade -y' in official images, see eg
## https://github.com/docker-library/official-images/pull/13443#issuecomment-1297829291
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ed \
        less \
        locales \
        nano \
        wget \
        ca-certificates \
        fonts-texgyre \
        bash-completion \
        g++ \
		gcc \
        valgrind \
        build-essential \
		cmake \
        zlib1g-dev \
        git \
    && rm -rf /var/lib/apt/lists/*

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

## Use Debian unstable via pinning -- new style via APT::Default-Release
RUN echo "deb http://http.debian.net/debian sid main" > /etc/apt/sources.list.d/debian-unstable.list \
        && echo 'APT::Default-Release "testing";' > /etc/apt/apt.conf.d/default \
        && echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/90local-no-recommends

ENV WORKDIR=$HOME

## More verbose UBSAN/SAN output (cf #3) -- this is still somewhat speculative
## Entry copied from Prof Ripley's setup described at http://www.stats.ox.ac.uk/pub/bdr/memtests/README.txt
ENV ASAN_OPTIONS 'alloc_dealloc_mismatch=0:detect_leaks=0:detect_odr_violation=0' 
ENV UBSAN_OPTIONS 'print_stacktrace=1'

ENV CC 'gcc -std=gnu99 -fsanitize=undefined -fno-omit-frame-pointer -std=gnu11'
ENV CFLAGS '-g -O2'
ENV CXX 'g++ -fsanitize=undefined,bounds-strict -fno-omit-frame-pointer -std=gnu++11'
ENV CXXFLAGS '-g -O2 -Wall -pedantic -mtune=native'

RUN cd $HOME \
    && git clone --branch latest https://github.com/ERGO-Code/HiGHS.git \
    && git clone --branch main https://github.com/FlorianSchwendinger/highs-tests.git \
    && mkdir -p $HOME/HiGHS/build \
    && cd $HOME/HiGHS/build \
    && cmake .. -DCMAKE_INSTALL_PREFIX="$HOME/highslib" -DCMAKE_VERBOSE_MAKEFILE:bool=ON -G "Unix Makefiles" \
    && make install

RUN cd /usr/local/bin \
	&& ln -s $HOME/highslib/bin/highs highs

CMD ["highs"]
