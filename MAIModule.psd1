@{
    # If authoring a script module, the RootModule is the name of your .psm1 file
    #RootModule = 'MAIModule.psm1'

    Author = 'github.com/MrMikeandike'

    CompanyName = 'Personal'

    ModuleVersion = '0.1'

    # Use the New-Guid command to generate a GUID, and copy/paste into the next line
    GUID = 'bb664cc4-7435-4880-a516-65460f8a49b8'



    Description = 'Collection of modules that help me interact with windows 10. Mostly focused around setting up win10 for the first time.'
    
    # Minimum PowerShell version supported by this module (optional, recommended)
    # PowerShellVersion = ''
    
    # Which PowerShell Editions does this module work with? (Core, Desktop)
    CompatiblePSEditions = @('Desktop', 'Core')

    # Which PowerShell functions are exported from your module? (eg. Get-CoolObject)
    FunctionsToExport = @('*')

    # Which PowerShell aliases are exported from your module? (eg. gco)
    AliasesToExport = @('*')

    # Which PowerShell variables are exported from your module? (eg. Fruits, Vegetables)
    VariablesToExport = @('*')
    ModuleList = @("MAIHelpers")
    NestedModules = @(".\modules\MAIHelpers\MAIHelpers.psm1")
    # PowerShell Gallery: Define your module's metadata
    PrivateData = @{
        PSData = @{
            # What keywords represent your PowerShell module? (eg. cloud, tools, framework, vendor)
            Tags = @('Setup-Scripts', 'Windows 10', "Scoop", "Boxstarter")

            # What software license is your code being released under? (see https://opensource.org/licenses)
            LicenseUri = 'MIT'

            # What is the URL to your project's website?
            ProjectUri = 'https://github.com/MrMikeandike/win10config'

            # What is the URI to a custom icon file for your project? (optional)
            IconUri = ''

            # What new features, bug fixes, or deprecated features, are part of this release?
            ReleaseNotes = @'
'@
        }
    }

    # If your module supports updateable help, what is the URI to the help archive? (optional)
    # HelpInfoURI = ''
}