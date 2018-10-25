FROM alpine:3.8

LABEL "name"="kubectl action"
LABEL "maintainer"="Stefan Prodan <support@gweave.works>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"
LABEL "com.github.actions.name"="kubectl"
LABEL "com.github.actions.description"="This is an Action to run kubectl commands."

ENV KUBECTL_VERSION="v1.11.3"

RUN apk add --no-cache ca-certificates bash git curl \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

CMD bash
