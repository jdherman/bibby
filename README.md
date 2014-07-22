##bibby
Search for BibTeX citations from the command line, using the CrossRef API.

```
usage: ./bibby.sh options

Options:
   -h      Help
   -f      Format: choose one of {bib, rdf, ris, json, text}. Default is bib.
   -q      Search query (in quotes; required)
   -n      Number of results to include. Default 1.
```

Example usage:
```
./bibby.sh -f bib -q "deb 2002 NSGA-II"
```

Output:
```
@article{Deb_2002,
         doi = {10.1109/4235.996017},
         url = {http://dx.doi.org/10.1109/4235.996017},
         year = 2002,
         month = {Apr},
         publisher = {Institute of Electrical \& Electronics Engineers (IEEE)},
         volume = {6},
         number = {2},
         pages = {182-197},
         author = {K. Deb and A. Pratap and S. Agarwal and T. Meyarivan},
         title = {A fast and elitist multiobjective genetic algorithm: NSGA-II},
         journal = {IEEE Transactions on Evolutionary Computation}
}
```

Uses only native *nix tools: curl, grep, and sed. Even works in Cygwin. This could be a lot cleaner with other tools like [jq](link) for json parsing. __Warning:__ may have problems if the DOI cannot be found, or resolves incorrectly. If this happens, try using the `-n` flag to see if the result you want is further down the list.

For more info, see:
* [Resolving Citations](http://labs.crossref.org/resolving-citations-we-dont-need-no-stinkin-parser/)
* [CrossRef API docs](http://www.crosscite.org/cn/)
