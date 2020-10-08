# my-systemverilog-examples

[![Maintainability](https://api.codeclimate.com/v1/badges/7b6a0473affbce8049ee/maintainability)](https://codeclimate.com/github/JeffDeCola/my-systemverilog-examples/maintainability)
[![Issue Count](https://codeclimate.com/github/JeffDeCola/my-systemverilog-examples/badges/issue_count.svg)](https://codeclimate.com/github/JeffDeCola/my-systemverilog-examples/issues)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://jeffdecola.mit-license.org)

*A place to keep my SystemVerilog code snippets and examples._

These examples also contain info I gathered from other sources.

Table of Contents,

* [SYSTEMVERILOG EXAMPLES](https://github.com/JeffDeCola//tree/masterm#systemverilog-examples)
  * [BASIC VERILOG](https://github.com/JeffDeCola//tree/masterm#basic-verilog)

[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

### INSTALL IVERILOG

I installed `iverilog` for simulation and synthesis.

#### Install from package

This is easier,

```bash
sudo apt-get update
sudo apt-get install verilog
```

#### Install from Source

Go
[github.com/steveicarus/iverilog](https://github.com/steveicarus/iverilog)
for latest information.

I compiled from source to /usr/local (default),

```bash
git clone git@github.com:steveicarus/iverilog.git
```

I needed a few things,

```bash
sudo apt-get install -y autoconf
sudo apt-get install -y gperf
sudo apt-get install -y flex
```

Build configuration files,

```bash
cd steveicarus/iverilog
sh autoconf.sh
```

Now lets compile your source,

```bash
./configure
make
sudo su
make install
```

#### Check Installation

check,

```bash
iverilog -h
```

Create a verilog file `hello.v`,

```verilog
module main();

initial
  begin
    $display("Hi there");
    $finish ;
  end

endmodule
```

Compile,

```bash
iverilog -o hello hello.v
```

Execute,

```bash
./hello
```

## SYSTEMVERILOG EXAMPLES

_All sections in alphabetical order._

### BASIC VERILOG

* [d-flip-flop](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic/d-flip-flop)

   _A basic d-flip-flop._

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
