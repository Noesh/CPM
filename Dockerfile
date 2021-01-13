FROM filippoaleotti/opencv-ubuntu
USER root

RUN mkdir /workspace
RUN mkdir /workspace/CPM
RUN useradd -d /workspace user

COPY ./CPM /workspace/CPM
WORKDIR /workspace/CPM
RUN cmake .
RUN make

RUN mkdir /workspace/RIC
COPY ./RIC /workspace/RIC

WORKDIR /workspace/RIC
RUN make -f Makefile -j 7

WORKDIR /workspace