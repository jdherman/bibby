#!/bin/bash
# Command line search for resolved references using the CrossRef API
# created by @jdherman

usage()
{
cat << EOF
usage: $0 options

OPTIONS:
   -h      Show this message
   -f      Format: choose one of {bib, rdf, ris, json, text}. Default is bib.
   -q      Search query (in quotes; required)
   -n      Number of results to include. Default 1.
EOF
}

QUERY=
NUMBER=1
FORMAT='application/x-bibtex'
while getopts “hq:f:n:” OPTION
do
  case $OPTION in
    h)
      usage
      exit 1
      ;;
    q)
      QUERY=$OPTARG
      ;;
    f)
      case $OPTARG in
        ris)
          FORMAT='application/x-research-info-systems'
          ;;
        bib)
          FORMAT='application/x-bibtex'
          ;;
        rdf)
          FORMAT='application/rdf+xml'
          ;;
        json)
          FORMAT='application/vnd.citationstyles.csl+json'
          ;;
        text)
          FORMAT='text/x-bibliography'
          ;;
        ?)
          usage
          exit
          ;;
      esac
      ;;
    n)
      NUMBER=$OPTARG
      ;;
    ?)
      usage
      exit
      ;;
  esac
done

if [[ -z $QUERY ]]
then
     usage
     exit 1
fi

JSON=`curl -G -s "http://search.labs.crossref.org/dois" --data-urlencode "q=$QUERY" -d "rows=$NUMBER"`
DOI=`echo $JSON | grep -o -m $NUMBER 'http\:\/\/dx\.doi\.org\/[^"]*' | sed 's/http:\/\/dx.doi.org\///g'`
DOI=($DOI)

for d in "${DOI[@]}"
do
    curl -G -s "http://api.crossref.org/v1/works/${d}/transform/$FORMAT"
    echo ""
done
