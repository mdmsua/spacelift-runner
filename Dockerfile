FROM public.ecr.aws/spacelift/runner-terraform:latest

ARG TARGETARCH

ADD https://github.com/Azure/kubelogin/releases/download/v0.1.3/kubelogin-linux-${TARGETARCH}.zip /tmp/kubelogin/kubelogin.zip

RUN apk add unzip && \
    unzip /tmp/kubelogin/kubelogin.zip -d /tmp/kubelogin && \
    mv /tmp/kubelogin/bin/linux_${TARGETARCH}/kubelogin /bin/kubelogin && \
    chmod 755 /bin/kubelogin && \
    rm -rf /tmp/kubelogin && \
    kubelogin --version