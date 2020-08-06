import csv
import sys
import re
import os
import io


def save_values(cnpj, value, last_update):
    cnpj = re.sub(r"[./-]", '', cnpj)
    path = f"data/{cnpj[0:1]}/{cnpj[1:3]}/{cnpj[3:]}/"
    os.makedirs(path, exist_ok=True)
    with open(f"{path}/values.json", "+w") as f:
        f.write(
            '{"value":"' + value + '","last_update":"' + last_update + '"}')
    with open(f"data/hf.list", "a") as f:
        f.write(f"{cnpj}\n")


with open(sys.argv[1], newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=';')
    latest = None
    latest_row = []
    for row in spamreader:
        if latest != row[0]:
            if latest is not None and latest[0] != 'C':
                save_values(latest, latest_row[3], latest_row[1])
            latest = row[0]
        latest_row = row
    save_values(latest, latest_row[3], latest_row[1])
