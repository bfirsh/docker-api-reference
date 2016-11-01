# A better Docker Remote API reference

A work in progress. It produces this: https://bfirsh.github.io/docker-api-reference/

See https://github.com/docker/engine-api/issues/77 for background.

## Usage

Install Dobi, the build tool:

    curl -L -o /usr/local/bin/dobi "https://github.com/dnephin/dobi/releases/download/v0.8/dobi-$(uname -s)"; chmod +x /usr/local/bin/dobi

To view docs, run `dobi preview` and go to http://localhost

To validate the Swagger configuration, run `dobi validate`.

To generate a `swagger.json` file, run `dobi swagger.json`.

