# Go GitHub Action

CI workflow example

```hcl-terraform
workflow "Lint and test" {
  on = "push"
  resolves = ["build"]
}

action "lint" {
  uses = "stefanprodan/gh-actions/golang@master"
  args = "fmt"
}

action "test" {
  uses = "stefanprodan/gh-actions/golang@master"
  args = "test"
}
```

