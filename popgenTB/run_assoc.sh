#!/usr/bin/env bash

echo -e "FID\tIID\tC1\tC2\tC3\tC4" > raw.data.cov
cut -f1-3,5,12,13 pheno.txt >> raw.data.cov

#plink --bfile raw.data --assoc --adjust --ci 0.95 --out all.assoc
#plink --bfile raw.data --assoc --adjust --ci 0.95 --out mtb.assoc --keep mtb.control.sample.ids
#plink --bfile raw.data --assoc --adjust --ci 0.95 --out afr.assoc --keep afr.control.sample.ids
plink2 --bfile raw.data --glm hide-covar --adjust --ci 0.95 --covar raw.data.cov --covar-name C1-C4 --out all.assoc.with.covar
plink2 --bfile raw.data --glm hide-covar --adjust --ci 0.95 --keep mtb.control.sample.ids --covar raw.data.cov --covar-name C1-C4 --out mtb.assoc.with.covar
plink2 --bfile raw.data --glm hide-covar --adjust --ci 0.95 --keep afr.control.sample.ids --covar raw.data.cov --covar-name C1-C4 --out afr.assoc.with.covar
