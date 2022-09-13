FROM registry.redhat.io/ubi8/ubi

ENV PATH=${PATH}:/go/bin

RUN curl -o go.tar.gz https://dl.google.com/go/go1.17.13.linux-amd64.tar.gz && \
    tar -xvf go.tar.gz && \
    rm -rvf go.tar.gz

RUN yum install -y python3-pip git make && yum clean all