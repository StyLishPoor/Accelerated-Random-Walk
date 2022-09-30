#!/bin/bash

ALGORITHM=$2
DATA=$4
DIRECTED=$6
GRAPH=$8
SIZE=${10}
PERF=${12}

if [ "$ALGORITHM" = "BinaryGenerate" ] || [ "$ALGORITHM" = "IdRandom" ]; then
  if [ "$ALGORITHM" = "BinaryGenerate" ]; then
    ./SSPPR -algo BinaryGenerate -graph data/$DATA/graph.txt -binary data/$DATA/graph.bin -attribute data/$DATA/graph.attribute -query data/$DATA/graph.query -directed $DIRECTED
  elif [ "$ALGORITHM" = "IdRandom" ]; then
    ./SSPPR -algo IdRandom -binary data/$DATA/graph.bin -random_binary data/$DATA/random-graph.bin -attribute data/$DATA/graph.attribute
  fi
else
  if [ "$PERF" = "yes" ]; then
    sudo sysctl -w vm.drop_caches=3
    #sudo sysctl -w vm.drop_caches=3
    if [ "$GRAPH" = "random" ]; then
      perf stat -e L1-dcache-loads -e L1-dcache-load-misses -e LLC-loads -e LLC-load-misses ./SSPPR -algo $ALGORITHM -binary data/$DATA/random-graph.bin -attribute data/$DATA/graph.attribute -query data/$DATA/random-graph.query -query_size $SIZE
    elif [ "$GRAPH" = "Gorder" ]; then
      perf stat -e L1-dcache-loads -e L1-dcache-load-misses -e LLC-loads -e LLC-load-misses ./SSPPR -algo $ALGORITHM -binary data/$DATA/Gorder-graph.bin -attribute data/$DATA/graph.attribute -query data/$DATA/Gorder-graph.query -query_size $SIZE
    else
      perf stat -e L1-dcache-loads -e L1-dcache-load-misses -e LLC-loads -e LLC-load-misses ./SSPPR -algo $ALGORITHM -binary data/$DATA/graph.bin -attribute data/$DATA/graph.attribute -query data/$DATA/graph.query -query_size $SIZE
    fi
  else
    if [ "$GRAPH" = "random" ]; then
      ./SSPPR -algo $ALGORITHM -binary data/$DATA/random-graph.bin -attribute data/$DATA/graph.attribute -query data/$DATA/random-graph.query -query_size $SIZE
    elif [ "$GRAPH" = "Gorder" ]; then
      ./SSPPR -algo $ALGORITHM -binary data/$DATA/Gorder-graph.bin -attribute data/$DATA/graph.attribute -query data/$DATA/Gorder-graph.query -query_size $SIZE
    else
      ./SSPPR -algo $ALGORITHM -binary data/$DATA/graph.bin -attribute data/$DATA/graph.attribute -query data/$DATA/graph.query -query_size $SIZE
    fi
  fi
fi
