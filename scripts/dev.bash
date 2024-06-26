#!/usr/bin/env bash

templ generate \
    --watch \
    --proxy="http://localhost:6969" \
    --cmd="scripts/run.bash"
