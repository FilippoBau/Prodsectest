import json
import sys
import argparse
import pandas as pd
from datetime import datetime

def readJson(filePath):
    with open(filePath, 'r') as file:
        data = pd.read_json(file,lines=True)
        return data
        
def extractInfo(data):
    #Extract information on the branches would be created
    branchesInformationObject = data['branchesInformation'].dropna()
    outputJsonObject = []

    for index, branches in branchesInformationObject.items():
        # Save current repo
        currentData = {}
        currentData['repo'] = data['repository'][index]
        print("-------------- ", currentData['repo'], " --------------")
        for indexBranch, branchName in enumerate(branches):
            # Fill data for report
            currentData = {}
            currentData['repo'] = data['repository'][index]
            currentData['branch'] = branchName['branchName']
            currentData['prTitle'] = branchName['prTitle']
            currentData['depName'] = branchName['upgrades'][0]['depName']
            currentData['currentVersion'] = branchName ['upgrades'][0]['currentVersion']
            currentData['newVersion'] = branchName['upgrades'][0]['newVersion']

            print("Branch: ", currentData['branch'], "\n", "PrTitle: ", currentData['prTitle'], "\n", "Dependency Name: ", currentData['depName'], "\n", "Dependency Current Version: ", currentData['currentVersion'], "\n", "Dependency Fixed Version: ", currentData['newVersion'], "\n")
            outputJsonObject.append(currentData)
    return outputJsonObject

def writeToFile(data):
    ts = datetime.now()
    dt_string = ts.strftime("%d-%m-%Y %H-%M-%S")
    filename = "Renovate parser-" + dt_string + ".json"
    with open(filename, "w") as file:
        json.dump(data, file)

if __name__ == "__main__":
    #Take filename from the input
    parser = argparse.ArgumentParser(description='Report filename')
    parser.add_argument('source_file', type=open)

    data = readJson(parser.parse_args().source_file.name)
    writeToFile(extractInfo(data))
