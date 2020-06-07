#!/usr/local/bin/bash
pmset -g batt | grep -Eo "\d+%"
