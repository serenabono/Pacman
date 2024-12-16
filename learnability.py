import glob
import os
import csv
import numpy as np

outfiles = {}

for folder in glob.glob('./learnability_*'):
    try:
        os.chdir(f"{folder}")
        print(folder)
    except:
        continue
    values = []
    values_list = []
    
    for filename in glob.glob("./*"):
        try:
            values = []
            with open(filename, newline='') as csvfile:
                reader = csv.reader(csvfile, delimiter='\n', quotechar='|')
                for row in reader:
                    values.append(float(row[0]))
            values_list.append(values)
        except:
            print("error")
            print(filename)
    try:
        outfiles[folder] = {}
        outfiles[folder]["values"] = np.sum(np.asarray(values_list),0)/len(np.asarray(values_list))
        outfiles[folder]["std"] = np.std(np.asarray(values_list), axis=0) / np.sqrt(len(values_list))
        os.chdir("../")
    except:
        print(filename)
        continue

    os.chdir("learnability/")
    for folder in outfiles:
        np.savetxt(f"{folder}.pkl" ,outfiles[folder]["values"],  delimiter=',')
        np.savetxt(f"{folder}_errorbar.pkl" ,outfiles[folder]["std"],  delimiter=',')
    os.chdir("../")
        