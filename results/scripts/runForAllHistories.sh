#!/bin/bash

# script assumes all results in folders within RESULT_PATH; this dir also contains "figures" and "Rankings"
# run script in figures directory

RESULT_PATH=/home/sbr/Dropbox/current_pubs_and_pres/GinProfilerJournal

echo "CPU..."

project="disruptor"
echo "Running for "$project
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ -r 20 -tj JFR9_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj HPROF_CPU


project="gson"
echo "Running for "$project
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR17/${project}.Profiler_output_ -r 20 -tj JFR17_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ -r 20 -tj JFR9_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR8/${project}.Profiler_output_ -r 20 -tj JFR8_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj HPROF_CPU


project="jcodec"
echo "Running for "$project
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR17/${project}.Profiler_output_ -r 20 -tj JFR17_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ -r 20 -tj JFR9_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR8/${project}.Profiler_output_ -r 20 -tj JFR8_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj HPROF_CPU



project="junit4"
echo "Running for "$project
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR17/${project}.Profiler_output_ -r 20 -tj JFR17_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ -r 20 -tj JFR9_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR8/${project}.Profiler_output_ -r 20 -tj JFR8_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj HPROF_CPU



project="opennlp"
echo "Running for "$project
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR17/${project}.Profiler_output_ -r 20 -tj JFR17_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ -r 20 -tj JFR9_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR8/${project}.Profiler_output_ -r 20 -tj JFR8_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj HPROF_CPU



project="spark"
echo "Running for "$project
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ -r 20 -tj JFR9_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR8/${project}.Profiler_output_ -r 20 -tj JFR8_CPU
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj HPROF_CPU


echo "Memory..."

project="disruptor"
echo "Running for "$project
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_Memory


project="gson"
echo "Running for "$project
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_Memory

project="jcodec"
echo "Running for "$project
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_Memory

project="junit4"
echo "Running for "$project
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_Memory

project="opennlp"
echo "Running for "$project
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_Memory

project="spark"
echo "Running for "$project
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory
python ../Rankings/Compute_History.py $project ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_Memory


