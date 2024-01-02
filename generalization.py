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
    repeat_grid = folder.split("_")[3]
    for filename in glob.glob("./*"):
        values = []
        pattern = f"_{repeat_grid}" + re.findall(r'-train.*?_end', filename)[0]    
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
        data=np.asarray(outfiles[pattern])[:500]
        values = np.sum(data,0)/len(data)
        std = np.std(data, axis=0) / np.sqrt(len(data))
        modifyied_pattern = pattern.replace("'","\"").replace(" ", "").replace("-train","").replace("_end", "")
        np.savetxt(f"{folder}{modifyied_pattern}.pkl" ,values,  delimiter=',')
        np.savetxt(f"{folder}{modifyied_pattern}_errorbar.pkl" ,std,  delimiter=',')
    os.chdir("../")