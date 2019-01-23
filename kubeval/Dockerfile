FROM gcr.io/cloud-builders/kubectl

LABEL "name"="kubeval Action"
LABEL "maintainer"="Stefan Prodan <support@gweave.works>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"
LABEL "com.github.actions.name"="kubeval"
LABEL "com.github.actions.description"="This is an Action to run kubeval commands."

ENV VERSION="0.7.3"

RUN curl -Lo /tmp/kubeval-linux-amd64.tar.gz https://github.com/garethr/kubeval/releases/download/${VERSION}/kubeval-linux-amd64.tar.gz \
    && tar -xvf /tmp/kubeval-linux-amd64.tar.gz -C /tmp/ \
    && chmod +x /tmp/kubeval && mv /tmp/kubeval /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

