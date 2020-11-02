%This is the change file for the original ProGit2's Documentation file.
%This is part of Japanese translation version for ProGit2's Documantation.

@x
[[_git_powershell]]
@y
[[_git_powershell]]
@z

@x
=== Git in PowerShell
@y
//////////////////////////
=== Git in PowerShell
//////////////////////////
=== PowerShell における Git
@z

@x
(((PowerShell)))(((tab completion, PowerShell)))(((shell prompts, PowerShell)))
(((posh-git)))
@y
(((PowerShell)))(((tab completion, PowerShell)))(((shell prompts, PowerShell)))
(((posh-git)))
@z

@x
The legacy command-line terminal on Windows (`cmd.exe`) isn't really capable of a customized Git experience, but if you're using PowerShell, you're in luck.
This also works if you're running PowerShell Core on Linux or macOS.
A package called posh-git (https://github.com/dahlbyk/posh-git[]) provides powerful tab-completion facilities, as well as an enhanced prompt to help you stay on top of your repository status.
It looks like this:
@y
//////////////////////////
The legacy command-line terminal on Windows (`cmd.exe`) isn't really capable of a customized Git experience, but if you're using PowerShell, you're in luck.
This also works if you're running PowerShell Core on Linux or macOS.
A package called posh-git (https://github.com/dahlbyk/posh-git[]) provides powerful tab-completion facilities, as well as an enhanced prompt to help you stay on top of your repository status.
It looks like this:
//////////////////////////
Windows の古いコマンドライン端末（`cmd.exe`）には、Git をカスタマイズするための十分な機能はなく、現実には利用できません。
PowerShell を利用しているのであれば安心です。
Linux や macOS 上でも PowerShell Core を実行すれば PowerShell を動作させることができます。
posh-git (https://github.com/dahlbyk/posh-git[]) というパッケージでは、強力なタブ補完機能が提供されています。
さらに拡張プロンプトによってリポジトリの状態を常に確認できます。
その様子を以下に示します。
@z

@x
.PowerShell with Posh-git
image::images/posh-git.png[PowerShell with Posh-git]
@y
//////////////////////////
.PowerShell with Posh-git
image::images/posh-git.png[PowerShell with Posh-git]
//////////////////////////
.Posh-git を利用した PowerShell
image::images/posh-git.png[Posh-git を利用した PowerShell]
@z

@x
==== Installation
@y
//////////////////////////
==== Installation
//////////////////////////
==== インストール
@z

@x
===== Prerequisites (Windows only)
@y
//////////////////////////
===== Prerequisites (Windows only)
//////////////////////////
===== 前提条件 (Windows のみ)
@z

@x
Before you're able to run PowerShell scripts on your machine, you need to set your local `ExecutionPolicy` to `RemoteSigned` (basically, anything except `Undefined` and `Restricted`).
If you choose `AllSigned` instead of `RemoteSigned`, also local scripts (your own) need to be digitally signed in order to be executed.
With `RemoteSigned`, only scripts having the `ZoneIdentifier` set to `Internet` (were downloaded from the web) need to be signed, others not.
If you're an administrator and want to set it for all users on that machine, use `-Scope LocalMachine`.
If you're a normal user, without administrative rights, you can use `-Scope CurrentUser` to set it only for you.
@y
//////////////////////////
Before you're able to run PowerShell scripts on your machine, you need to set your local `ExecutionPolicy` to `RemoteSigned` (basically, anything except `Undefined` and `Restricted`).
If you choose `AllSigned` instead of `RemoteSigned`, also local scripts (your own) need to be digitally signed in order to be executed.
With `RemoteSigned`, only scripts having the `ZoneIdentifier` set to `Internet` (were downloaded from the web) need to be signed, others not.
If you're an administrator and want to set it for all users on that machine, use `-Scope LocalMachine`.
If you're a normal user, without administrative rights, you can use `-Scope CurrentUser` to set it only for you.
//////////////////////////
Before you're able to run PowerShell scripts on your machine, you need to set your local `ExecutionPolicy` to `RemoteSigned` (basically, anything except `Undefined` and `Restricted`).
If you choose `AllSigned` instead of `RemoteSigned`, also local scripts (your own) need to be digitally signed in order to be executed.
With `RemoteSigned`, only scripts having the `ZoneIdentifier` set to `Internet` (were downloaded from the web) need to be signed, others not.
If you're an administrator and want to set it for all users on that machine, use `-Scope LocalMachine`.
If you're a normal user, without administrative rights, you can use `-Scope CurrentUser` to set it only for you.
@z

@x
More about PowerShell Scopes: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_scopes[].
@y
//////////////////////////
More about PowerShell Scopes: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_scopes[].
//////////////////////////
PowerShell のスコープ（scope）に関する詳細は https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_scopes[] を参照してください。
@z

@x
More about PowerShell ExecutionPolicy: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy[].
@y
//////////////////////////
More about PowerShell ExecutionPolicy: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy[].
//////////////////////////
PowerShell の実行ポリシー（ExecutionPolicy）については https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy[] を参照してください。
@z

@x
To set the value of `ExecutionPolicy` to `RemoteSigned` for all users use the next command:
@y
//////////////////////////
To set the value of `ExecutionPolicy` to `RemoteSigned` for all users use the next command:
//////////////////////////
全ユーザーに対して `ExecutionPolicy` の値を `RemoteSigned` に設定する場合は、以下のコマンドを実行します。
@z

@x
[source,powershell]
----
> Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
----
@y
[source,powershell]
----
> Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
----
@z

@x
===== PowerShell Gallery
@y
//////////////////////////
===== PowerShell Gallery
//////////////////////////
===== PowerShell ギャラリー
@z

@x
If you have at least PowerShell 5 or PowerShell 4 with PackageManagement installed, you can use the package manager to install posh-git for you.
@y
//////////////////////////
If you have at least PowerShell 5 or PowerShell 4 with PackageManagement installed, you can use the package manager to install posh-git for you.
//////////////////////////
If you have at least PowerShell 5 or PowerShell 4 with PackageManagement installed, you can use the package manager to install posh-git for you.
@z

@x
More information about PowerShell Gallery: https://docs.microsoft.com/en-us/powershell/scripting/gallery/overview[].
@y
//////////////////////////
More information about PowerShell Gallery: https://docs.microsoft.com/en-us/powershell/scripting/gallery/overview[].
//////////////////////////
PowerShell ギャラリー（Gallery）に関する詳細は https://docs.microsoft.com/en-us/powershell/scripting/gallery/overview[] を参照してください。
@z

@x
[source,powershell]
----
> Install-Module posh-git -Scope CurrentUser -Force
> Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force # Newer beta version with PowerShell Core support
----
@y
[source,powershell]
----
> Install-Module posh-git -Scope CurrentUser -Force
> Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force # Newer beta version with PowerShell Core support
----
@z

@x
If you want to install posh-git for all users, use `-Scope AllUsers` instead and execute the command from an elevated PowerShell console.
If the second command fails with an error like `Module 'PowerShellGet' was not installed by using Install-Module`, you'll need to run another command first:
@y
//////////////////////////
If you want to install posh-git for all users, use `-Scope AllUsers` instead and execute the command from an elevated PowerShell console.
If the second command fails with an error like `Module 'PowerShellGet' was not installed by using Install-Module`, you'll need to run another command first:
//////////////////////////
If you want to install posh-git for all users, use `-Scope AllUsers` instead and execute the command from an elevated PowerShell console.
If the second command fails with an error like `Module 'PowerShellGet' was not installed by using Install-Module`, you'll need to run another command first:
@z

@x
[source,powershell]
----
> Install-Module PowerShellGet -Force -SkipPublisherCheck
----
@y
[source,powershell]
----
> Install-Module PowerShellGet -Force -SkipPublisherCheck
----
@z

@x
Then you can go back and try again.
This happens, because the modules that ship with Windows PowerShell are signed with a different publishment certificate.
@y
//////////////////////////
Then you can go back and try again.
This happens, because the modules that ship with Windows PowerShell are signed with a different publishment certificate.
//////////////////////////
Then you can go back and try again.
This happens, because the modules that ship with Windows PowerShell are signed with a different publishment certificate.
@z

@x
===== Update PowerShell Prompt
@y
//////////////////////////
===== Update PowerShell Prompt
//////////////////////////
===== Update PowerShell Prompt
@z

@x
To include git information in your prompt, the posh-git module needs to be imported.
To have posh-git imported every time PowerShell starts, execute the `Add-PoshGitToProfile` command which will add the import statement into your `$profile` script.
This script is executed everytime you open a new PowerShell console.
Keep in mind, that there are multiple `$profile` scripts.
E. g. one for the console and a separate one for the ISE.
@y
//////////////////////////
To include git information in your prompt, the posh-git module needs to be imported.
To have posh-git imported every time PowerShell starts, execute the `Add-PoshGitToProfile` command which will add the import statement into your `$profile` script.
This script is executed everytime you open a new PowerShell console.
Keep in mind, that there are multiple `$profile` scripts.
E. g. one for the console and a separate one for the ISE.
//////////////////////////
To include git information in your prompt, the posh-git module needs to be imported.
To have posh-git imported every time PowerShell starts, execute the `Add-PoshGitToProfile` command which will add the import statement into your `$profile` script.
This script is executed everytime you open a new PowerShell console.
Keep in mind, that there are multiple `$profile` scripts.
E. g. one for the console and a separate one for the ISE.
@z

@x
[source,powershell]
----
> Import-Module posh-git
> Add-PoshGitToProfile -AllHosts
----
@y
[source,powershell]
----
> Import-Module posh-git
> Add-PoshGitToProfile -AllHosts
----
@z

@x
===== From Source
@y
//////////////////////////
===== From Source
//////////////////////////
===== From Source
@z

@x
Just download a posh-git release from https://github.com/dahlbyk/posh-git/releases[], and uncompress it.
Then import the module using the full path to the `posh-git.psd1` file:
@y
//////////////////////////
Just download a posh-git release from https://github.com/dahlbyk/posh-git/releases[], and uncompress it.
Then import the module using the full path to the `posh-git.psd1` file:
//////////////////////////
Just download a posh-git release from https://github.com/dahlbyk/posh-git/releases[], and uncompress it.
Then import the module using the full path to the `posh-git.psd1` file:
@z

@x
[source,powershell]
----
> Import-Module <path-to-uncompress-folder>\src\posh-git.psd1
> Add-PoshGitToProfile -AllHosts
----
@y
[source,powershell]
----
> Import-Module <path-to-uncompress-folder>\src\posh-git.psd1
> Add-PoshGitToProfile -AllHosts
----
@z

@x
This will add the proper line to your `profile.ps1` file, and posh-git will be active the next time you open PowerShell.
@y
//////////////////////////
This will add the proper line to your `profile.ps1` file, and posh-git will be active the next time you open PowerShell.
//////////////////////////
This will add the proper line to your `profile.ps1` file, and posh-git will be active the next time you open PowerShell.
@z

@x
For a description of the Git status summary information displayed in the prompt see: https://github.com/dahlbyk/posh-git/blob/master/README.md#git-status-summary-information[]
For more details on how to customize your posh-git prompt see: https://github.com/dahlbyk/posh-git/blob/master/README.md#customization-variables[].
@y
//////////////////////////
For a description of the Git status summary information displayed in the prompt see: https://github.com/dahlbyk/posh-git/blob/master/README.md#git-status-summary-information[]
For more details on how to customize your posh-git prompt see: https://github.com/dahlbyk/posh-git/blob/master/README.md#customization-variables[].
//////////////////////////
For a description of the Git status summary information displayed in the prompt see: https://github.com/dahlbyk/posh-git/blob/master/README.md#git-status-summary-information[]
For more details on how to customize your posh-git prompt see: https://github.com/dahlbyk/posh-git/blob/master/README.md#customization-variables[].
@z
