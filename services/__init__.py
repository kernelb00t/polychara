import jellyfin as jf
# A hook for checking prerequisites. Make sure to import your module before.
# You can check if a certain lib is installed, if Docker has the right version, etc... but the system shall remain untouched. 
# This should be used ONLY as an environment detection. No downloads/installations shall be done here. 
# You can see this as a preparation time to select questions that will/unselect quesitons that will not be relevant.
# You are at a state where the user clearly stated that he wants your service, but he can still cancel the installation.
# Those tasks are parallelized. No output shall be done here.
def checkPrerequisites(): 
    jf.testisdd()

# A hook for asking questions to the user. Make sure to import your module before.
# You can ask for the user's email, the installation path, etc...
# Some logic can be done behind, API fetches, etc...
# Downloads are permitted, but it must be small sizes (manifests, etc...). Try to use httpfs if a direct access is impossible.
# Tasks are serialized, output and logging can be done but keep them sparse.
def questions():
    pass

# A hook for downloading files. Make sure to import your module before.
# You can download large files, install dependencies, etc...
# Tasks are parallelized as possible but some serialization can be done. Output and logging are highly recommended.
# TODO: *Download manager for big files.* If you need very big files, declare it before. A prompt will be shown to the user.
def install():
    pass

# This is postInstall, after the docker service is launched. 
# Those tasks are parallelized when possible, but declare if you need access to another service's container.
# Output and logging are highly recommended.
# YOu can make API calls to container, parse Docker container's output for creds, etc...  
def postInstall():
    pass
