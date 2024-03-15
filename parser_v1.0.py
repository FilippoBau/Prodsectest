import pandas as pd

file_path = "results-temp.json"
def readJson():
    with open(file_path, 'r') as file:
        data = pd.read_json(file,lines=True)
        return data
        
def extractInfo(data):
    #Extract information on the branches would be created
    branchesInformationObject = data['branchesInformation'].dropna()

    for index, branches in branchesInformationObject.items():
        # Save current repo
        repo = data['repository'][index]
        print("-------------- ", repo, " --------------")

        for indexBranch, branchName in enumerate(branches):
            # Fill data for report
            branch = branchName['branchName']
            prTitle = branchName['prTitle']
            depName = branchName['upgrades'][0]['depName']
            depCurrentVersion = branchName ['upgrades'][0]['currentVersion']
            depFixedVersion = branchName['upgrades'][0]['newVersion']

            print("Branch: ", branch, "\n", "PrTitle: ", prTitle, "\n", "Dependency Name: ", depName, "\n", "Dependency Current Version: ", depCurrentVersion, "\n", "Dependency Fixed Version: ", depFixedVersion, "\n")

            #Next Step: write this information into a file
            #def writeToFile_(vulnerableDependency):


if __name__ == "__main__":
    data = readJson()
    extractInfo(data)
