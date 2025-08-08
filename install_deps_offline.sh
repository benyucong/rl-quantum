#!/bin/bash

module --quiet purge
ml cuda/12.6 cudnn mkl impi intel hdf5 python/3.11.5-gcc gcc/11.4.0 ninja

rm -rf venv
python3 -m venv venv

source venv/bin/activate

export PYTHONPATH=/gpfs/projects/ehpc95/rl_quantum/venv/lib/python3.11/site-packages

pip install --no-index --find-links="rlhf_qt_packs" -r requirements.txt
cd PyExt
pip install --no-index --find-links="../rlhf_qt_packs" -e .
cd ..
cd rl-quantum
pip install --no-index --find-links="../rlhf_qt_packs" -e "verl[vllm]"
pip install --no-index --find-links="../rlhf_qt_packs" -e ".[torl]"
cd ..
