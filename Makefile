CR_TOKEN := $(GITHUB_TOKEN)
export CR_TOKEN
CR_OWNER := $(CIRCLE_PROJECT_USERNAME)
export CR_OWNER
CR_GIT_REPO := $(CIRCLE_PROJECT_REPONAME)
export CR_GIT_REPO
CR_CHARTS_REPO := https://$(CIRCLE_PROJECT_USERNAME).github.io/$(CIRCLE_PROJECT_REPONAME)
export CR_CHARTS_REPO

.PHONY: build
build:
	helm lint helloworld
	helm package -d .cr-release-packages helloworld

.PHONY: release
release:
	cr upload
	mkdir -p .cr-index
	cr index
	ghcp commit -u $(CIRCLE_PROJECT_USERNAME) -r $(CIRCLE_PROJECT_REPONAME) -b gh-pages -m 'Update index.yaml' -C .cr-index index.yaml
