FROM ghcr.io/gleam-lang/gleam:v0.24.0-erlang-alpine

  # install packages required to run the tests
RUN apk add --no-cache jq coreutils

WORKDIR /opt/test-runner
COPY . .

# Download the used Gleam packages eagerly as the test runner will not have
# network access to do so.
RUN cd packages && gleam deps download

ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
