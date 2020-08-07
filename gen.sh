#!/bin/bash
curr_date=$(date +%Y-%m-%d)
curr_file="$(date +%Y%m)"
wget "http://dados.cvm.gov.br/dados/FI/DOC/INF_DIARIO/DADOS/inf_diario_fi_${curr_file}.csv" -O data.csv
python3 ./parser.py data.csv
git add data
git tag -a ${curr_date} -m "Updated values: ${curr_date}"
git commit data -m "Updated values: ${curr_date}"
