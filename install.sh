#!/bin/bash
python3 -m venv venv
. venv/bin/activate
make install
#make lint
pylint --disable=R,C,W1203,W1309 app.py
