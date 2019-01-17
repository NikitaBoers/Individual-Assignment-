import json
filename = 'conflict_data_full_lined.json'

russia_conflicts=[]
turkey_conflicts=[]
with open(filename) as file:

    for line in json.load(file):
        country=line['country']
        if 'Russia' in country:
            type_of_violence_russia=line['type_of_violence']
            russia_conflicts.append(type_of_violence_russia)
        if 'Turkey' in country:
            type_of_violence_turkey=line['type_of_violence']
            turkey_conflicts.append(type_of_violence_turkey)
            

print(russia_conflicts)
print(turkey_conflicts)

with open ('russia_conflicts.csv ', 'w') as file :
    file.write('russia')
    for entry in russia_conflicts:
        file.write(str(entry)) 

with open ('turkey_conflicts.csv', 'w') as file:
    file.write('turkey')
    for entry in turkey_conflicts:
        file.write(str(entry))

        
        

