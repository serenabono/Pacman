import glob
import os
import csv
import numpy as np
import re

outfiles = {}

for folder in glob.glob('./distance_*'):
    try:
        os.chdir(f"{folder}")
        print(folder)
    except:
        continue
    values = []
    outfiles = {}

    for filename in glob.glob("./*"):
        values = []
        pattern = re.findall(r'{.*?}', filename)[1]
        with open(filename, newline='') as csvfile:
            reader = csv.reader(csvfile, delimiter='\n', quotechar='|')
            for row in reader:
                line = []
                for el in row[0].split(","):
                    line.append(float(el))
                values.append(line)
        if pattern not in outfiles:
            outfiles[pattern] = []
        outfiles[pattern].append(values)
    os.chdir("../")

    if not os.path.exists('distance/'):
        os.makedirs('distance/')
    os.chdir("distance/")
    for pattern in outfiles:
        values = np.sum(np.asarray(outfiles[pattern]),0)/len(np.asarray(outfiles[pattern]))
        modifyied_pattern = pattern.replace("'","\"").replace(" ", "").replace("-train","").replace("_end", "")
        np.savetxt(f"{folder[:-1]}{modifyied_pattern}.pkl" ,values,  delimiter=',')
    os.chdir("../")
        