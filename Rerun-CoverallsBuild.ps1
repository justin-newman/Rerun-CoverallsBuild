
<#PSScriptInfo

.VERSION 1.0.1

.GUID c6aec726-b31a-4a9b-af8d-89a26d07aad5

.AUTHOR Justin Newman

.COMPANYNAME

.COPYRIGHT

.TAGS Coveralls

.LICENSEURI
https://github.com/justin-newman/Rerun-CoverallsBuild/blob/main/LICENSE.md

.PROJECTURI
https://github.com/justin-newman/Rerun-CoverallsBuild

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES
Version 1.0: Original published version.

.PRIVATEDATA

#>

<# 
.SYNOPSIS
Reruns a Coveralls.io build

.DESCRIPTION 
Reruns a Coveralls.io build by Making use of the API Endpoint that Coveralls.io created to re-run the coverage build. 

.Parameter BuildId
The ID of the build that you want to re-run.

.PARAMETER RepoToken
The repo token for the project that you want to re-run the build. Found in the Coveralls.io repo settings.

.EXAMPLE
Rerun-CoverallsBuild.ps1 -BuildId 1234567890 -RepoToken anQSYAtp2SgTegOMFlBq2rndMCyqo6Q3r
 
.NOTES
MIT LICENSE
 
Copyright (c) 2022 Justin Newman
 
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE

#> 

Param (
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$BuildId,
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$RepoToken
)

Invoke-WebRequest -Uri "https://coveralls.io/rerun_build?repo_token=$RepoToken&build_num=$BuildId" -Method Get
