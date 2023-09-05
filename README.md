
<!-- README.md is generated from README.Rmd. Please edit that file -->

# juicedown

<!-- badges: start -->

[![R-CMD-check](https://github.com/kenjisato/juicedown/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/kenjisato/juicedown/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of juicedown is to offer useful tools to minimize routine
formatting of page contents on such CMS/LMS as Moodle where code editor
silently ignore style and link tags. To generate CSS-inlined HTML, the
package uses [juicyjuce](https://CRAN.R-project.org/package=juicyjuice)
package along with [knitr](https://cran.r-project.org/package=knitr) and
[markdown](https://cran.r-project.org/package=markdown) packages.

## Installation

Sometime soon (hopefully!), you can install it from CRAN like so:

``` r
install.packages("juicedown")
```

For the time being, you can install the development version of juicedown
from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("kenjisato/juicedown")
```

## Example

``` r
library(juicedown)
```

Main function is `convert()`. (Usually, you do not need `dir` argument)

``` r
convert(juicedown_example("markdown", "sample.md"), dir = ".", clip = FALSE)

# See the result
# browseURL("sample.html")
```

List sample file directories with

``` r
juicedown_example()
#> [1] "from-html"  "include"    "javascript" "markdown"   "yaml-meta"
```

List contents in the sample with

``` r
juicedown_example("javascript")
#> [1] "economics.xlsx" "sample.html"    "sample.Rmd"
```

How to see the source:

``` r
file.show(juicedown_example("javascript", "sample.Rmd"))
```
