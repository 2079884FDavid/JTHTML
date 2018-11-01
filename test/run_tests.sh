#!/bin/bash

mkdir -p obj/
ghc -package test-framework -package test-framework-quickcheck2 \
    -package test-framework-hunit -threaded Tests.hs \
    --make -i.:../.. -outputdir obj/ -o Tests

./Tests -a 1000 --jxml=test-results.xml
