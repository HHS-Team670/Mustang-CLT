# Mustang-CLT
Command Line Tools: parsing log files, etc.

`show_graph.py` runs logfinder, and shows the data in a graph. This is the preferred way to use logfinder. 

### CLI Options for show_graph.py
- Use `-c` or `--use_cache` to not collect data from the robot and use pre-existing data.
- Use `-g` or `--no_graph` to collect data from the robot but not display a graph.

`logfinder.sh` downloads PID data from the robot and converts it to a CSV file. This is ideal if you only want the CSV conversion without displaying the graph. This works on any system.

`logfinder.bat` downloads PID data from the robot and converts it to a CSV file. This is ideal if you only want the CSV conversion without displaying the graph This only works in Windows devices.

## Troubleshooting
- If logs are lost, run this command on the robot
`ln -s /var/local/natinst/log/FRC_UserProgram.log FRC_UserProgram.log`

## Branching and Workflow on this Repository<br/>
Please check this document for the team's policy for committing code to GitHub!<br/>
https://docs.google.com/document/d/1vO_dtVTDw3-l0x0BabiAE5C45O6bJlQeLL1Uy9McOcQ/edit?usp=sharing <br/>
**Note that you cannot commit directly to master or dev!**<br/>
This project shall follow the following workflow:<br/>

The master branch is considered the stable branch of this project. It may only be updated via pull request from student developer, and then only with Code Leads' approval.<br/>

The dev branch is the main working branch. It may only be updated by pull request from uncontrolled branches.<br/>

For regular development each developer shall create a "feature branch" this is a branch named in the convention: "feature/name" or "bugfix/name". These are for new features and for bugfixes, respectively.<br/>

When work starts on a new feature, its branch will be made off of the latest version of dev, and all development will occur on the branch. When the feature is considered ready, it will be merged onto the dev branch. When merging, automatic merging, LV Merge tool merging, or simply copying and pasting of code fragments may be necessary.

If you have an idea for a useful command line tool, feel free to create a branch and implement it.

## Notes:
Use optparse to parse the commandline for arguments for all commands.

