ARG BASE_IMAGE=gallery.ecr.aws/spacelift/runner-terraform:azure-latest

ARG TARGETARCH

FROM ${BASE_IMAGE} AS base

USER root

ADD https://github.com/Azure/kubelogin/releases/download/v0.1.3/kubelogin-linux-${TARGETARCH}.zip /tmp/kubelogin/kubelogin.zip

RUN unzip /tmp/kubelogin/kubelogin.zip -d /tmp/kubelogin && \
    mv /tmp/kubelogin/bin/linux_${TARGETARCH}/kubelogin /bin/kubelogin && \
    chmod 755 /bin/kubelogin && \
    rm -rf /tmp/kubelogin && \
    kubelogin --version

USER spacelift