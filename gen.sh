#!/bin/bash
curr_date=$(date +%Y-%m-%d)
wget http://dados.cvm.gov.br/dados/FI/DOC/INF_DIARIO/DADOS/inf_diario_fi_202007.csv -O data.csv
python3 ./parser.py data.csv
git tag -a ${curr_date} -m "Updated values: ${curr_date}"
git push
