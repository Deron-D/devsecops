{
    "$${undefined}schema": "https://json.schemastore.org/aiproj-1.3.json",
    "Version": "1.3",
    "ProjectName": "${CI_PROJECT_NAME}",
    "ProgrammingLanguages": [
        "JavaScript",
        "Python"
    ],
    "ScanModules": [
        "Configuration",
        "BlackBox"
    ],
    "UseSastRules": false,
    "UseCustomPmRules": false,
    "UseSecurityPolicies": false,
    "SkipGitIgnoreFiles": false,
    "JavaScriptSettings": {
        "UsePublicAnalysisMethod": true,
        "DownloadDependencies": true
    },
    "PmTaintSettings": {
        "UsePublicAnalysisMethod": true
    },
    "PythonSettings": {
        "UsePublicAnalysisMethod": false,
        "DownloadDependencies": true
    },
    "BlackBoxSettings": {
        "Site": "http://${APP_ADDRESS}",
        "Level": "Normal",
        "SslCheck": false,
        "ScanScope": "Domain",
        "BlackListedAddresses": [],
        "WhiteListedAddresses": [],
        "AdditionalHttpHeaders": [],
        "Authentication": {
            "Type": "None"
        },
        "ProxySettings": {
            "Enabled": false,
            "Type": "Http",
            "Host": "",
            "Port": 3128,
            "Login": "",
            "Password": ""
        },
        "RunAutocheckAfterScan": false
    },
    "MailingProjectSettings": {
        "Enabled": false,
        "MailProfileName": null,
        "EmailRecipients": []
    }
}