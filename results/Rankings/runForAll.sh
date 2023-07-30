#!/bin/bash

# script assumes all results in folders within RESULT_PATH; this dir also contains "figures" and "Rankings"
# run script in figures directory

RESULT_PATH=/home/sbr/Dropbox/current_pubs_and_pres/GinProfilerJournal

echo "CPU..."

project="disruptor"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj JFR9 > ${project}_jfr9vshprof.txt


project="gson"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj JFR17 > ${project}_jfr17vshprof.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj JFR9 > ${project}_jfr9vshprof.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ -r 20 -tj JFR17 -th JFR9 > ${project}_jfr17vsjfr9.txt


project="jcodec"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj JFR17 > ${project}_jfr17vshprof.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj JFR9 > ${project}_jfr9vshprof.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ -r 20 -tj JFR17 -th JFR9 > ${project}_jfr17vsjfr9.txt


project="junit4"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj JFR17 > ${project}_jfr17vshprof.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj JFR9 > ${project}_jfr9vshprof.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ -r 20 -tj JFR17 -th JFR9 > ${project}_jfr17vsjfr9.txt


project="opennlp"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj JFR17 > ${project}_jfr17vshprof.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj JFR9 > ${project}_jfr9vshprof.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ -r 20 -tj JFR17 -th JFR9 > ${project}_jfr17vsjfr9.txt



project="spark"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ -r 20 -tj JFR9 > ${project}_jfr9vshprof.txt


echo "Memory..."

project="disruptor"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj MemoryJFR9 -th MemoryHPROF > ${project}_memory_jfr9vshprof.txt


project="gson"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj MemoryJFR17 -th MemoryJFR9 > ${project}_memory_jfr17vsjfr9.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj MemoryJFR17 -th MemoryHPROF > ${project}_memory_jfr17vshprof.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj MemoryJFR9 -th MemoryHPROF > ${project}_memory_jfr9vshprof.txt


project="jcodec"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj MemoryJFR17 -th MemoryJFR9 > ${project}_memory_jfr17vsjfr9.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj MemoryJFR17 -th MemoryHPROF > ${project}_memory_jfr17vshprof.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj MemoryJFR9 -th MemoryHPROF > ${project}_memory_jfr9vshprof.txt

project="junit4"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj MemoryJFR17 -th MemoryHPROF > ${project}_memory_jfr17vshprof.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj MemoryJFR17 -th MemoryJFR9 > ${project}_memory_jfr17vsjfr9.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj MemoryJFR9 -th MemoryHPROF > ${project}_memory_jfr9vshprof.txt

project="opennlp"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj MemoryJFR17 -th MemoryJFR9 > ${project}_memory_jfr17vsjfr9.txt


project="spark"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj MemoryJFR9 -th MemoryHPROF > ${project}_memory_jfr9vshprof.txt




echo "Comparing CPU with memory..."

project="disruptor"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_CPU -th JFR9_MEM > ${project}_cpuvsmem_jfr9.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_CPU -th HPROF_MEM > ${project}_cpuvsmem_hprof.txt

project="gson"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR/${project}.Profiler_output_ ${RESULT_PATH}/${project}Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_CPU -th JFR17_MEM > ${project}_cpuvsmem_jfr17.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_CPU -th JFR9_MEM > ${project}_cpuvsmem_jfr9.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_CPU -th HPROF_MEM > ${project}_cpuvsmem_hprof.txt

project="jcodec"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_CPU -th JFR17_MEM > ${project}_cpuvsmem_jfr17.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_CPU -th JFR9_MEM > ${project}_cpuvsmem_jfr9.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_CPU -th HPROF_MEM > ${project}_cpuvsmem_hprof.txt

project="junit4"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR/${project}.Profiler_output_ ${RESULT_PATH}/${project}Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_CPU -th JFR17_MEM > ${project}_cpuvsmem_jfr17.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_CPU -th JFR9_MEM > ${project}_cpuvsmem_jfr9.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_CPU -th HPROF_MEM > ${project}_cpuvsmem_hprof.txt

project="opennlp"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_CPU -th JFR17_MEM > ${project}_cpuvsmem_jfr17.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_CPU -th JFR9_MEM > ${project}_cpuvsmem_jfr9.txt
#python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_CPU -th HPROF_MEM > ${project}_cpuvsmem_hprof.txt

project="spark"
echo "Running for "$project
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_CPU -th JFR9_MEM > ${project}_cpuvsmem_jfr9.txt
python ../Rankings/Compute_Stats.py $project ${RESULT_PATH}/${project}HPROF/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_CPU -th HPROF_MEM > ${project}_cpuvsmem_hprof.txt
