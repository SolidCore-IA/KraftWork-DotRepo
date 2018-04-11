#!/bin/bash
#uptime -p | awk '{print $2; print $4}' | tr '\n' ':' | rev | cut -c 2- | rev
#
uptime -p
