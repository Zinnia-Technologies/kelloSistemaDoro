# ![](media/image1.jpeg){width="2.875in" height="1.25in"}Week 1 Report

## Project Kello App audit (UpWork contract)

> UpWork working week of Apr 3, 2023 - Apr 9, 2023

Consolidating and uploading the informal reports and information
exchange via instant messaging

## First Overview Minutes and Report (April 3^rd^)

- \- The task in hand is even more interesting than my prediction

- \- We have \~ 3,000 files in the app share:

- ---- .CBL files: the source files (my guess the main code is on
  ap100somwthing and ap120something. The remaining files are the sources
  of the .OBJ files.

- ---- .OBJ files: these are compiled .CBL files with all features of
  the program, they were called sub-routines, today known as methods or
  functions.

- ---- .IDY files: these are Microfocus debug and/or index files

- ----. CPF, .CPB, and .MF files: these are data manipulation files,
  likely the most important to point us to the data repo.

- ---- .GS files: Google Script files. What a surprise. About 17%
  (or 500) files are from the Cloud based Google dev environment. I
  quickly set up a new environment for me, hopefully there is nothing
  pegged to a specific account that will prevent me from opening them. I
  have no idea what they are for but, based on the names only, my
  educated guess is that they are IDE related files for both banks and
  clients.

- \- The software was written in 1998 and then updated in 2000. There is
  some code from 2004.

- \- I have no idea about the Google Script files as of yet.

- \- The program in a nutshell is related to cash flow, accounts
  payable, accounts receivable, a mini-CRM, administration of the
  execution of something with clients.

- \- There is a volume of client-related reports generated locally, and
  a considerable amount of information exchanges with Itaú, HSBC, CEF.
  Usually related to customer invoicing, but there is more to
  understand.

- \- The program ran on VirtuOS operating system, believe it or not.
  Apparently, the files were in a server folder and a number of
  workstations could run simultaneously, with the exception of any data
  manipulating module or feature. If a second person tried to run a
  feature working in a file at the same time, the second would receive
  an error message.

- \- There was at least one unspecified machine that ran the entire
  system standalone and could make anything and even override something
  another employee did when that person came back online.

- \- The COBOL program would run only in the local ViruOS LAN. Data was
  stored in folders located on the server. None of the COBOL modules had
  any modern internet-related feature.

- \- I need to urgently understand the role of the Google Script (it is
  a JavaScript like dev tool), and whether they are called by any of the
  COBOL modules

- \- I will start the work tomorrow by uploading the work-plan in the
  Official UpWork project space and use respective module to report
  daily progress.

- \- I will not share any system file through UpWork, only status
  reports as per policy

- \- I will create GitHub repo for the project.

- \- I will set up the Google Developers integrated development
  environment and a local COBOL def environment using MS Visual Studio
  and immediately load all the code.

- \- I believe having the notebook or its hard drive at our reach will
  be imperative to gain access to data stored locally.

- \- if possible, please try to find out if they had the routine to back
  up the data lying in the server. If feasible, you can use any excuse
  for the inquiry, the knowledge about a server backup routine might be
  the only hint we will have about data management.

- \- Cross your fingers for Google scripts. If I succeed in re-deploying
  them, I might gain full access to whatever data is out there.

**Second Overview Minutes and Report (April 4^th^)**

- While creating a Git repo for the app, I took the opportunity to
  organize the files in OneDrive too.

- There are source codes, compiled files, data declaration files,
  executable files.

- Also, I found a huge mistake. However, it is good news: there are no
  google script files whatsoever, the files are actually screen dialog
  files used when programing in Visual COBOL. I guess there was an
  update to add graphic interface to the app at one time.

- I found System Data.

- I will work on the code to find the data declarations and
  save/retrieve data.

- My error made our lives easier, even more considering I am only 4 hrs.
  into the app, it is large and built by different people throughout the
  years.

- I am taking note of the developers and the dates they worked.

**Third Overview Minutes and Report (April 5^th^)**

- I had less time to dedicate to the investigation today.

- The day and - likely - the -next 2 will be dedicated to have a stable
  build of the system running.

- In the entire code the read/write operations are made to/from and F:\\
  drive and its folders, standard for a local area network
  configuration.

- The is a \~180Kbytes DAT file that has just the current state of the
  last data synch.

- I will not make any definitive statement before solid evidence;
  however it is likely Incan have a stable build running locally and no
  data to work with.

- My guestimate is that there is a Local copy in Kello's notebook.

- Or we need to try and find a data backup.

- Nothing of this is definitive.

- Burning the midnight oil, got obsessed after I sent above update (I am
  not reporting these hrs at all).

- While compiling the code, each module calls dozens of files, I am
  trying to isolate a module-by-module basis, but there is a
  considerable amount of syntax errors, I am assuming for now it is
  related to the old version of COBOL used and the tools we have.

- The point is: I am dedicating time to fixing the code to run the
  program, however I believe we need to know the data contents like cash
  flow, balances, etc.

- We need to brainstorm on this to get the best out of this effort.
