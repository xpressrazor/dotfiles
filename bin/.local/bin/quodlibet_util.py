#!/usr/bin/env python3

import subprocess 
import os

# Start quodlibet and start playing if not started
# If started toggle-window, playing status does not change

try:
    result = subprocess.run(['quodlibet', '--status'], capture_output=True, text=True, check=True)
    
    print("Running toggle window")
    subprocess.run(['quodlibet', '--toggle-window'])

except subprocess.CalledProcessError as e:
    print("Not running, starting..")
    os.system("quodlibet --run")
    #os.system("quodlibet --run --play --start-hidden")
    
except FileNotFoundError:
    print("Quodlibet not installed, please install it")

