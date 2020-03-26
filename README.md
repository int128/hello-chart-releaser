# hello-chart-releaser

Hello World with https://github.com/helm/chart-releaser on CircleCI.

## For user

To add this repository:

```console
% helm repo add hello https://int128.github.io/hello-chart-releaser/
"hello" has been added to your repositories

% helm repo update
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "hello" chart repository
...Successfully got an update from the "fluxcd" chart repository
...Successfully got an update from the "stable" chart repository
Update Complete. ⎈ Happy Helming!⎈
```

## For releaser

You need to create `gh-pages` branch with an empty tree before running CI.

```console
% git checkout --orphan gh-pages
Switched to a new branch 'gh-pages'

% git ci --allow-empty
[gh-pages (root-commit) 710591d] Empty commit
```

You need to set `GITHUB_TOKEN` env var to CircleCI.

### Known issues

- Build fails if a release already exists. See https://github.com/helm/chart-releaser/issues/65.
- Build fails on `gh-pages` branch. Need to exclude it.
