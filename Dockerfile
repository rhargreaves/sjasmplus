FROM ubuntu:16.04
RUN apt-get update && \
	apt-get -y install tar wget libboost-all-dev make g++ && \
	mkdir ~/temp && \
	cd ~/temp && \
	wget https://cmake.org/files/v3.9/cmake-3.9.1.tar.gz && \
	tar -xzvf cmake-3.9.1.tar.gz && \
	cd cmake-3.9.1/ && \
	./bootstrap && \
	make -j4 && \
	make install && \
	export PATH=$PATH:/usr/local/bin/
COPY . /app
WORKDIR /app
RUN cmake -DBoost_USE_STATIC_LIBS:BOOL=ON -DCMAKE_BUILD_TYPE="Release" . && \
	make

