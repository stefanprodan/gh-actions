FROM gcr.io/cloud-builders/kubectl

LABEL "name"="Helm Action"
LABEL "maintainer"="Stefan Prodan <support@gweave.works>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"
LABEL "com.github.actions.name"="Helm"
LABEL "com.github.actions.description"="This is an Action to run Helm commands."

ENV KUBECTL_VERSION="v1.11.3"
ENV HELM_VERSION="v2.11.0"

RUN curl -Lo /tmp/helm-linux-amd64.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -xvf /tmp/helm-linux-amd64.tar.gz -C /tmp/ \
    && chmod +x /tmp/linux-amd64/helm && mv /tmp/linux-amd64/helm /usr/local/bin/ \
    && helm init --client-only \
    && helm plugin install https://github.com/mbenabda/helm-local-chart-version

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

