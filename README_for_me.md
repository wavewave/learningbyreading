```
$ cd ext
$ ./install_candc.sh
$ ./install_ukb.sh
```

To test C&C and Boxer
```
$ cd candc
$ bin/t --input ../../testcorpus/snse001.txt   --output snse001.tok
$ bin/candc --input snse001.tok --models models/boxer  --candc-printer boxer --output snse001.ccg
$ bin/boxer --input snse001.ccg  --semantics drs --box  --roles verbnet --format no --output snse001.drs
$ bin/boxer --input snse001.ccg  --semantics fol --box  --roles verbnet --format prolog --output snse001.fol
```

To test KNEWS. 
```
$ cd ../..   # go to learningbyreading top directory
$ src/pipeline.py -i testcorpus/snse002.txt -o snse002.out
```

