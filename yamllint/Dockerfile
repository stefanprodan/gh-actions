FROM python:3.7

LABEL "name"="yamllint Action"
LABEL "maintainer"="Stefan Prodan <support@gweave.works>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"
LABEL "com.github.actions.name"="yamllint"
LABEL "com.github.actions.description"="This is an Action to run yamllint commands."

ENV PYTHON_UNBUFFERED 1

RUN pip install yamllint

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

