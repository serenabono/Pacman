import glob
import os
import csv
import numpy as np

outfiles = {}

for folder in glob.glob('./learnability_v3_{"mean":0,"std":0.00000000001}_noiserange_0-500_PacmanDQN'):
    try:
        os.chdir(f"{folder}")
        print(folder)
    except:
        continue
    values = []
    values_list = []
    for filename in glob.glob("./*"):
        values = []
        with open(filename, newline='') as csvfile:
            reader = csv.reader(csvfile, delimiter='\n', quotechar='|')
            for row in reader:
                values.append(float(row[0]))
        values_list.append(values)
    values_list = np.sum(np.asarray(values_list),0)/len(np.asarray(values_list))
    outfiles[folder] = values_list
    os.chdir("../")

    os.chdir("learnability/")
    for folder in outfiles:
        np.savetxt(f"{folder}.pkl" ,outfiles[folder],  delimiter=',')
    os.chdir("../")
        