import glob
import os
import csv
import numpy as np
import re



for folder in glob.glob('./generalization_*'):
    try:
        os.chdir(f"{folder}")
        print(folder)
    except:
        continue
    values = []
    outfiles = {}
    for filename in glob.glob("./*"):
        values = []
        pattern = re.findall(r'-train.*?_end', filename)[0]
    
        with open(filename, newline='') as csvfile:
            reader = csv.reader(csvfile, delimiter='\n', quotechar='|')
            for row in reader:
                values.append(float(row[0]))
        if pattern not in outfiles:
            outfiles[pattern] = []
        outfiles[pattern].append(values)
    
    os.chdir("../")

    if not os.path.exists('generalization/'):
        os.makedirs('generalization/')
    os.chdir("generalization/")
    for pattern in outfiles:
        values = np.sum(np.asarray(outfiles[pattern]),0)/len(np.asarray(outfiles[pattern]))
        modifyied_pattern = pattern.replace("'","\"").replace(" ", "").replace("-train","").replace("_end", "")
        np.savetxt(f"{folder[:-1]}{modifyied_pattern}.pkl" ,values,  delimiter=',')
    os.chdir("../")