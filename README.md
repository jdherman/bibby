###bibble
Search for BibTeX citations from the command line, using the CrossRef API

Uses only native *nix tools: curl, grep, and sed. Even works in Cygwin. This could be a lot cleaner with other tools like [jq](link) for json parsing.

Example usage:
```
./bibble.sh "deb 2002 NSGA-II"
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

For more info, see:
* [Resolving Citations](http://labs.crossref.org/resolving-citations-we-dont-need-no-stinkin-parser/)
* [CrossRef REST API docs](https://github.com/CrossRef/rest-api-doc/blob/master/funder_kpi_api.md)
