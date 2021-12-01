# processrcs_wrapper

processrcs_wrapper() is a wrapper for [ProcessRCS()](https://github.com/openmind-consortium/Analysis-rcs-data/blob/master/code/ProcessRCS.m) that outputs certain files as CSV outputs. These CSV files can then be used as inputs for my [rcs_lfp_analysis](https://github.com/molaruna/rcs_lfp_analysis) repo.

## Getting Started

This code uses Matlab 2019b, and the [Analysis-rcs-data](https://github.com/openmind-consortium/Analysis-rcs-data) repository.

To run the code, first find the parent directory of your Sessions folders:
```
(base) ➜  RCS07L_pre-stim git:(master) ✗ pwd
/Users/mariaolaru/Documents/RCS07/RCS07L/RCS07L_pre-stim
(base) ➜  RCS07L_pre-stim git:(master) ✗ ls
Session1570875824700
Session1570924382813
Session1570925029056
Session1570937044332
Session1570955823964
```
Now, in the Matlab command window, input the parent directory of the Sessions folders:
```

processrcs_wrapper('/Users/mariaolaru/Documents/RCS07/RCS07L/RCS07L_pre-stim')
```

## Data
Data is collected from the Summit RC+S neurostimulator (Medtronic) and available on [UCSF Box](https://ucsf.app.box.com/folder/0) and [Dropbox](https://www.dropbox.com/work). You can request access from me. 

## Analysis
Raw JSON files from each Session directory are formatted and processed into MAT and CSV files that are output into the same respective Session directories.

## License
This software is open source and under an MIT license.
