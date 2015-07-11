#!/bin/sh
# unix script to generate all the plots
# run processes in the background to take advantage of multi-core

./plot1.R &
./plot2.R &
./plot3.R &
./plot4.R 

