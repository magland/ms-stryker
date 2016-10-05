Step 1: Download and install mountainlab

Step 2: Parse the raw data .rhd files

Actually you don't need to do this (see below), but the information on how to do it is contained in the scripts:
parse_stryker_raw.m
prepare_dataset.m

Step 3: Run the processing

kron-run ms ds1

If you don't have the raw data on your system you will get a message that tells you to re-run this command 


kron-view results ms ds1 --curation=curation.script
