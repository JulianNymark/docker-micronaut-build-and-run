#!/usr/bin/env bash

export PATH="$PATH:$HOME/.micronaut/micronaut-cli-3.7.5-SNAPSHOT/bin"

mn create-app -f openapi --lang kotlin helloworld
