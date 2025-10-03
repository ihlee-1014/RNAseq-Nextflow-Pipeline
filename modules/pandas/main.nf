#!/usr/bin/bash nextflow

process PANDAS {
    
    container 'ghcr.io/bf528/pandas:latest'
    publishDir params.outdir, mode: "copy"

    input:
    

    output:
    

    script:
    """
    
    """

    
}