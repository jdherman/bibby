#!/bin/bash
# Command line search for BibTeX references using the CrossRef API
# created by @jdherman

JSON=`curl -G -s "http://search.labs.crossref.org/dois" --data-urlencode "q=$1" -d "rows=1"`
DOI=`echo $JSON | grep -o 'http\:\/\/dx\.doi\.org\/[^"]*' | sed 's/http:\/\/dx.doi.org\///g'`
curl -G -s "http://api.crossref.org/works/${DOI}/transform/application/x-bibtex"
