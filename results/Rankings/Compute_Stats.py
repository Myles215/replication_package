import pandas as pd
import argparse
import pprint
import matplotlib.pyplot as plt
import scipy.stats as stats
import statistics

import math
import numpy as np
from scipy.stats import pearsonr
import random
from scipy.stats import kendalltau


pp = pprint.PrettyPrinter(indent=4)

parser = argparse.ArgumentParser(description="Just an example",
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument("-r", "--repeats", type=int, default=20)
parser.add_argument("-tj", "--typejfr", default="JFR17")   # prefix for outputs of first data set
parser.add_argument("-th", "--typehprof", default="HPROF")  # prefix for outputs of second data set
#parser.add_argument("src", help="Source location")
parser.add_argument("out", default="jcodec", help="Output filename base")
parser.add_argument("baseJFR", default="/home/sbr/Dropbox/current_pubs_and_pres/GinProfilerJournal/JcodecJFR/jcodec.Profiler_output_")
parser.add_argument("baseHP", default="/home/sbr/Dropbox/current_pubs_and_pres/GinProfilerJournal/jcodecHPROF/jcodec.Profiler_output_")
args = parser.parse_args()
config = vars(args)



# what stats do we want?
# for one profiler:
#   get ranked list of methods in at least all/half/one run DONE
#   distribution of method appearances (how much noise is there?) x-axis is appearances, y-axis is number of methods appearing that often DONE
#   for the intersection (appearing in all) and median (half list): # i.e., 30 and 15 rankings
#       compute overlap between all pairs of rankings for this profiler. distribution + summary stats for overlaps. DONE
#       repeat, but this time with medians from other profilers DONE
#       compute average ranking for each profiler and do scatter plots   DONE
#       ignoring ranks, for each profiler count and % of methods appearing in both profilers and just 1   DONE

# which tests are identified? (for a given method, unique tests identified by profiler A, profiler B, and both)
# can do same as above. should either use methods identified by all runs or median (if that's fairly big)
# then for each method, look at how much variation in tests there are. distribution showing how often tests are picked up (hopefully mostly all-the-time)

# columns are: Project, MethodIndex, Method, Count, Tests


#############################################
def rbo(S,T, p= 0.9):
    """ Takes two lists S and T of any lengths and gives out the RBO Score
    Parameters
    ----------
    S, T : Lists (str, integers)
    p : Weight parameter, giving the influence of the first d
        elements on the final score. p<0<1. Default 0.9 give the top 10 
        elements 86% of the contribution in the final score.
    
    Returns
    -------
    Float of RBO score
    """
    
    # Fixed Terms
    k = max(len(S), len(T))
    x_k = len(set(S).intersection(set(T)))
    
    summation_term = 0

    # Loop for summation
    # k+1 for the loop to reach the last element (at k) in the bigger list    
    for d in range (1, k+1): 
            # Create sets from the lists
            set1 = set(S[:d]) if d < len(S) else set(S)
            set2 = set(T[:d]) if d < len(T) else set(T)
            
            # Intersection at depth d
            x_d = len(set1.intersection(set2))

            # Agreement at depth d
            a_d = x_d/d   
            
            # Summation
            summation_term = summation_term + math.pow(p, d) * a_d

    # Rank Biased Overlap - extrapolated
    rbo_ext = (x_k/k) * math.pow(p, k) + ((1-p)/p * summation_term)

    return rbo_ext


###################################### load data ##############################################
# list of data frames (1 per repeat)
dataJFR = []
dataHP = []

# methods appearing in any run: keys are methodnames, values are counts
allMethodsJFR = {}
allMethodsHP = {}

for rpt in range(1, config['repeats'] + 1):
    df = pd.read_csv(config['baseJFR'] + str(rpt) + '.csv')
    df.reset_index()
    dataJFR.append(df)
    for index, row in  df.iterrows():
        allMethodsJFR[row['Method']] = allMethodsJFR.get(row['Method'], 0) + 1

for rpt in range(1, config['repeats'] + 1):
    df = pd.read_csv(config['baseHP'] + str(rpt) + '.csv')
    df.reset_index()
    dataHP.append(df)
    for index, row in df.iterrows():
        allMethodsHP[row['Method']] = allMethodsHP.get(row['Method'], 0) + 1

###################################### sub lists ##############################################

# methods appearing in at least half of the runs, with counts
medianMethodsJFR = {}
medianMethodsHP = {}

# methods appearing in all the runs, with counts
intersectionMethodsJFR = {}
intersectionMethodsHP = {}

for key, value in allMethodsJFR.items():
    if (value >= config['repeats'] / 2):
        medianMethodsJFR[key] = value
    if (value == config['repeats']):
        intersectionMethodsJFR[key] = value

for key, value in allMethodsHP.items():
    if (value >= config['repeats'] / 2):
        medianMethodsHP[key] = value
    if (value == config['repeats']):
        intersectionMethodsHP[key] = value

# method ranks. make a new list for each repeat. filter existing pandas dataframe by medianMethodsJFR and intersectionMethodsJFR (no filtering for "all" ranks)
# these are 2D lists; dim1 is repeat number, dim2 is the list of methods with top-ranked first
#df = dataJFR[1]
#print(df[df['Method'].isin(intersectionMethodsJFR)]["Method"].values.tolist())
ranksAllMethodsJFR = []
for rpt in range(config['repeats']):
    df = dataJFR[rpt]
    ranksAllMethodsJFR.append(df["Method"].values.tolist())

ranksAllMethodsHP = []
for rpt in range(config['repeats']):
    df = dataHP[rpt]
    ranksAllMethodsHP.append(df["Method"].values.tolist())


ranksMedianMethodsJFR = []
for rpt in range(config['repeats']):
    df = dataJFR[rpt]
    ranksMedianMethodsJFR.append(df[df['Method'].isin(medianMethodsJFR)]["Method"].values.tolist())

ranksMedianMethodsHP = []
for rpt in range(config['repeats']):
    df = dataHP[rpt]
    ranksMedianMethodsHP.append(df[df['Method'].isin(medianMethodsHP)]["Method"].values.tolist())

ranksIntersectionMethodsJFR = []
for rpt in range(config['repeats']):
    df = dataJFR[rpt]
    ranksIntersectionMethodsJFR.append(df[df['Method'].isin(intersectionMethodsJFR)]["Method"].values.tolist())

ranksIntersectionMethodsHP = []
for rpt in range(config['repeats']):
    df = dataHP[rpt]
    ranksIntersectionMethodsHP.append(df[df['Method'].isin(intersectionMethodsHP)]["Method"].values.tolist())

# average rankings
# a dictionary, with the mean rank against each method
averageRanksUnionMethodsJFR = {}
for method in allMethodsJFR:
    ranks = []
    for rpt in range(config['repeats']):
        if method in ranksAllMethodsJFR[rpt]:
            ranks.append(ranksAllMethodsJFR[rpt].index(method) + 1)
    averageRanksUnionMethodsJFR[method] = statistics.mean(ranks)

averageRanksUnionMethodsHP = {}
for method in allMethodsHP:
    ranks = []
    for rpt in range(config['repeats']):
        if method in ranksAllMethodsHP[rpt]:
            ranks.append(ranksAllMethodsHP[rpt].index(method) + 1)
    averageRanksUnionMethodsHP[method] = statistics.mean(ranks)


averageRanksMedianMethodsJFR = {}
for method in medianMethodsJFR:
    ranks = []
    for rpt in range(config['repeats']):
        if method in ranksMedianMethodsJFR[rpt]:
            ranks.append(ranksMedianMethodsJFR[rpt].index(method) + 1)
    averageRanksMedianMethodsJFR[method] = statistics.mean(ranks)

averageRanksMedianMethodsHP = {}
for method in medianMethodsHP:
    ranks = []
    for rpt in range(config['repeats']):
        if method in ranksMedianMethodsHP[rpt]:
            ranks.append(ranksMedianMethodsHP[rpt].index(method) + 1)
    averageRanksMedianMethodsHP[method] = statistics.mean(ranks)

averageRanksIntersectionMethodsJFR = {}
for method in intersectionMethodsJFR:
    ranks = []
    for rpt in range(config['repeats']):
        if method in ranksIntersectionMethodsJFR[rpt]:
            ranks.append(ranksIntersectionMethodsJFR[rpt].index(method) + 1)
    averageRanksIntersectionMethodsJFR[method] = statistics.mean(ranks)

averageRanksIntersectionMethodsHP = {}
for method in intersectionMethodsHP:
    ranks = []
    for rpt in range(config['repeats']):
        if method in ranksIntersectionMethodsHP[rpt]:
            ranks.append(ranksIntersectionMethodsHP[rpt].index(method) + 1)
    averageRanksIntersectionMethodsHP[method] = statistics.mean(ranks)


###################################### basic stats ##############################################

# print counts for all methods
#pp.pprint(allMethodsJFR)

# distributions of method appearances
plt.hist(allMethodsJFR.values(), bins=config['repeats'])
#plt.show()
plt.savefig(config['out'] + "_histogram_methodCounts_" + config['typejfr'] + ".eps", format="eps")
plt.clf()

plt.hist(allMethodsHP.values(), bins=config['repeats'])
plt.savefig(config['out'] + "_histogram_methodCounts_" + config['typehprof'] + ".eps", format="eps")
plt.clf()

#pp.pprint(intersectionMethodsJFR)
#print("============")
#pp.pprint(intersectionMethodsHP)


print("Number of methods appearing in union ", config['typejfr'], " list:", len(allMethodsJFR))
print("Number of methods appearing in union ", config['typehprof'], " list:", len(allMethodsHP))


print("Number of methods appearing in median ", config['typejfr'], " list:", len(medianMethodsJFR))
print("Number of methods appearing in median ", config['typehprof'], " list:", len(medianMethodsHP))

print()

print("Number of methods appearing in median ", config['typejfr'], " list but not ", config['typehprof'], ":", len((set(medianMethodsJFR) - set(medianMethodsHP))), round(100*len((set(medianMethodsJFR) - set(medianMethodsHP))) / len(medianMethodsJFR),1), "%")
print("Number of methods appearing in median ", config['typehprof'], " list but not ", config['typejfr'], ":", len((set(medianMethodsHP) - set(medianMethodsJFR))), round(100*len((set(medianMethodsHP) - set(medianMethodsJFR))) / len(medianMethodsHP),1), "%")
print("Number of methods appearing in both median ", config['typejfr'], " list and ", config['typehprof'], ":", len((set(medianMethodsHP).intersection(set(medianMethodsJFR)))))

print()
print("Number of methods appearing in intersection ", config['typejfr'], " list:", len(intersectionMethodsJFR))
print("Number of methods appearing in intersection ", config['typehprof'], " list:", len(intersectionMethodsHP))

print()
print("Number of methods appearing in intersection ", config['typejfr'], " list but not ", config['typehprof'], ":", len((set(intersectionMethodsJFR) - set(intersectionMethodsHP))), round(100*len((set(intersectionMethodsJFR) - set(intersectionMethodsHP))) / len(intersectionMethodsJFR),1), "%")
print("Number of methods appearing in intersection ", config['typehprof'], " list but not ", config['typejfr'], ":", len((set(intersectionMethodsHP) - set(intersectionMethodsJFR))), round(100*len((set(intersectionMethodsHP) - set(intersectionMethodsJFR))) / len(intersectionMethodsHP),1), "%")
print("Number of methods appearing in both intersection ", config['typejfr'], " list and ", config['typehprof'], ":", len((set(intersectionMethodsHP).intersection(set(intersectionMethodsJFR)))))

###################################### overlaps ##############################################

# these demo the rbo calc: perfect match, lowest ranks mismatch, highest ranks mismatch
#print(rbo(["apple","banana","carrot","fish","grape"],["apple","banana","carrot","fish","grape"]))
#print(rbo(["apple","banana","carrot","fish","grape"],["apple","banana","carrot","grape","fish"]))
#print(rbo(["apple","banana","carrot","fish","grape"],["banana","apple","carrot","fish","grape"]))

#print(rbo(ranksIntersectionMethodsJFR[1],ranksIntersectionMethodsJFR[2]))
#print(rbo(ranksIntersectionMethodsHP[1],ranksIntersectionMethodsHP[2]))
#print(rbo(ranksIntersectionMethodsJFR[1],ranksIntersectionMethodsHP[1],p=0.9)) # p=0.9 is default (controls weighting of highest ranks)
#
#print(rbo(ranksMedianMethodsJFR[1],ranksMedianMethodsJFR[2]))
#print(rbo(ranksMedianMethodsHP[1],ranksMedianMethodsHP[2]))
#print(rbo(ranksMedianMethodsJFR[1],ranksMedianMethodsHP[1],p=0.9))

rboWithinAllMethodsJFR = []
for rpt1 in range(config['repeats']):
    for rpt2 in range(config['repeats']):
        if (rpt1 != rpt2):
            rboWithinAllMethodsJFR.append(rbo(ranksAllMethodsJFR[rpt1],ranksAllMethodsJFR[rpt2]))

rboWithinAllMethodsHP = []
for rpt1 in range(config['repeats']):
    for rpt2 in range(config['repeats']):
        if (rpt1 != rpt2):
            rboWithinAllMethodsHP.append(rbo(ranksAllMethodsHP[rpt1],ranksAllMethodsHP[rpt2]))

rboComparingAllMethodsJFRvsHP = []
for rpt1 in range(config['repeats']):
    for rpt2 in range(config['repeats']):
        rboComparingAllMethodsJFRvsHP.append(rbo(ranksAllMethodsJFR[rpt1],ranksAllMethodsHP[rpt2]))

rboWithinMedianMethodsJFR = []
for rpt1 in range(config['repeats']):
    for rpt2 in range(config['repeats']):
        if (rpt1 != rpt2):
            rboWithinMedianMethodsJFR.append(rbo(ranksMedianMethodsJFR[rpt1],ranksMedianMethodsJFR[rpt2]))

rboWithinMedianMethodsHP = []
for rpt1 in range(config['repeats']):
    for rpt2 in range(config['repeats']):
        if (rpt1 != rpt2):
            rboWithinMedianMethodsHP.append(rbo(ranksMedianMethodsHP[rpt1],ranksMedianMethodsHP[rpt2]))

rboComparingMedianMethodsJFRvsHP = []
for rpt1 in range(config['repeats']):
    for rpt2 in range(config['repeats']):
        rboComparingMedianMethodsJFRvsHP.append(rbo(ranksMedianMethodsJFR[rpt1],ranksMedianMethodsHP[rpt2]))

rboWithinIntersectionMethodsJFR = []
for rpt1 in range(config['repeats']):
    for rpt2 in range(config['repeats']):
        if (rpt1 != rpt2):
            rboWithinIntersectionMethodsJFR.append(rbo(ranksIntersectionMethodsJFR[rpt1],ranksIntersectionMethodsJFR[rpt2]))

rboWithinIntersectionMethodsHP = []
for rpt1 in range(config['repeats']):
    for rpt2 in range(config['repeats']):
        if (rpt1 != rpt2):
            rboWithinIntersectionMethodsHP.append(rbo(ranksIntersectionMethodsHP[rpt1],ranksIntersectionMethodsHP[rpt2]))

rboComparingIntersectionMethodsJFRvsHP = []
for rpt1 in range(config['repeats']):
    for rpt2 in range(config['repeats']):
        rboComparingIntersectionMethodsJFRvsHP.append(rbo(ranksIntersectionMethodsJFR[rpt1],ranksIntersectionMethodsHP[rpt2]))

print()
print("RBO within union rank lists for ", config['typejfr'], "... median: ", round(statistics.median(rboWithinAllMethodsJFR),3), " IQR:", round(stats.iqr(rboWithinAllMethodsJFR),3))
print("RBO within union rank lists for ", config['typehprof'], "... median: ", round(statistics.median(rboWithinAllMethodsHP),3), " IQR:", round(stats.iqr(rboWithinAllMethodsHP),3))
print("RBO comparing union rank lists ", config['typejfr'], " vs ", config['typehprof'], "... median: ", round(statistics.median(rboComparingAllMethodsJFRvsHP),3), " IQR:", round(stats.iqr(rboComparingAllMethodsJFRvsHP),3))
print("RBO within median rank lists for ", config['typejfr'], "... median: ", round(statistics.median(rboWithinMedianMethodsJFR),3), " IQR:", round(stats.iqr(rboWithinMedianMethodsJFR),3))
print("RBO within median rank lists for ", config['typehprof'], "... median: ", round(statistics.median(rboWithinMedianMethodsHP),3), " IQR:", round(stats.iqr(rboWithinMedianMethodsHP),3))
print("RBO comparing median rank lists ", config['typejfr'], " vs ", config['typehprof'], "... median: ", round(statistics.median(rboComparingMedianMethodsJFRvsHP),3), " IQR:", round(stats.iqr(rboComparingMedianMethodsJFRvsHP),3))
print("RBO within intersection rank lists for ", config['typejfr'], "... median: ", round(statistics.median(rboWithinIntersectionMethodsJFR),3), " IQR:", round(stats.iqr(rboWithinIntersectionMethodsJFR),3))
print("RBO within intersection rank lists for ", config['typehprof'], "... median: ", round(statistics.median(rboWithinIntersectionMethodsHP),3), " IQR:", round(stats.iqr(rboWithinIntersectionMethodsHP),3))
print("RBO comparing intersection rank lists ", config['typejfr'], " vs ", config['typehprof'], "... median: ", round(statistics.median(rboComparingIntersectionMethodsJFRvsHP),3), " IQR:", round(stats.iqr(rboComparingIntersectionMethodsJFRvsHP),3))
plt.hist(rboWithinAllMethodsJFR, bins=config['repeats'])
plt.savefig(config['out'] + "_histogram_rboWithinRepeatsForUnionMethods_" + config['typejfr'] + ".eps", format="eps")
plt.clf()
plt.hist(rboWithinAllMethodsHP, bins=config['repeats'])
plt.savefig(config['out'] + "_histogram_rboWithinRepeatsForUnionMethods_"+config['typehprof'] + ".eps", format="eps")
plt.clf()
plt.hist(rboComparingAllMethodsJFRvsHP, bins=config['repeats'])
plt.savefig(config['out'] + "_histogram_rboComparingProfilersForUnionMethods_"+config['typejfr']+"vs"+config['typehprof'] + ".eps", format="eps")
plt.clf()
plt.hist(rboWithinMedianMethodsJFR, bins=config['repeats'])
plt.savefig(config['out'] + "_histogram_rboWithinRepeatsForMedianMethods_" + config['typejfr'] + ".eps", format="eps")
plt.clf()
plt.hist(rboWithinMedianMethodsHP, bins=config['repeats'])
plt.savefig(config['out'] + "_histogram_rboWithinRepeatsForMedianMethods_"+config['typehprof'] + ".eps", format="eps")
plt.clf()
plt.hist(rboComparingMedianMethodsJFRvsHP, bins=config['repeats'])
plt.savefig(config['out'] + "_histogram_rboComparingProfilersForMedianMethods_"+config['typejfr']+"vs"+config['typehprof'] + ".eps", format="eps")
plt.clf()
plt.hist(rboWithinIntersectionMethodsJFR, bins=config['repeats'])
plt.savefig(config['out'] + "_histogram_rboWithinRepeatsForIntersectionMethods_"+config['typejfr'] + ".eps", format="eps")
plt.clf()
plt.hist(rboWithinIntersectionMethodsHP, bins=config['repeats'])
plt.savefig(config['out'] + "_histogram_rboWithinRepeatsForIntersectionMethods_"+config['typehprof'] + ".eps", format="eps")
plt.clf()
plt.hist(rboComparingIntersectionMethodsJFRvsHP, bins=config['repeats'])
plt.savefig(config['out'] + "_histogram_rboComparingProfilersForIntersectionMethods_"+config['typejfr']+"vs"+config['typehprof'] + ".eps", format="eps")
plt.clf()


###################################### average ranks plots ##############################################
x = []
y = []
methodsInBothJFRAndHPUnionMethods = [] # just a list of method names
for method in averageRanksUnionMethodsJFR.keys():
    if (method in averageRanksUnionMethodsHP): # some methods not in both
        #if len(averageRanksUnionMethodsJFR[method]) > 0 and len(averageRanksUnionMethodsHP[method]) > 0:
        x.append(averageRanksUnionMethodsJFR[method])
        y.append(averageRanksUnionMethodsHP[method])
        methodsInBothJFRAndHPUnionMethods.append(method)
#print(x,y)
plt.scatter(x, y)
plt.xlabel("Average Rank "+config['typejfr'])
plt.ylabel("Average Rank "+config['typehprof'])
plt.savefig(config['out'] + "_scatter_meanRanksUnion_"+config['typejfr']+"vs"+config['typehprof'] + ".eps", format="eps")
plt.clf()

print("Spearman correlation average ranks unions ",config['typejfr']," vs ",config['typehprof'],":", stats.spearmanr(x,y))
# replicating conf paper, take top 30 from JFR
top30x = []
top30y = []
for i in range(0, len(x)):
    if (x[i] < 30):
        top30x.append(x[i])
        top30y.append(y[i])

plt.scatter(top30x, top30y)
plt.xlabel("Average Rank "+config['typejfr'])
plt.ylabel("Average Rank "+config['typehprof'])
plt.savefig(config['out'] + "_scatter_top30MeanRanksUnion_"+config['typejfr']+"vs"+config['typehprof'] + ".eps", format="eps")
plt.clf()
print("Spearman correlation top30 average ranks unions ",config['typejfr']," vs ",config['typehprof'],":", stats.spearmanr(top30x,top30y))



x = []
y = []
methodsInBothJFRAndHPMedianMethods = [] # just a list of method names
for method in averageRanksMedianMethodsJFR.keys():
    if (method in averageRanksMedianMethodsHP): # some methods not in both
        #if len(averageRanksMedianMethodsJFR[method]) > 0 and len(averageRanksMedianMethodsHP[method]) > 0:
        x.append(averageRanksMedianMethodsJFR[method])
        y.append(averageRanksMedianMethodsHP[method])
        methodsInBothJFRAndHPMedianMethods.append(method)
#print(x,y)
plt.scatter(x, y)
plt.xlabel("Average Rank "+config['typejfr'])
plt.ylabel("Average Rank "+config['typehprof'])
plt.savefig(config['out'] + "_scatter_meanRanksMedian_"+config['typejfr']+"vs"+config['typehprof'] + ".eps", format="eps")
plt.clf()

print("Spearman correlation average ranks medians ",config['typejfr']," vs ",config['typehprof'],":", stats.spearmanr(x,y))

# replicating conf paper, take top 30 from JFR
top30x = []
top30y = []
for i in range(0, len(x)):
    if (x[i] < 30):
        top30x.append(x[i])
        top30y.append(y[i])

plt.scatter(top30x, top30y)
plt.xlabel("Average Rank "+config['typejfr'])
plt.ylabel("Average Rank "+config['typehprof'])
plt.savefig(config['out'] + "_scatter_top30MeanRanksMedian_"+config['typejfr']+"vs"+config['typehprof'] + ".eps", format="eps")
plt.clf()
print("Spearman correlation top30 average ranks medians ",config['typejfr']," vs ",config['typehprof'],":", stats.spearmanr(top30x,top30y))


x = []
y = []
methodsInBothJFRAndHPIntersectionMethods = [] # just a list of method names
for method in averageRanksIntersectionMethodsJFR.keys():
    if (method in averageRanksIntersectionMethodsHP): # some methods not in both
        x.append(averageRanksIntersectionMethodsJFR[method])
        y.append(averageRanksIntersectionMethodsHP[method])
        methodsInBothJFRAndHPIntersectionMethods.append(method)
plt.scatter(x, y)
plt.xlabel("Average Rank "+config['typejfr'])
plt.ylabel("Average Rank "+config['typehprof'])
plt.savefig(config['out'] + "_scatter_meanRanksIntersection_"+config['typejfr']+"vs"+config['typehprof'] + ".eps", format="eps")
plt.clf()

print("Spearman correlation average ranks intersection ",config['typejfr']," vs ",config['typehprof'],":", stats.spearmanr(x,y))
# replicating conf paper, take top 30 from JFR
top30x = []
top30y = []
for i in range(0, len(x)):
    if (x[i] < 30):
        top30x.append(x[i])
        top30y.append(y[i])

plt.scatter(top30x, top30y)
plt.xlabel("Average Rank JFR")
plt.ylabel("Average Rank HPROF")
plt.savefig(config['out'] + "_scatter_top30MeanRanksMedian_"+config['typejfr']+"vs"+config['typehprof'] + ".eps", format="eps")
plt.clf()
print("Spearman correlation top30 average ranks medians ",config['typejfr']," vs ",config['typehprof'],":", stats.spearmanr(top30x,top30y))

###################################### testing: get tests per method ##############################################
# focusing only on methodsInBothJFRAndHPIntersectionMethods

# which tests go with which methods? structure is 3D; key/dim1 is methodname, dim2 is repeat, dim3 is testnames
testsPerMethodJFR = {}
testsPerMethodHP = {}

#method = methodsInBothJFRAndHPIntersectionMethods[0]
#df = dataJFR[0]
#ranksMedianMethodsJFR.append(
#print(df[df['Method']==method]["Tests"].item().split(","))

for method in methodsInBothJFRAndHPIntersectionMethods:
    testsJFR = []
    testsHP = []
    for rpt in range(config['repeats']):
        df = dataJFR[rpt]
        testsJFR.append(df[df['Method']==method]["Tests"].item().split(","))
        df = dataHP[rpt]
        testsHP.append(df[df['Method']==method]["Tests"].item().split(","))
    testsPerMethodJFR[method] = testsJFR
    testsPerMethodHP[method] = testsHP

###################################### testing: basic stats ##############################################
# when a test is found, in how many repeats of the profiler does it appear?
# just a long list of integers - each is 1 method, 1 test, number of repeats it was seen in
countOfTestAppearancesOverAllMethodsAndRepeatsJFR = []
countOfTestAppearancesOverAllMethodsAndRepeatsHP = []
# same as above, but 2D: dim1 is methods, dim2 is number of repeats for each test
countOfTestAppearancesPerMethodJFR = []
countOfTestAppearancesPerMethodHP = []

# distributions
index = 0
for method in methodsInBothJFRAndHPIntersectionMethods:
    # counts for each test (keys: test, values: count)
    testCounts = {}
    for rpt in testsPerMethodJFR[method]:
        for test in rpt:
            testCounts[test] = testCounts.get(test, 0) + 1
    countOfTestAppearancesOverAllMethodsAndRepeatsJFR.extend(testCounts.values())
    countOfTestAppearancesPerMethodJFR.append(testCounts.values())
    plt.hist(testCounts.values(), bins=config['repeats'])
    plt.savefig(config['out'] + "_histogram_testCountsForMethod" + str(index) + "_" + config['typejfr'] + ".eps", format="eps")
    plt.clf()
    testCounts = {}
    for rpt in testsPerMethodHP[method]:
        for test in rpt:
            testCounts[test] = testCounts.get(test, 0) + 1
    countOfTestAppearancesOverAllMethodsAndRepeatsHP.extend(testCounts.values())
    countOfTestAppearancesPerMethodHP.append(testCounts.values())
    plt.hist(testCounts.values(), bins=config['repeats'])
    plt.savefig(config['out'] + "_histogram_testCountsForMethod" + str(index) + "_" + config['typehprof'] + ".eps", format="eps")
    plt.clf()
    index += 1

#print()
#print("tests for method 0 JFR:")
#pp.pprint(testsPerMethodJFR[methodsInBothJFRAndHPIntersectionMethods[0]])
#
#print()
#print("tests for method 0 HP:")
#pp.pprint(testsPerMethodHP[methodsInBothJFRAndHPIntersectionMethods[0]])

print()
if len(countOfTestAppearancesOverAllMethodsAndRepeatsJFR) > 0:
    print("test appearance counts for ",config['typejfr'],"... median: ", round(statistics.median(countOfTestAppearancesOverAllMethodsAndRepeatsJFR),2), " IQR:", round(stats.iqr(countOfTestAppearancesOverAllMethodsAndRepeatsJFR),2), " Mean:", round(statistics.mean(countOfTestAppearancesOverAllMethodsAndRepeatsJFR),2))
else:
    print("no tests appear in all repeats for ",config['typejfr'])

if len(countOfTestAppearancesOverAllMethodsAndRepeatsHP) > 0:
    print("test appearance counts for ",config['typehprof'],"... median: ", round(statistics.median(countOfTestAppearancesOverAllMethodsAndRepeatsHP),2), " IQR:", round(stats.iqr(countOfTestAppearancesOverAllMethodsAndRepeatsHP),2), " Mean:", round(statistics.mean(countOfTestAppearancesOverAllMethodsAndRepeatsHP),2))
else:
    print("no tests appear in all repeats for ",config['typehprof'])
    

# for each method, what's the maximum times a test appears?
maximumTestAppearancesPerMethodJFR = []
maximumTestAppearancesPerMethodHP = []
for appearances in countOfTestAppearancesPerMethodJFR:
    maximumTestAppearancesPerMethodJFR.append(max(appearances))
for appearances in countOfTestAppearancesPerMethodHP:
    maximumTestAppearancesPerMethodHP.append(max(appearances))

if len(countOfTestAppearancesOverAllMethodsAndRepeatsJFR) > 0:
    print("max test appearance counts for ",config['typejfr'],"... median: ", round(statistics.median(maximumTestAppearancesPerMethodJFR),2), " IQR:", round(stats.iqr(maximumTestAppearancesPerMethodJFR),2))
else:
    print("no tests appear in all repeats for ",config['typejfr'])

if len(countOfTestAppearancesOverAllMethodsAndRepeatsHP) > 0:
    print("max test appearance counts for ",config['typehprof'],"... median: ", round(statistics.median(maximumTestAppearancesPerMethodHP),2), " IQR:", round(stats.iqr(maximumTestAppearancesPerMethodHP),2))
else:
    print("no tests appear in all repeats for ",config['typehprof'])

