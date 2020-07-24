# synapse-nextflow

This is the nextflow tool that wraps `synaspeclient` cli.

```
nextflow pull Sage-Bionetworks/synapse-nextflow
nextflow run Sage-Bionetworks/synapse-nextflow --help
nextflow run Sage-Bionetworks/synapse-nextflow --command get --synid syn18081597 -profile conda
```

If you have conda installed locally, but don't have a conda synapse env, you can leverage the `conda` profile.  This creates a local conda environment wherever you are running this `nextflow` command.

```
nextflow run Sage-Bionetworks/synapse-nextflow --command get --synid syn18081597 -profile conda
```