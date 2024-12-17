Agent cond Role 
=========
this roles handles creating the credintial and all needed configuration to create the agent and adds both agent to jenkins

 Download Jenkins CLI -> this tool will create the agents and credintials
 Generate SSH key pair 
 Copies the public key to both agents and configure the permisions for .ssh directory and authorized_keys
 verify the copy was executed - since we had issues with it sometimes
 creates credintianls for jenkisn with the private key using groovy script and credintiasl xml
 gets IP address for each agents
 creates and kaunch both agents with the needed configuration 
