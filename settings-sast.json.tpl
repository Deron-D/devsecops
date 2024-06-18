{
    "$${undefined}schema": "https://json.schemastore.org/aiproj-1.3.json",
    "Version": "1.3",
    "ProjectName": "${CI_PROJECT_NAME}",
    "ProgrammingLanguages": [
        "JavaScript",
        "Python"
    ],
    "PythonSettings": {
        "UsePublicAnalysisMethod": true,
        "DownloadDependencies": true
    },
    "ScanModules": [
        "StaticCodeAnalysis",
        "PatternMatching",
        "Components",
        "Configuration"
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
    "MailingProjectSettings": {
        "Enabled": false,
        "MailProfileName": null,
        "EmailRecipients": []
    }
}