workflow "Check markdown links" {
  resolves = ["markdown-link-check"]
  on = "push"
}

action "markdown-link-check" {
  uses = "gaurav-nelson/github-action-markdown-link-check@v0.1.0"
}
