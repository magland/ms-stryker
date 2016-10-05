**Step 1: Download and install mountainlab**

https://github.com/magland/mountainlab

**Step 2: Parse the raw data .rhd files**

Actually you don't need to do this (see below), but the information on how to do it is contained in the scripts:
parse_stryker_raw.m
prepare_dataset.m

**Step 3: Run the processing**

```
kron-run ms ds1
```

If you don't have the raw data on your system you will get a message that tells you to re-run this command using the --_prvgui command.

```
kron-run ms ds1 --_prvgui
```

This will open the GUI which will allow you to download the raw data from the ms-stryker server.

However, to see that server you need to configure your mountainlab/mountainlab.user.json file.

Copy mountainlab.default.json -> mountainlab.user.json

and then add the ms-stryker stuff like this:

```
...
      "prv":{
                "local_search_paths":[
                        "examples",
                        "/home/magland/dev/ms-stryker"
                ],
                "servers":[
                        {"name":"ms-stryker","passcode":"SECRET-PASSCODE-I-WILL-EMAIL-YOU","host":"http://67.205.129.156","port":8080$
                        {"name":"datalaboratory","passcode":"","host":"http://datalaboratory.org","port":8080,"path$
                        {"name":"localhost","passcode":"","host":"http://localhost","port":8080,"path":"/prv"}
                ]
        },
```

Now run the processing command with --_prvgui again and you will see an option to download the raw data from the ms-stryker server. Once it is downloaded, run the sorting command again.

**Step 4: View the results**

```
kron-view results ms ds1 --curation=curation.script
```
