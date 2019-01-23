FROM gcr.io/cloud-builders/kubectl

LABEL "name"="Helm gh-pages action"
LABEL "maintainer"="Stefan Prodan <support@weave.works>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"
LABEL "com.github.actions.name"="Helm gh-pages"
LABEL "com.github.actions.description"="This is an Action to package and publish Helm charts to GitHub Pages."

ENV HELM_VERSION="v2.11.0"

RUN curl -Lo /tmp/helm-linux-amd64.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -xvf /tmp/helm-linux-amd64.tar.gz -C /tmp/ \
    && chmod +x /tmp/linux-amd64/helm \
    && mv /tmp/linux-amd64/helm /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
