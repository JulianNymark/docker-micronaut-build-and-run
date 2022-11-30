#!/usr/bin/env bash

# run micronaut project! (with swagger documentation)
cd helloworld
./gradlew run

# prevent container from finishing (and being killed)
tail -F /dev/null
