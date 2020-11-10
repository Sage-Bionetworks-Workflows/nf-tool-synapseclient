
// params.command
// params.synid
// params.synapseconfig
// params.inputfile
// params.parentid

def helpMessage() {
    log.info """
    Usage:
    The typical command for using the synapseclient
    nextflow run Sage-Bionetworks/synapse-nextflow --commands get --synid syn1234
    Mandatory arguments:
      --command                     synapseclient cli commands
      --synapseconfig               Synapse config file
      --synid                       Synapse Id
      --inputfile                   Synapse Id
      --parentid                    Synapse parent id

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
        val synid from params.synid
        file synapseconfig from file(params.synapseconfig)

        output:
        file '*' into result

        script:
        """
        echo "synapse -c $synapseconfig get $synid"
        synapse -c $synapseconfig get $synid
        """

    }
else if (params.command == "store")
    process synapse_store {

        input:
        file filepath from file(params.inputfile)
        val parent from params.parentid
        file synapseconfig from file(params.synapseconfig)

        output:
        stdout into result

        script:
        """
        echo "synapse -c $synapseconfig store $filepath --parentId $parent"
        synapse -c $synapseconfig store $filepath --parentId $parent
        """

    }
else
    error "Invalid synapse cmd"

if (params.command == "get")
    result.subscribe { println "File: ${it.name}" }
else if (params.command == "store")
    result.subscribe { println it }
