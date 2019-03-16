# my-systemverilog-examples

[![Maintainability](https://api.codeclimate.com/v1/badges/7b6a0473affbce8049ee/maintainability)](https://codeclimate.com/github/JeffDeCola/my-systemverilog-examples/maintainability)
[![Issue Count](https://codeclimate.com/github/JeffDeCola/my-systemverilog-examples/badges/issue_count.svg)](https://codeclimate.com/github/JeffDeCola/my-systemverilog-examples/issues)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://jeffdecola.mit-license.org)

`my-systemverilog-examples` _is a place to keep my SystemVerilog code snippets
and examples._

These examples also contain info I gathered from other sources.

View my entire list of SystemVerilog examples on
[my GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## SYSTEMVERILOG EXAMPLES

_All sections in alphabetical order._

* [basic-example](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-example)

   _To get you up and running._

## UPDATE GITHUB WEBPAGE USING CONCOURSE (OPTIONAL)

For fun, I use concourse to update
[my-systemverilog-examples GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)
and alert me of the changes via repo status and slack.

A pipeline file [pipeline.yml](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/ci/pipeline.yml)
shows the entire ci flow. Visually, it looks like,

![IMAGE - my-systemverilog-examples concourse ci pipeline - IMAGE](docs/pics/my-systemverilog-examples-pipeline.jpg)

The `jobs` and `tasks` are,

* `job-readme-github-pages` runs task
  [readme-github-pages.sh](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/ci/scripts/readme-github-pages.sh).

The concourse `resources types` are,

* `my-systemverilog-examples` uses a resource type
  [docker-image](https://hub.docker.com/r/concourse/git-resource/)
  to PULL a repo from github.
* `resource-slack-alert` uses a resource type
  [docker image](https://hub.docker.com/r/cfcommunity/slack-notification-resource)
  that will notify slack on your progress.
* `resource-repo-status` uses a resource type
  [docker image](https://hub.docker.com/r/dpb587/github-status-resource)
  that will update your git status for that particular commit.

For more information on using concourse for continuous integration,
refer to my cheat sheet on [concourse](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/software/operations-tools/continuous-integration-continuous-deployment/concourse-cheat-sheet).
