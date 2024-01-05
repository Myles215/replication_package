import pandas as pd
import argparse
import pprint
import matplotlib.pyplot as plt
import matplotlib as mpl
import scipy.stats as stats
import statistics
import seaborn as sns

import math
import numpy as np
#from scipy.stats import pearsonr
import random
#from scipy.stats import kendalltau


pp = pprint.PrettyPrinter(indent=4)
font = {'family' : 'sans-serif',
        'weight' : 'bold',
        'size'   : 22}
plt.rc('font', **font)
plt.figure().subplots_adjust(bottom=0.17,left=0.15) # adjust margins to stop cropping of axis titles



parser = argparse.ArgumentParser(description="Just an example",
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument("-r", "--repeats", type=int, default=20)
parser.add_argument("-tj", "--typejfr", default="JFR17")   # prefix for outputs of data set
#parser.add_argument("src", help="Source location")
parser.add_argument("out", default="jcodec", help="Output filename base")
parser.add_argument("baseJFR", default="/home/sbr/Dropbox/current_pubs_and_pres/GinProfilerJournal/JcodecJFR/jcodec.Profiler_output_")
args = parser.parse_args()
config = vars(args)



# this script looks at all repeats in the named file, and generates two plots:
#  - a grid showing whether a test was selected or not at each repeat
#  - the same, but shaded to indicate the rank allocated to each test each repeat
# Aim is to highlight consistency of rankings over time (since we don't reboot)

# columns are: Project, MethodIndex, Method, Count, Tests



###################################### load data ##############################################
# list of data frames (1 per repeat)
dataJFR = []

# methods appearing in any run: keys are methodnames, values are counts
allMethodsJFR = {}
allMethodsHP = {}

for rpt in range(1, config['repeats'] + 1):
    df = pd.read_csv(config['baseJFR'] + str(rpt) + '.csv')
    df.reset_index()
    dataJFR.append(df)
    for index, row in  df.iterrows():
        allMethodsJFR[row['Method']] = allMethodsJFR.get(row['Method'], 0) + 1

print("Found", str(len(allMethodsJFR)), "methods...")

###################################### method rank grid ##############################################


# method ranks. make a new list for each repeat. filter existing pandas dataframe by medianMethodsJFR and intersectionMethodsJFR (no filtering for "all" ranks)
# these are 2D lists; dim1 is repeat number, dim2 is the list of methods with top-ranked first
#df = dataJFR[1]
#print(df[df['Method'].isin(intersectionMethodsJFR)]["Method"].values.tolist())
ranksAllMethodsJFR = []
for rpt in range(config['repeats']):
    df = dataJFR[rpt]
    ranksAllMethodsJFR.append(df["Method"].values.tolist())

allRanks = []

# use index to get rank number
maxRank = 0
for method in allMethodsJFR:
    ranks = []
    for rpt in range(config['repeats']):
        if method in ranksAllMethodsJFR[rpt]:
            rank = ranksAllMethodsJFR[rpt].index(method) + 1
            ranks.append(rank)
            maxRank = max(maxRank, rank)
        else:
            ranks.append(-1)
    #print(ranks)
    allRanks.append(ranks)

print("Max rank:", maxRank)

# flip ranks? most important currently 1
for i in range(len(allRanks)):
    for j in range(len(allRanks[i])):
        if allRanks[i][j] < 0:
            allRanks[i][j] = maxRank + 1 # +1 as this was not ranked at all


###################################### up to here
# now: find a suitable plot function
# https://matplotlib.org/stable/gallery/images_contours_and_fields/image_annotated_heatmap.html   ?
# find min/max rank - normalise
# loop over ranksAllMethodsJFR, and shade using normalise values, and >0


ylabels = []*len(allMethodsJFR) # range(len(allMethodsJFR)) #allMethodsJFR
xlabels = range(config['repeats'])

values = np.array(allRanks)

# figsize 4x10 inches works well for 100 methods
# stretch if different...
figHeight = (len(allMethodsJFR) / 100) * 10


fig, ax = plt.subplots(figsize=(4,figHeight)) # figsize in inches


# https://seaborn.pydata.org/generated/seaborn.heatmap.html
sns.heatmap(values, cmap='cividis', square=True, cbar=False, xticklabels=[1,"","","",5,"","","","",10,"","","","",15,"","","","",20])   # linewidth=0.5 adds whitespace
plt.xlabel("Repeat")
plt.ylabel("Method #")

ax.set_title("Method ranks / run")
fig.tight_layout()
#plt.show()
print("Saving heatmap...")
plt.savefig(config['out'] + "_heatmap_methodRanks_" + config['typejfr'] + ".eps", format="eps", orientation="portrait")


print("Done.")
