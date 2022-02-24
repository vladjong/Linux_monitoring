# Linux_monitoring
Linux basic bash scripting and system research.

## Part 1

Write a bash script. The script is activated with one parameter. Text parameter.
The script outputs the value of the parameter.
If the parameter is a number, then a message about the authorship of the input should be displayed.

## Part 2

Write a bash script. The script should display information in the form:

**HOSTNAME** = _hostname_
**TIMEZONE** = _timezone in the form: **America/New_York UTC -5** (timezone, must be taken from the system and be correct for the current location)_
**USER** = _current user who ran the script_
**OS** = _type and version of operating system_
**DATE** = _current time as: **12 May 2020 12:24:36**_
**UPTIME** = _system uptime_
**UPTIME_SEC** = _system uptime in seconds_
**IP** = _ip address of the machine on any of the network interfaces_
**MASK** = _network mask of any of the network interfaces in the form: **xxx.xxx.xxx.xxx**_
**GATEWAY** = _ip of default gateway_
**RAM_TOTAL** = _size of RAM in Gb with an accuracy of three decimal places in the form: **3.125 Gb**_
**RAM_USED** = _size of used memory in GB with three decimal places_
**RAM_FREE** = _size of free memory in GB with an accuracy of three decimal places_
**SPACE_ROOT** = _size of the root partition in MB with a precision of two decimal places in the form: **254.25 MB**_
**SPACE_ROOT_USED** = _the size of the used space of the root partition in Mb with a precision of two decimal places_
**SPACE_ROOT_FREE** = _size of root partition in MB with two decimal places_

After displaying the values, offer to write the data to a file (prompt the user to answer **Y/N**).
Answers **Y** and **y** are considered positive, all others are negative.
With the consent of the user, in the current directory, create a file containing the information that was displayed on the screen.
The file name should look like this: **DD_MM_YY_HH_MM_SS.status** (The time in the file name should indicate when the data was saved).

## Part 3

Write a bash script. Take the script from [**Part 2**](#part-2-system-exploration) as a basis and remove the part responsible for saving data to a file from it.
The script is run with 4 parameters. The parameters are numeric. From 1 to 6, for example:
`script03.sh 1 3 4 5`

Color designations: (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)
**Parameter 1** is the background of the value names (HOSTNAME, TIMEZONE, USER, etc.)
**Parameter 2** is the font color of the value names (HOSTNAME, TIMEZONE, USER, etc.)
**Parameter 3** is the background of the values (after the '=' sign)
**Parameter 4** is the font color of the values (after the '=' sign)

## Part 4

Write a bash script. Based on the script from [**Part 3**](#part-3-visual-output-for-system-exploration-script). Color designations are similar.
The script is run without parameters. The parameters are set in the configuration file before the script is launched.
The configuration file should look like:
```
column1_background=2
column1_font_color=4
column2_background=5
column2_font_color=1
```

If one or more parameters are not specified in the configuration file, then the color must be substituted from the default color scheme. (Choice at the discretion of the developer).

## Part 5

Write a bash script. The script is launched with one parameter.
The parameter is an absolute or relative path to some directory. The parameter must end with a '/', for example:
`script05.sh /var/log/`

The script should display the following information about the directory specified in the parameter:
- Total number of folders including subfolders
- Top 5 folders with the largest weight in descending order (path and size)
- Total number of files
- Number of configuration files (with .conf extension), text files, executable files, logs (files with .log extension), archives, symbolic links
- Top 10 files with the largest weight in descending order (path, size and type)
- Top 10 executables with the largest weight in descending order (path, size and hash)
- Script execution time
