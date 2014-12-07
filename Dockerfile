FROM ubuntu

# Install go deps + xvfb (x session)
RUN apt-get update -y && apt-get install --no-install-recommends -y -q \
	curl \
	build-essential \
	ca-certificates \
	git \
	mercurial \
	bzr \
	dbus \
	xvfb

# Download and install go
RUN mkdir /goroot && curl https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1
RUN mkdir /gopath

ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

# Install libwebkit, gtk, and gotk3
RUN apt-get update -y && apt-get install --no-install-recommends -y -q libwebkit2gtk-3.0-dev libgtk-3-dev libcairo2-dev libglib2.0-dev
RUN go get -u -tags gtk_3_10 github.com/sourcegraph/webloop/...

COPY ./init.sh /opt/init.sh
RUN chmod +x /opt/init.sh

ONBUILD WORKDIR /gopath/src/app
ONBUILD ADD . /gopath/src/app/
ONBUILD RUN go get app

ONBUILD CMD ["/opt/init.sh"]


