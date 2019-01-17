import json
filename = 'conflict_data_full_lined.json'

russia_conflicts=[]
turkey_conlficts=[]
with open(filename) as file:

    for line in json.load(file):
        country=line['country']
        if 'Russia' in country:
            type_of_violence_russia=line['type_of_violence']
            russia_conflicts.append(type_of_violence_russia)
        if 'Turkey' in country:
            type_of_violence_turkey=line['type_of_violence']
            turkey_conlficts.append(type_of_violence_turkey)
            

print(russia_conflicts)
print(turkey_conlficts)
str_russia_conflicts=str(russia_conflicts)
str_turkey_conflicts=str(turkey_conlficts)
with open ('russia_conflicts. csv ', 'w') as file :
    file . write (str_russia_conflicts) # the \n is for newline

with open ('turkey_conflicts.csv', 'w') as file:
    file.write(str_turkey_conflicts)

        

