#!/bin/bash

dd if=/dev/urandom bs=4 count=16 status=none | od -A none -t u4

exit 0

