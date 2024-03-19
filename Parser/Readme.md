# Renovate Parser
Renovate allows to perform a *Dry Run* execution by logging messages instead of creating/updating/deleting branches and PRs.
## Script overview
Before executing the python script, install third party modules listed into _requirements.txt_ through the following command
```
pip install -r requirements.txt
```
### Example
1. Execute parser.py with as follow:
  ```
  python3 ./parser-py results-temp.json
  ```
Where *results-temp.json* is the log file outputed by Renovated dry run execution

2. The sript will generate a Json file, in the same directory where the script reside, containg the list of vulnerable depencencies reported by Renovate during *Dry Run* execution.
   The following is an example of script-generated Json file:
     ```
    [
    {
        "repo": "repoX/selfcare-pnpg-dashboard-frontend",
        "branch": "renovate/npm-axios-vulnerability",
        "prTitle": "Bump axios from 0.23.0 to 0.28.0",
        "depName": "axios",
        "currentVersion": "0.23.0",
        "newVersion": "0.28.0"
    },
    {
        "repo": "repoX/selfcare-dashboard-frontend",
        "branch": "renovate/npm-axios-vulnerability",
        "prTitle": "Bump axios from 0.23.0 to 0.28.0",
        "depName": "axios",
        "currentVersion": "0.23.0",
        "newVersion": "0.28.0"
    }
    ]
    ```
