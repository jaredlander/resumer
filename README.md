<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/jaredlander/resumer.svg?branch=master)](https://travis-ci.org/jaredlander/resumer) [![Coverage Status](https://img.shields.io/codecov/c/github/jaredlander/resumer/master.svg)](https://codecov.io/github/jaredlander/resumer?branch=master) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/resumer)](http://cran.r-project.org/package=resumer)

resumer
=======

This package stores information for your CV in a CSV and compiles a nicely formatted LaTeX CV.

Data
----

Your jobs should be stored in a CSV with these names: JobName, Company, Location, Title, Start, End, Bullet, BulletName, Type, Description.

An example file can be found in [`inst/examples/Jobs.csv`](https://github.com/jaredlander/resumer/blob/master/inst/examples/Jobs.csv) or by running

``` r
data(jobs)
head(jobs)
```

| JobName      | Company               | Location     | Title  |  Start| End     | Bullet                                                              |  BulletName| Type | Description |
|:-------------|:----------------------|:-------------|:-------|------:|:--------|:--------------------------------------------------------------------|-----------:|:-----|:------------|
| Tech Startup | Pied Piper            | New York, NY | CTO    |   2013| Present | Set up company's computing platform                                 |           1| Job  |             |
| Tech Startup | Pied Piper            | New York, NY | CTO    |   2013| Present | Designed data strategy overseeing many datasources                  |           2| Job  |             |
| Tech Startup | Pied Piper            | New York, NY | CTO    |   2013| Present | Constructed statistical models for predictive analytics of big data |           3| Job  |             |
| Large Bank   | Goliath National Bank | New York, NY | Quant  |   2011| 2013    | Built quantitative models for derivatives trades                    |           1| Job  |             |
| Large Bank   | Goliath National Bank | New York, NY | Quant  |   2011| 2013    | Wrote algorithms using the R statistical programming language       |           2| Job  |             |
| Bank Intern  | Goliath National Bank | New York, NY | Intern |   2010|         | Got coffee for senior staff                                         |           1| Job  |             |

Usage
-----

In order to make this package as universal as possible it is designed for some information to be input in the yaml header and some in R code. Creating a new file using the template through RStudio will be easiest.

### yaml header

Here you put your name, address, the location of the jobs CSV, education information and any highlights.

Resources
---------

### LaTeX Templates

-   <https://www.sharelatex.com/blog/2011/03/27/how-to-write-a-latex-class-file-and-design-your-own-cv.html>

### Pandoc

-   <http://pandoc.org/scripting.html>
-   <http://pandoc.org/README.html#header-identifiers-in-html-latex-and-context>
-   <https://github.com/jgm/pandocfilters/blob/master/pandocfilters.py>
-   <http://galahad.well.ox.ac.uk/repro/#latex-output>
