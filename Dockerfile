FROM golang:1.17-alpine

LABEL maintainer="henrique.rieger@gmail.com"

ENV GO111MODULE=auto
ENV GOPRIVATE=gitlab.com
ENV CGO_ENABLED=0
ENV GOOS=linux

RUN apk add --update --no-cache git zip openssh-client build-base aws-cli docker-compose \
    mkdir ~/.ssh \
    ssh-keyscan gitlab.com >> ~/.ssh/known_hosts && eval "$(ssh-agent)" && ssh-add ~/.ssh/id_rsa \
    git config --global url.git@gitlab.com:.insteadOf https://gitlab.com/
