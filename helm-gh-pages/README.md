# helm-gh-pages

This is a GitHub Action that publishes Helm charts to a Helm repository hosted on GitHub Pages.

### Usage

Package and push the Helm chart located at `chart/app` to the `gh-pages` branch on git tag:

```terraform
workflow "Publish Helm chart" {
  on = "push"
  resolves = ["Helm gh-pages"]
}

action "Helm gh-pages" {
  uses = "stefanprodan/gh-actions/helm-gh-pages@master"
  args = ["chart/app","https://user.github.io/app"]
  secrets = ["GITHUB_TOKEN"]
}
```

Publish the Helm chart located at `chart/app` when the git tag contains the `chart-` prefix:

```terraform
action "Helm gh-pages" {
  uses = "stefanprodan/gh-actions/helm-gh-pages@master"
  args = ["chart/app","https://user.github.io/app","chart-"]
  secrets = ["GITHUB_TOKEN"]
}
```


