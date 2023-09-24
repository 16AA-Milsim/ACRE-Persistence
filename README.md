# ACRE-Persistence
Save your radio configuration between missions and restore it automatically upon respawn.

## Features
- Save and load your radio configuration between sessions
- Restore radio configuration on respawn
- Configure default speech volume for group leaders and players

## Requirements
- CBA
- ACRE
- ACE
## Download
Steam workshop: TBD  
Github: [Releases tab](https://github.com/16AA-Milsim/ACRE-Persistence/releases)  

## Usage
Detailed instructions can be found in the diary section on the map screen.

![ace self interact](data/acre_persistence_ace-interact.gif)

### Configuration
All configuration is done via CBA settings.

![CBA Settings](data/CBA_settings.png)

### Limitations
- The power state of radios cannot be saved or restored, if you'd like to disable radios turn their volume to 0.
- The radio configuration data is specific to your used Arma 3 profile, if you switch profiles it won't be available.

## FAQ
#### Is this a clientside mod?
Yes, it's an optional clientside mod because everything runs locally on the player.

#### Can I include this mod in our repacked modpack?
If you really want to, yes. But you will have to provide the full source of your modpack as mandated by this mods [GPLv3 license](/LICENSE). If you're worried about the 25 mods limit in the Arma launcher, increase your [steamProtocolMaxDataSize](https://community.bistudio.com/wiki/Arma_3:_Server_Config_File) in your server.cfg file. Makes your life easier and mine.

#### Will this create any radios?
No, it only restores the radios configuration, if you are missing radios it will attempt to restore as much as possible.

#### Will this break ACRE?
It *shouldn't*, 16AA has been running a script version of this for about a year now without any issues. We are only using documented, public ACRE functions and are not copying any radio IDs.

#### How do I report bugs?
Head to the [Issues tab](https://github.com/16AA-Milsim/ACRE-Persistence/issues/new) and fill out the template! Include as much detail as possible so we can reproduce the bug.

## Contribute

This mod uses [HEMTT](https://github.com/BrettMayson/HEMTT). Download the latest .exe and add it to this repo or to your PATH.  
Thanks to @TACHarsis for providing a [mod template](https://github.com/TACHarsis/hemtt-mod-template) that got all this started.  
The default speech volume functionality has been provided by @3Mydlo3 at [ArmaForces](https://armaforces.com/), thanks for that!  

    build.bat           - to build without signing. Will build into '.hemttout\build' directory.
    build_dev.bat           - to build dev version, set up for file patching with associated softlinks. Will build into '.hemttout\dev' directory.
    build_release.bat   - to build ready for release with signing.  Will build into '.hemttout\release' directory.


## Images
![saved settings](data/saved_settings.png)
![diary entry](data/diary_entry.png)
