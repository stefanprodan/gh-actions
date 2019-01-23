#!/usr/bin/env bash

set -o errexit
set -o pipefail

package() {
    helm init --client-only
    helm lint ${CHART}
    mkdir /github/home/pkg
    helm package ${CHART} --destination /github/home/pkg/
}

push() {
  git config user.email ${GITHUB_ACTOR}@users.noreply.github.com
  git config user.name ${GITHUB_ACTOR}
  git remote set-url origin ${REPOSITORY}
  git checkout gh-pages
  mv /github/home/pkg/*.tgz .
  helm repo index . --url ${URL}
  git add .
  git commit -m "Publish Helm chart ${CHART} ${TAG}"
  git push origin gh-pages
}

REPOSITORY="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

CHART=$1
if [[ -z $1 ]] ; then
  echo "Chart path parameter needed!" && exit 1;
fi

URL=$2
if [[ -z $2 ]] ; then
  echo "Helm repository URL parameter needed!" && exit 1;
fi

TAG=$(echo ${GITHUB_REF} | rev | cut -d/ -f1 | rev)
if [[ "${GITHUB_REF}" == "refs/tags"* ]]; then
    echo "Starting action for tag ${TAG}";
else
    echo "Skipping action because push does not refer to a git tag!" && exit 78;
fi

TAG_FILTER=$3
if [[ -z $3 ]]; then
  echo "Tag filter not specified";
else
    if [[ ${TAG} != *${TAG_FILTER}* ]]; then
    echo "Tag ${TAG} does not match filter ${TAG_FILTER}" && exit 78;
    fi
fi

package
push