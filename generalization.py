import glob
import os
import csv
import numpy as np
import re



for folder in glob.glob('./generalization_overtrained_v3_{"mean":0,"std":0}_EgreedyAgent'):
    try:
        os.chdir(f"{folder}")
        print(folder)
    except:
        continue
    values = []
    values_list = []
    outfiles = {}
    for filename in glob.glob("./*"):
        values = []
        
        pattern0 = re.findall(r'{.*?}', filename)[0]
        pattern = re.findall(r'{.*?}', filename)[1]
    
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
        np.savetxt(f"{folder}{pattern}.pkl" ,values,  delimiter=',')
    
    os.chdir("../")
        