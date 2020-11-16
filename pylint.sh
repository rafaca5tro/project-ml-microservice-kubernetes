#!/bin/bash
python3 -m venv venv
. venv/bin/activate
pip3 install pylint
make lint