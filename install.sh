#!/bin/bash
python3 -m venv venv
. venv/bin/activate
make install
make lint