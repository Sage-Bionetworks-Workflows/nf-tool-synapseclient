
// params.command
// params.synid

def helpMessage() {
    log.info """
    Usage:
    The typical command for using the synapseclient
    nextflow run Sage-Bionetworks/synapse-nextflow --commands get --synid syn1234
    Mandatory arguments:
      --commands                    Path to input data (must be surrounded with quotes)
      --synid                       Synapse Id
      -profile                      Configuration profile to use. Can use multiple (comma separated)
                                    Available: conda, docker, singularity, awsbatch, test and more.
    """.stripIndent()
}

// Show help message
if (params.help) {
    helpMessage()
    exit 0
}

process synapse_get {

    input:
    val cmd from params.command
    val synid from params.synid

    script:
    """
    echo "synapse $cmd $synid"
    synapse $cmd $synid
    """
}
