#!/usr/bin/env python3

import sys
import subprocess
import os
import time

if len(sys.argv) >= 3:
    
    workspaceswitchcmd = ['hyprctl', 'dispatch', 'workspace', sys.argv[2]]
    # Switch workspace first
    openprocess = subprocess.Popen(workspaceswitchcmd)
    #return_code = openprocess.wait()
    #time.sleep(0.3)

    workspacenumbercd = ""
    workspaceid = ""
    classval = sys.argv[3]
   
    # Using class_name match workspace as well
    
    #if len(sys.argv) == 4:
    #    classval = sys.argv[3]

    workspaceidcmd = "hyprctl clients -j | jq -r '.[] | select(.class == \"" + classval + "\") | .workspace.id'"

    print("workspaceid: " + str(workspaceidcmd) + ", classval: " + classval)

    
    os.system(workspaceidcmd)
    workspaceid = os.popen(workspaceidcmd).read();

    print("workspace id: " + str(workspaceid))

    if sys.argv[1].count(".") == 2:
        pscmd = 'flatpak ps | grep ' + sys.argv[1];
        os.system(pscmd)
        result = os.popen(pscmd).read()

        if len(result) == 0 or workspaceid.count(sys.argv[2]) == 0:
            subprocess.Popen(['flatpak', 'run', sys.argv[1]])
    else:
        hyprcmd = 'hyprctl clients | grep -i class | grep ' + sys.argv[1]
        os.system(hyprcmd)
        result = os.popen(hyprcmd).read()
        
        if len(result) == 0 or workspaceid.count(sys.argv[2]) == 0:
            subprocess.Popen(sys.argv[1])
else:
    print("Invalid arguments: opensingle.py <app_name> <workspace_number <class>")
    print("E.g. opensingle.py com.google.Chrome 3 google-chrome")
    print("E.g. opensingle.py thunar 5")
    print("E.g. opensingle.py thunar 5 thunar")

