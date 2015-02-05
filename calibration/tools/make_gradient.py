


import fileinput
i = 190

for line in fileinput.input(inplace=True):
    if "move to next layer" in line:
        i = i + 0.025
        line = line + "M104 S" + "{:.3f}".format(i)
    else:
        line = line[:-1]
    print(line)#, end="") # this goes to the current

fileinput.close()