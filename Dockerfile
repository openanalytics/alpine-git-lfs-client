FROM alpine:latest
LABEL maintainer="jonas.vanmalder@openanalytics.eu"
ARG GIT_LFS_VERSION=2.3.4
RUN apk --update add ca-certificates git openssh openssl curl && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
WORKDIR /root/
RUN curl -sSL https://github.com/git-lfs/git-lfs/releases/download/v$GIT_LFS_VERSION/git-lfs-linux-amd64-$GIT_LFS_VERSION.tar.gz | tar xz
RUN mv git-lfs-*/git-lfs /usr/bin/ && rm -rf git-lfs-* && git lfs install
ENTRYPOINT ["git-lfs"]
CMD ["version"]
