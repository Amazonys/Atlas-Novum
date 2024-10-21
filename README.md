### DLC REQUIREMENTS
From our observations, Art of War and Leviathan are needed for the game to not crash.  

### COMPATIBILITY ACROSS MOD VERSIONS/COMMITS
It should be assumed that newer commits aren't compatibile with games in progress.  
If you have a game in progress, it might be best to stay on a certain mod version/commit until the end of that save, unless a commit specifically targets a bug report you've made.  

### ATLAS NOVUM INSTALLATION INSTRUCTIONS

#### 1. Obtain the code

This is possible from Github of from Steam Workshop. 
- [Github version](https://github.com/Amazonys/Atlas-Novum)
- [Steam Workshop Github mirror](https://steamcommunity.com/sharedfiles/filedetails/?id=2664819806)
	
The Steam Workshop version lags behind slightly, but all Github changes eventually make their way there.
	
#### Github instructions
Methods of downloading from Github include:
- [Github Desktop](https://desktop.github.com/) GUI client
- [Git](https://git-scm.com/) CLI client
- ZIP direct download  
and probably others.
	
##### Github Desktop Client instructions:		
1. Download and Install GitHub Desktop:
			https://desktop.github.com/
2. Link ATLAS NOVUM to your GitHub:

Go to File and click:
Clone Repository.  
Click on URL ([Preview](https://gyazo.com/ef5734c701bf4df2503ffa6be534220d))
and copy in this link:
https://github.com/Amazonys/Atlas-Novum

Locate and find the EU4 Mod folder in your documents.
([Preview](https://gyazo.com/aaff75a0f22f180d76cc2068e5bf2591))

Create a new folder, doesn't matter what it is named because its semi-storage.

Select this folder in Locate.

And then click clone.

##### Download the ZIP file and/or Link it to GitHub
Another option you have is to download the ZIP file from: https://github.com/Amazonys/Atlas-Novum

Click on the green Code Button and select download ZIP.

Extract the contents of the ZIP file to your Mod Folder.

Optional: To import the downloaded ZIP into the Github Desktop client, open up GitHub Desktop and click on current repository, then ADD, then Add Existing Repository and then locate the now downloaded ZIP file.

##### Git CLI client instructions
Run:
```
cd {path to the mod folder}
git clone https://github.com/Amazonys/Atlas-Novum.git
```
		
#### 2. Making it work

Now that you have Atlas Novum cloned, make sure it is in the correct location in your mod folder like this:

Windows:  
`C://Users/USER/Documents/Paradox Interactive/Europa Universalis IV/mod/Atlas-Novum/`  
GNU/Linux:  
`/home/$USER/.local/share/Paradox Interactive/Europa Universalis IV/mod/Atlas-Novum/`  
MacOS:  
`/Users/USER/Documents/Paradox Interactive/Europa Universalis IV/mod/Atlas-Novum/`  
	
If you use the PDX Launcher, move or copy the `!AtlasNovum.mod` file from the `MANUAL-GIT-INSTALL` folder to the /mod/ folder, so that it is outside the Atlas-Novum folder. 

Rename it, so that it has the same name as the folder containing the mod.

Example:  
Contents of (…)/Europa Universalis IV/mod/:
- Atlas-Novum (folder)
- Atlas-Novum.mod

Now you can load up EU4 and the mod should show up under the name of Atlas Novum: Manual Install.

If you use the Irony Mod Manager, Atlas Novum would show up 3 times.  
You can identify the correct mod by checking the trophy icon, the correct mod will have the broken trophy icon.  
Alternatively, to get rid of the other, not working entries, you can delete everything in the folder /Atlas-Novum/ except for the subfolder /AN_Core/. The other files are mostly developer-related.  
This will eliminate the other descriptor files, which are being picked up by IMM.

###

CHECK OUT THE DISCORD FOR ADDITIONAL HELP
