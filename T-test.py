import glob
import os
import csv
import numpy as np

# outfiles = {}

# for folder in glob.glob('./learnability_*'):
#     try:
#         os.chdir(f"{folder}")
#         print(folder)
#     except:
#         continue
#     values = []
#     values_list = []
    
#     for filename in glob.glob("./*"):
#         try:
#             values = []
#             with open(filename, newline='') as csvfile:
#                 reader = csv.reader(csvfile, delimiter='\n', quotechar='|')
#                 for row in reader:
#                     values.append(float(row[0]))
#             values_list.append(values)
#         except:
#             print("error")
#             print(filename)
#     try:
#         outfiles[folder] = {}
#         outfiles[folder]["values"] = np.asarray(values_list)[:,99]
#         #outfiles[folder]["std"] = np.std(np.asarray(values_list), axis=0) / np.sqrt(len(values_list))
#         os.chdir("../")
#     except:
#         print(filename)
#         continue

#     os.chdir("learnability-Ttest/")
#     for folder in outfiles:
#         np.savetxt(f"{folder}.pkl" ,outfiles[folder]["values"],  delimiter=',')
#         #np.savetxt(f"{folder}_errorbar.pkl" ,outfiles[folder]["std"],  delimiter=',')
#     os.chdir("../")

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

    if not os.path.exists('generalization-Ttest/'):
        os.makedirs('generalization-Ttest/')
    os.chdir("generalization-Ttest/")
    for pattern in outfiles:
        data=np.asarray(outfiles[pattern])[:500]
        values = data[:,99]
        #std = np.std(data, axis=0) / np.sqrt(len(data))
        modifyied_pattern = pattern.replace("'","\"").replace(" ", "").replace("-train","").replace("_end", "")
        np.savetxt(f"{folder}{modifyied_pattern}.pkl" ,values,  delimiter=',')
       # np.savetxt(f"{folder}{modifyied_pattern}_errorbar.pkl" ,std,  delimiter=',')
    os.chdir("../")

