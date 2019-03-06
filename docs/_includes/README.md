
# SYSTEMVERILOG EXAMPLES

_All sections in alphabetical order._

* [basic-example](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/basic-example)

   _To get you up and running._

## MY GITHUB WEBPAGE IS UPDATED USING CONCOURSE

For fun, I use concourse to update
[my-systemverilog-examples GitHub Webpage](https://jeffdecola.github.io/my-systemverilog-examples/)
and alert me of the changes via repo status and slack.

The github webpage update is accomplished this by copying and editing
this `README.md` file to `/docs/_includes/README.md`.
You can see the concourse task (a shell script)
[here](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/ci/scripts/readme-github-pages.sh).

A pipeline file [pipeline.yml](https://github.com/JeffDeCola/my-systemverilog-examples/tree/master/ci/pipeline.yml)
shows the entire ci flow. Visually, it looks like,

![IMAGE - my-systemverilog-examples concourse ci pipeline - IMAGE](pics/my-systemverilog-examples-pipeline.jpg)

For more information on using concourse for continuous integration,
refer to my cheat sheet on [concourse](https://github.com/JeffDeCola/my-cheat-sheets/tree/master/software/operations-tools/continuous-integration-continuous-deployment/concourse-cheat-sheet).
