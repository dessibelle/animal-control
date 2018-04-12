#/bin/bash

BASE_INTERVAL=0.01

function toggle() {
    interval=$1

    animal-control D
    sleep $interval
    animal-control d
    # sleep $interval
    animal-control C
    sleep $interval
    animal-control c
    # sleep $interval
}

function interval() {
    VALUE=$1
    perl -e "print ${VALUE} * ${BASE_INTERVAL}"
}

for i in {1..5} ; do
    for j in {1..9} ; do
        INTERVAL=$(interval $j)
        toggle $INTERVAL
    done
    for j in {10..2} ; do
        INTERVAL=$(interval $j)
        toggle $INTERVAL
    done
done
