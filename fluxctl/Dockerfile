FROM gcr.io/cloud-builders/kubectl

LABEL "name"="Flux Action"
LABEL "maintainer"="Stefan Prodan <support@gweave.works>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"
LABEL "com.github.actions.name"="fluxctl"
LABEL "com.github.actions.description"="This is an Action to run Weave Flux commands."

ENV FLUX_VERSION="1.9.0"

RUN apt-get update && apt-get -y --no-install-recommends install curl \
    && curl -LO https://github.com/weaveworks/flux/releases/download/${FLUX_VERSION}/fluxctl_linux_amd64 \
    && mv ./fluxctl_linux_amd64 /usr/local/bin/fluxctl && chmod +x /usr/local/bin/fluxctl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

