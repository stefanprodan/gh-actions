FROM alpine:3.8

LABEL "name"="Helm Action"
LABEL "maintainer"="Stefan Prodan <support@gweave.works>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"
LABEL "com.github.actions.name"="Helm"
LABEL "com.github.actions.description"="This is an Action to run Helm commands."

ENV KUBECTL_VERSION="v1.11.3"
ENV HELM_VERSION="v2.11.0"

RUN apk add --no-cache ca-certificates bash git curl \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && helm init --client-only \
    && helm plugin install https://github.com/mbenabda/helm-local-chart-version

CMD bash
