# helm-gh-pages

This is a GitHub Action that publishes Helm charts to a Helm repository hosted on GitHub Pages.

The Helm gh-pages actions takes 3 arguments:
1. chart path (required)
2. GitHub Pages HTTPS URL (required)
3. Git tag filter (optional)

In order to use this action your Git repository should have a `gh-pages` branch published on GitHub Pages.

### Usage

Package and push the Helm chart located at `chart/app` to the `gh-pages` branch on Git tag:

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

Publish the Helm chart located at `chart/app` when the Git tag contains the `chart-` prefix:

```terraform
action "Helm gh-pages" {
  uses = "stefanprodan/gh-actions/helm-gh-pages@master"
  args = ["chart/app","https://user.github.io/app","chart-"]
  secrets = ["GITHUB_TOKEN"]
}
```

### Workflow

Assuming your GitHub repository has a Helm chart named `app` located at `chart/app` the release procedure could be:

```bash
# make changes to the chart/app and bump the version inside Chart.yaml
> git commit -m "Bump chart version to 1.0.0"
> git push origin master

# release v1.0.0
> git tag v1.0.0
> git push origin v1.0.0
``` 

When you push the new tag, GitHub will start the workflow and the helm-gh-pages will do the following:

* checks out the `v1.0.1` tag
* validates the chart by running `helm lint chart/app`
* packages the chart to `/github/home/pkg/app-1.0.0.tgz`
* checks out the `gh-pages` branch
* copies the `app-1.0.0.tgz` from github home to github workspace
* updates the Helm repository index using the GitHub pages URL
* commits the chart package and the updated `index.yaml`
* pushed the changes to `gh-pages`
