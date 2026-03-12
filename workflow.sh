#!/bin/bash

# Path
IN=/data-shared/vcf_examples/luscinia_vars.vcf.gz
DATA_DIR=data
mkdir -p $DATA_DIR

# Filter chr1 & chrZ; extract QUAL (col 6) and AF (from INFO col 8)
zcat /data-shared/vcf_examples/luscinia_vars.vcf.gz | grep -v '^#' | awk 'BEGIN {OFS="\t"} {
    start = index($8, "AF1=");
    if (start > 0) {
        sub_str = substr($8, start + 4);
        split(sub_str, a, ";");
        af = a[1];
        print $6, af
    }
}' > data/qual_af.tsv

echo "Data saved in $DATA_DIR/qual_af.tsv"
