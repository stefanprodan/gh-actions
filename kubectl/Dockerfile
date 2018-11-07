FROM gcr.io/cloud-builders/gcloud-slim@sha256:4eb42e6c93d163f38992cccc0fa56abd5c9d606c4c36ccf2049076a2a9713a83

LABEL "name"="kubectl action"
LABEL "maintainer"="Stefan Prodan <support@gweave.works>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"
LABEL "com.github.actions.name"="kubectl"
LABEL "com.github.actions.description"="This is an Action to run kubectl commands."

ENV KUBECTL_VERSION="v1.11.4"

RUN apt-get update && apt-get -y --no-install-recommends install curl \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && mv ./kubectl /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
