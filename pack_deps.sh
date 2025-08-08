#!/bin/bash

module purge
ml cuda python
rm -rf venv rlhf_qt_packs
python3 -m venv venv

source venv/bin/activate
pip install -U pip wheel setuptools
cd PyExt
pip install -e .
cd ..
cd rl-quantum
pip install "cudaq==0.10.0" tensorboard qiskit qiskit_aer qiskit_algorithms qiskit_qasm3_import
pip install -e "verl[vllm]"
pip install -e ".[torl]"
cd ..
pip freeze > requirements.txt
pip download -d rlhf_qt_packs -r requirements.txt
