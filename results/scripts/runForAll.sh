#!/bin/bash

# script assumes all results in folders within RESULT_PATH; this dir also contains "figures" and "scripts"
# run script in figures directory

RESULT_PATH=/home/sbr/Dropbox/current_pubs_and_pres/GinProfilerJournal

echo "CPU..."

project="disruptor"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR9_CPU -th HPROF_CPU > ${project}_cpu_jfr9vshprof.txt


project="gson"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR17_CPU -th HPROF_CPU > ${project}_cpu_jfr17vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR9_CPU -th HPROF_CPU > ${project}_cpu_jfr9vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ -r 20 -tj JFR17_CPU -th JFR9_CPU > ${project}_cpu_jfr17vsjfr9.txt

python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th HPROF_CPU > ${project}_cpu_jfr8vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th JFR9_CPU > ${project}_cpu_jfr8vsjfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th JFR17_CPU > ${project}_cpu_jfr8vsjfr17.txt


project="jcodec"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR17_CPU -th HPROF_CPU > ${project}_cpu_jfr17vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR9_CPU -th HPROF_CPU > ${project}_cpu_jfr9vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ -r 20 -tj JFR17_CPU -th JFR9_CPU > ${project}_cpu_jfr17vsjfr9.txt

python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th HPROF_CPU > ${project}_cpu_jfr8vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th JFR9_CPU > ${project}_cpu_jfr8vsjfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th JFR17_CPU > ${project}_cpu_jfr8vsjfr17.txt


project="junit4"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR17_CPU -th HPROF_CPU > ${project}_cpu_jfr17vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR9_CPU -th HPROF_CPU > ${project}_cpu_jfr9vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ -r 20 -tj JFR17_CPU -th JFR9_CPU > ${project}_cpu_jfr17vsjfr9.txt

python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th HPROF_CPU > ${project}_cpu_jfr8vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th JFR9_CPU > ${project}_cpu_jfr8vsjfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th JFR17_CPU > ${project}_cpu_jfr8vsjfr17.txt

project="opennlp"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR17_CPU -th HPROF_CPU > ${project}_cpu_jfr17vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR9_CPU -th HPROF_CPU > ${project}_cpu_jfr9vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ -r 20 -tj JFR17_CPU -th JFR9_CPU > ${project}_cpu_jfr17vsjfr9.txt

python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th HPROF_CPU > ${project}_cpu_jfr8vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th JFR9_CPU > ${project}_cpu_jfr8vsjfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th JFR17_CPU > ${project}_cpu_jfr8vsjfr17.txt



project="spark"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR9_CPU -th HPROF_CPU > ${project}_cpu_jfr9vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th HPROF_CPU > ${project}_cpu_jfr8vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ -r 20 -tj JFR8_CPU -th JFR9_CPU > ${project}_cpu_jfr8vsjfr9.txt


echo "Memory..."

project="disruptor"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_Memory -th HPROF_Memory > ${project}_memory_jfr9vshprof.txt


project="gson"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_Memory -th JFR9_Memory > ${project}_memory_jfr17vsjfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_Memory -th HPROF_Memory > ${project}_memory_jfr17vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_Memory -th HPROF_Memory > ${project}_memory_jfr9vshprof.txt

python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory -th HPROF_Memory > ${project}_memory_jfr8vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory -th JFR9_Memory > ${project}_memory_jfr8vsjfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory -th JFR17_Memory > ${project}_memory_jfr8vsjfr17.txt


project="jcodec"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_Memory -th JFR9_Memory > ${project}_memory_jfr17vsjfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_Memory -th HPROF_Memory > ${project}_memory_jfr17vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_Memory -th HPROF_Memory > ${project}_memory_jfr9vshprof.txt

python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory -th HPROF_Memory > ${project}_memory_jfr8vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory -th JFR9_Memory > ${project}_memory_jfr8vsjfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory -th JFR17_Memory > ${project}_memory_jfr8vsjfr17.txt

project="junit4"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_Memory -th HPROF_Memory > ${project}_memory_jfr17vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_Memory -th JFR9_Memory > ${project}_memory_jfr17vsjfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_Memory -th HPROF_Memory > ${project}_memory_jfr9vshprof.txt

python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory -th HPROF_Memory > ${project}_memory_jfr8vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory -th JFR9_Memory > ${project}_memory_jfr8vsjfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory -th JFR17_Memory > ${project}_memory_jfr8vsjfr17.txt

project="opennlp"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_Memory -th HPROF_Memory > ${project}_memory_jfr17vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_Memory -th JFR9_Memory > ${project}_memory_jfr17vsjfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_Memory -th HPROF_Memory > ${project}_memory_jfr9vshprof.txt


project="spark"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_Memory -th HPROF_Memory > ${project}_memory_jfr9vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory -th HPROF_Memory > ${project}_memory_jfr8vshprof.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_Memory -th JFR9_Memory > ${project}_memory_jfr8vsjfr9.txt


echo "Comparing CPU with memory..."

project="disruptor"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_CPU -th JFR9_Memory > ${project}_cpuvsmem_jfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_CPU -th HPROF_Memory > ${project}_cpuvsmem_hprof.txt

project="gson"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_CPU -th JFR17_Memory > ${project}_cpuvsmem_jfr17.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_CPU -th JFR9_Memory > ${project}_cpuvsmem_jfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_CPU -th JFR8_Memory > ${project}_cpuvsmem_jfr8.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_CPU -th HPROF_Memory > ${project}_cpuvsmem_hprof.txt

project="jcodec"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_CPU -th JFR17_Memory > ${project}_cpuvsmem_jfr17.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_CPU -th JFR9_Memory > ${project}_cpuvsmem_jfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_CPU -th JFR8_Memory > ${project}_cpuvsmem_jfr8.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_CPU -th HPROF_Memory > ${project}_cpuvsmem_hprof.txt

project="junit4"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_CPU -th JFR17_Memory > ${project}_cpuvsmem_jfr17.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_CPU -th JFR9_Memory > ${project}_cpuvsmem_jfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_CPU -th JFR8_Memory > ${project}_cpuvsmem_jfr8.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_CPU -th HPROF_Memory > ${project}_cpuvsmem_hprof.txt

project="opennlp"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR17CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR17Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR17_CPU -th JFR17_Memory > ${project}_cpuvsmem_jfr17.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_CPU -th JFR9_Memory > ${project}_cpuvsmem_jfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_CPU -th HPROF_Memory > ${project}_cpuvsmem_hprof.txt

project="spark"
echo "Running for "$project
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR9CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR9Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR9_CPU -th JFR9_Memory > ${project}_cpuvsmem_jfr9.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}JFR8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}JFR8Memory/${project}.MemoryProfiler_output_ -r 20 -tj JFR8_CPU -th JFR8_Memory > ${project}_cpuvsmem_jfr8.txt
python ../scripts/Compute_Stats.py $project ${RESULT_PATH}/${project}HPROF8CPU/${project}.Profiler_output_ ${RESULT_PATH}/${project}HPROFMemory/${project}.MemoryProfiler_output_ -r 20 -tj HPROF_CPU -th HPROF_Memory > ${project}_cpuvsmem_hprof.txt
