#!/bin/bash

gtts-cli -o sounds/copy-started.mp3 "   All Copy operations has started successfully"
gtts-cli -o sounds/measurement-started.mp3 "  All devices mounted successfully, a speed test will be applied to all the connected devices"

minutes=20
hours=1
# esa stands for estimated time for arrival
gtts-cli -o esa.mp3 "The estimated time to complete all the copy operations is $hours and $minutes"
