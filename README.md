# my-systemverilog-examples

[![Maintainability](https://api.codeclimate.com/v1/badges/7b6a0473affbce8049ee/maintainability)](https://codeclimate.com/github/JeffDeCola/my-systemverilog-examples/maintainability)
[![Issue Count](https://codeclimate.com/github/JeffDeCola/my-systemverilog-examples/badges/issue_count.svg)](https://codeclimate.com/github/JeffDeCola/my-systemverilog-examples/issues)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://jeffdecola.mit-license.org)

_A place to keep my SystemVerilog code snippets and examples._

These examples also contain info I gathered from other sources.

Table of Contents,

* [BASIC CODE](https://github.com/JeffDeCola/my-systemverilog-examples#basic-code)
  * COMBINATIONAL LOGIC
  * SEQUENTIAL LOGIC
* [COMBINATIONAL LOGIC](https://github.com/JeffDeCola/my-systemverilog-examples#combinational-logic)
  * DATA OPERATORS
  * DECODERS & ENCODERS
  * MULTIPLEXERS & DEMULTIPLEXERS
  * SHIFTERS
* [SEQUENTIAL LOGIC](https://github.com/JeffDeCola/my-systemverilog-examples#sequential-logic)
  * ARBITERS
* [SYSTEMS](https://github.com/JeffDeCola/my-systemverilog-examples#systems)
  * MICROPROCESSORS

Documentation and reference,

* [iverilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/iverilog-cheat-sheet)
  is a free verilog simulator and synthesis tool
* [GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
  is a free waveform viewer
* My cheat sheet on
  [SystemVerilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/development/languages/systemverilog-cheat-sheet)
  
[GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)

## SYSTEMVERILOG EXAMPLES

_All sections in alphabetical order.
Each example uses
[iverilog](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/iverilog-cheat-sheet)
to simulate and
[GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
to view the output._

### BASIC CODE

* COMBINATIONAL LOGIC

  * [and-gate](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-code/combinational-logic/and-gate)

    _A few different ways to model an AND gate._

  * [simple-and-or-not-configuration](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-code/combinational-logic/simple-and-or-not-configuration)

    _A few different ways to model this simple combinational logic._

* SEQUENTIAL LOGIC

  * [d-flip-flop](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-code/sequential-logic/d-flip-flop)

     _A basic d-flip-flop._

### COMBINATIONAL LOGIC

* DATA OPERATORS

  * [2-bit-full-adder](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/combinational-logic/data-operators/2-bit-full-adder)

    _A 2-bit full adder._

  * [2-bit-half-adder](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/combinational-logic/data-operators/2-bit-half-adder)

    _A 2-bit half-adder._

* DECODERS & ENCODERS

  * [tbd](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic/half-adder)

    _Coming soon._

* MULTIPLEXERS & DEMULTIPLEXERS

  * [tbd](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic/half-adder)

    _Coming soon._

* SHIFTERS

  * [tbd](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic/half-adder)

    _Coming soon._

### SEQUENTIAL LOGIC

* ARBITERS

  * [priority-arbiter](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/sequential-logic/arbiters/priority-arbiter)

     _Allowing one device access to a shared resource (Taking in N device
     requests, granting access to only one)._

### SYSTEMS

* MICROPROCESSORS

  * [programable-8-bit-microprocessor](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/systems/programable-8-bit-microprocessor)

    _A programable 8-bit microprocessor._

## SCRIPT TO LAUNCH GTKWAVE

To make things easier when viewing a waveform, I wrote a script that will launch
[GTKWave](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/hardware/tools/simulation/gtkwave-cheat-sheet)
with your saved `*.gtkw` file
from Windows WSL, macOS or Linux (Whatever you use).

The script is
[launch-gtkwave.sh](launch-GTKWave-script/launch-gtkwave.sh).

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
