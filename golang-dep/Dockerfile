FROM golang:1.10

LABEL "name"="golang/dep action"
LABEL "maintainer"="Stefan Prodan <support@gweave.works>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"
LABEL "com.github.actions.name"="golang dep"
LABEL "com.github.actions.description"="This is an Action to run golang/dep commands."

ENV DEP_VERSION="v0.5.0"

RUN curl -fL -o /usr/local/bin/dep https://github.com/golang/dep/releases/download/${DEP_VERSION}/dep-linux-amd64 \
 && chmod +x /usr/local/bin/dep \
 && dep version

ENTRYPOINT ["/usr/local/bin/dep"]

CMD ["--help"]

