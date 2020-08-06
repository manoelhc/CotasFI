#!/bin/bash
curr_date=$(date +%Y-%m-%d)
wget http://dados.cvm.gov.br/dados/FI/DOC/INF_DIARIO/DADOS/inf_diario_fi_202007.csv -O data.csv
git checkout -b ${curr_date}
python3 ./parser.py data.csv
git commit data -m "Add ${curr_date} prices"
git push
