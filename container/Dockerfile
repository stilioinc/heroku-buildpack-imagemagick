FROM heroku/heroku:18

ARG DEBIAN_FRONTEND=noninteractive

# useful build tools ... we need gtk-doc to build orc, since they don't ship
# pre-baked tarballs
RUN apt-get update && apt-get install -y -qq \
	build-essential \
	autoconf \
	automake \
	libtool \
	intltool \
	gtk-doc-tools \
	unzip \
	wget \
	git \
	pkg-config

RUN cd /usr/src \
	&& wget https://www.imagemagick.org/download/releases/ImageMagick-7.0.8-53.tar.gz \
	&& tar xzf ImageMagick-7.0.8-53.tar.gz \
	&& cd ImageMagick-7.0.8-53 \
	&& ./configure --prefix=/usr/src/imagemagick \
	&& make \
	&& make install

RUN cd /usr/src/imagemagick \
  && rm -rf build \
  && mkdir build \
  && tar czf \
    /usr/src/imagemagick/build/imagemagick.tar.gz bin include lib

