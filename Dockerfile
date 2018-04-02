FROM debian:stretch
LABEL maintainer="dynaresf@parlement-ouvert.fr"

# Install Dynare
RUN echo "deb-src http://deb.debian.org/debian stretch main" >>/etc/apt/sources.list
RUN echo "deb-src http://deb.debian.org/debian stretch-updates main" >>/etc/apt/sources.list
RUN echo "deb-src http://security.debian.org stretch/updates main" >>/etc/apt/sources.list
RUN apt-get update
RUN apt-get --no-install-recommends -y build-dep dynare
RUN apt-get -y install bison ca-certificates flex gawk git libfl-dev
RUN git clone --recursive https://github.com/DynareTeam/dynare.git
WORKDIR "/dynare"
RUN autoreconf -si
RUN ./configure --disable-matlab
RUN make
RUN make install
WORKDIR "/"

# Install JupyterLab
RUN apt-get -y install python3-pip
RUN python3 -m pip install --no-cache-dir jupyterlab
