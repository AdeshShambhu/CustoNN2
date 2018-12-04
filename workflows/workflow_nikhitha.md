## Connection types and performance
- Currently prefer ssh for connecting to CC frontend.
- Xrdp also working with remote desktop client on Mac OS


## Repositories
- I have two copies of repositories, one in my working directory on the CC cluster frontend, another locally on my laptop.


## Local copies of documentation
- I have saved all the related  git documentation in a pdf and saved locally.

## Task 2
- We have currently logged in to the Custom Computing(CC) Cluster. This contains Nallatech 385A boards with Intel/Altera Arria 10 GX 1150 FPGA.  
- Later on I expect we would be using the Noctua cluster which contains Nallatech 520N boards with Stratix 10 FPGAs.

## Task 3
- Both ssh and xrdp connections are working properly for the CC cluster. 
- Altera Compiler Sanity checks were performed with the given commands in the documentation of FPGA .
- Path to my mounted user name is **/upb/departments/pc2/users/n/nikhitha**
- Able to edit and access .bashrc file from the CC Cluster.

# Task 4
## Documentation and Knowledge Base
### **FPGAs and OpenCL SDK tool versions**
- Worked with 2 tool versions: 17.1.2 and 18.0.1
- Each version supports different boards
- https://wiki.pc2.uni-paderborn.de/pages/viewpage.action?pageId=19562930.

### **Gitlab merge request**
- As a part of task 2, I created a new branch and pushed my changes on git. Then created a merge request.

### **aoc command line options**
- Used "-march=emulator" to create aocx file. We also specified the board with this command.

### **Mounting university file systems**

## Git best practices
### **git status**
- to check the current state of the repository 
- displays current branch
- displays untracked files
- displays uncommited changes
- displays changes that are not staged

### **git add -n**
- git add: use to stage the changes
- The "index" holds a snapshot of the content of the working tree, and it is this snapshot that is taken as the contents of the next commit. Thus after making any changes to the working tree, and before running the commit command, we must use the add command to add any new or modified files to the index.
- "-n" is used as --dry-run : Doesn't actually add the file, just shows if it exists.

### **git commit -m "message"**
- commits the file on to the repository with the message


