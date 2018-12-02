#!/bin/bash

socat -v -v tcp-listen:8080,fork,reuseaddr exec:/bin/rng.sh &
echo $! | tee /run/socat.pid
