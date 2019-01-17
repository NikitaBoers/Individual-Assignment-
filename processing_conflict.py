import json
filename = 'conflict_data_full_lined.json'

all_conflicts=[]
with open(filename) as file:

    for line in json.load(file):
        country=line['country']
        if 'Russia' in country:
            russia=[]
            russia.append(line['type_of_violence'])
            russia.append(line['country'])
            russia.append(line['year'])
            russia.append(line['latitude'])
            russia.append(line['longitude'])
            all_conflicts.append(russia)
        if 'Turkey' in country:
            turkey=[]
            turkey.append(line['type_of_violence'])
            turkey.append(line['country'])
            turkey.append(line['year'])
            turkey.append(line['latitude'])
            turkey.append(line['longitude'])
            all_conflicts.append(turkey)
            

print(all_conflicts)

import csv

header = ['type_of_conflict', 'country', 'year', 'latitude', 'longitude']
with open ('all_conflicts.csv','w') as file :
    writer = csv.writer(file , lineterminator ='\n', delimiter =',')
    writer.writerow(header)
    for conflict in all_conflicts :
        writer.writerow(conflict)
        

