#!/bin/bash

#request resources:
#PBS -l nodes=1:ppn=8
#PBS -l walltime=60:00:00
#PBS -o output
#PBS -e errors
#PBS -t 101-200

cd $PBS_O_WORKDIR

module load languages/R-3.6.2-gcc9.1.0

date

dataDir="${HOME}/data/UKB/16729/2020-08-12/"
codeDir="${HOME}/data/UKB/16729/2020-08-12/PHESANT/WAS/"
varListDir="${HOME}/data/UKB/16729/2020-08-12/PHESANT/variable-info/"

outcomeFile="${dataDir}data/data.43017.phesant.tab"
varListFile="${varListDir}outcome-info.tsv"
dcFile="${varListDir}data-coding-ordinal-info.txt"
resDir="${dataDir}derived/"

# start and end index of phenotypes
pIdx=${PBS_ARRAYID}
np=200

cd $codeDir
Rscript ${codeDir}phenomeScan.r --partIdx=$pIdx --numParts=$np --phenofile=${outcomeFile} --variablelistfile=${varListFile} --datacodingfile=${dcFile} --resDir=${resDir} --tab=TRUE --userId="eid" --save



date
