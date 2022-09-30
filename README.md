# Accelerated Random Walk
Accelerating Random Walk for Index-Free Personalized PageRank Computation

## Environmnets
- GCC 9.4.0
- Ubuntu 20.04
- SFMT 1.5.1 (SIMD-Oriented Fast Mersenne Twister)
- Perf 5.4.154 (Calculate cache-references/misses on processors)

## Compile
```
$ make
```

## Usage

Exec directly

```
$ ./SSPPR -algo <algorithm> [-graph <graph-path>] [-binary <binary-path>]
            [-attribute <attribute-path>] [-directed <yes or no>] [-query <query-path>]
            [-query_size <must be greater than 1>] [-alpha <must be between 0 and 1>] [-epsilon <must be between 0 and 1>]
```

Exec using `exec.sh` 

```
$ source exec.sh -algo <algorithm> -dataset <select a directory under data/> -directed <yes or no> -random <yes or no> 
            -query_size <must be greater than 1>] -perf <yes or no>
```
