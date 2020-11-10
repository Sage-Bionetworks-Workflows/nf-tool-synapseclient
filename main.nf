
// params.command
// params.synid
// params.synapseconfig

def helpMessage() {
    log.info """
    Usage:
    The typical command for using the synapseclient
    nextflow run Sage-Bionetworks/synapse-nextflow --commands get --synid syn1234
    Mandatory arguments:
      --command                     synapseclient cli commands
      --synapseconfig               Synapse config file
      --synid                       Synapse Id
      -profile                      Configuration profile to use. Can use multiple (comma separated)
                                    Available: conda, docker.
    """.stripIndent()
}

// Show help message
if (params.help) {
    helpMessage()
    exit 0
}

if (params.command == "get")
    process synapse_get {

        input:
        // val cmd from params.command
        val synid from params.synid
        // path automatically interprets string to the location of the file
        path synapseconfig from params.synapseconfig

        output:
        stdout into result

        script:
        """
        echo "synapse -c $synapseconfig get $synid"
        synapse -c $synapseconfig get $synid
        """

    }
else
    error "Invalid synapse cmd"

if (params.command == "get")
    result.subscribe { println it }
