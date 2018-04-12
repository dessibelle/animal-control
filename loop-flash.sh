#/bin/bash

for i in {1..10} ; do
    animal-control D
    sleep 0.01
    animal-control d
    sleep 0.01
    animal-control C
    sleep 0.01
    animal-control c
    sleep 0.01
done

animal-control d
animal-control c
