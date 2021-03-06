Manuscript Materials 2019
================
Cynthia M Kroeger and Keisuke Ejima
6/7/2019

## Project Description

This project studied the prevalence and impact of the error of using
classic nonparametric tests in the presence of heteroscedasticity within
nutrition obesity research. Details of which have been submitted for
peer-reviewed publication. This repository contains the data and code
used to substantiate the manuscript. The full manuscript, which includes
methodological details, will be added to this repository following the
journal’s embargo lift. A developing version of this project was
presented previously at The Obesity Society (TOS) Obesity Week Annual
Scientific Meeting in 2018 (DOI: 10.5281/zenodo.14800042).

## Contact Information for Repository Authors

Cynthia M. Kroeger, PhD, Postdoctoral Fellow, Charles Perkins Centre,
School of Pharmacy, Faculty of Medicine and Health, The University of
Sydney. <cynthia.kroeger@sydney.edu.au> (Principal Investigator and
Corresponding Author)

Keisuke Ejima, PhD, Postdoctoral Fellow, Department of Epidemiology and
Biostatistics, Indiana University School of Public Health-Bloomington.
<kejima@iu.edu>

## Description of Supporting Materials

### Data

**File name for dataset:** manuscript\_materials\_2019\_data\_review.csv

**Full names and definitions of column headings**

| Column Heading   | Definition                                                  | Possible Values                                                                                                                                                                                                                                                                                                                                                                           |
| ---------------- | ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| authors          | authors of included study                                   |                                                                                                                                                                                                                                                                                                                                                                                           |
| doi              | doi of included study                                       |                                                                                                                                                                                                                                                                                                                                                                                           |
| link             | link to full text of included study                         |                                                                                                                                                                                                                                                                                                                                                                                           |
| type             | type of study design                                        | intervention; observational                                                                                                                                                                                                                                                                                                                                                               |
| model            | type of model organism                                      | rodents; humans                                                                                                                                                                                                                                                                                                                                                                           |
| test             | type of nonparametric test used                             | kruskal = Kruskal-Wallis; whitney = Mann-Whitney U; signed = Signed rank; nonparametric = “non-parametric test”                                                                                                                                                                                                                                                                           |
| methods          | appropriateness of nonparametric test use                   | error = clear use of nonparametric test in presence of heteroscedasticity; nolink = no link between use of heteroscedasticity term and rationale for nonparametric test use; ambiguous = states assumptions were tested but does not clearly state heteroscedasticity was not present; correct = clearly stated heteroscedasticity was not present when a the nonparametric test was used |
| significance     | statistical significance of results from nonparametric test | significant = result was statistically significant; mixed = some statistically significant, some statistically insignificant; not = not statistically significant                                                                                                                                                                                                                         |
| reads            | number of article Mendeley reads                            |                                                                                                                                                                                                                                                                                                                                                                                           |
| posts            | number of article posts in the internet                     |                                                                                                                                                                                                                                                                                                                                                                                           |
| score            | Altmetric score                                             |                                                                                                                                                                                                                                                                                                                                                                                           |
| public           | number of posts made by the public                          |                                                                                                                                                                                                                                                                                                                                                                                           |
| scientists       | number of posts made by scientists                          |                                                                                                                                                                                                                                                                                                                                                                                           |
| communicators    | number of posts made by science communicators               |                                                                                                                                                                                                                                                                                                                                                                                           |
| physicians       | number of posts made by physicians                          |                                                                                                                                                                                                                                                                                                                                                                                           |
| citations        | number of citations in peer-reviewed journals               |                                                                                                                                                                                                                                                                                                                                                                                           |
| date\_published  | date article was published                                  |                                                                                                                                                                                                                                                                                                                                                                                           |
| date\_extracted  | date citation and altmetric data was extracted              |                                                                                                                                                                                                                                                                                                                                                                                           |
| date\_difference | date\_extracted - date\_published                           |                                                                                                                                                                                                                                                                                                                                                                                           |
| registered       | whether the study was registered                            | yes; no                                                                                                                                                                                                                                                                                                                                                                                   |
| preregistered    | whether the registration occured prior to data collection   | yes; no                                                                                                                                                                                                                                                                                                                                                                                   |
| statistics       | whether the statistical analysis plan was preregistered     | yes; no                                                                                                                                                                                                                                                                                                                                                                                   |
| outcome          | whether primary outcomes were preregistered                 | yes; no; mixed                                                                                                                                                                                                                                                                                                                                                                            |
| data\_available  | whether data were indicated as available                    | yes; no; request                                                                                                                                                                                                                                                                                                                                                                          |
| code             | whether statistical analysis code was made available        | yes; no                                                                                                                                                                                                                                                                                                                                                                                   |

Data were collected by Ms. Bridget A. Hannon, Dr. Tanya M. Halliday, and
Dr. Cynthia M. Kroeger and formatted by Dr. Cynthia M. Kroeger.

### Code

**File name for search and extraction code:**
manuscript\_materials\_2019\_code\_review\_search\_extraction.R

This file contains the code used to conduct the literature search and
extract Almetric and citation data from included studies

Author: Dr. Cynthia M. Kroeger

**File name for visual development code (review):**
manuscript\_materials\_2019\_code\_review\_visuals.R

This file contains the code used to generate the figures used in the
manuscript that pertain to the results of the review

Author: Dr. Cynthia M. Kroeger

**File name for visual development code (simulation):**
manuscript\_materials\_2019\_code\_review\_visuals.R

This file contains the code used to generate the figures used in the
manuscript that pertain to the results of the simulations

Author: Dr. Keisuke Ejima

**File name for simulation code (1):**
manuscript\_materials\_2019\_code\_simulation\_1

This file contains the code used to generate the simulation fixing the
maximum standard error, k as 2, fixing the number of group, g as 5,
varying the sample size (20:40, 30:30, 40:20)

Author: Dr. Keisuke Ejima

**File name for simulation code (2):**
manuscript\_materials\_2019\_code\_simulation\_2

This file contains the code used to generate the simulation varying the
maximum standard error, k from 1 to 9, fixing the number of group, g as
5, fixing the sample size (40:40)

Author: Dr. Keisuke Ejima

**File name for simulation code (3):**
manuscript\_materials\_2019\_code\_simulation\_error

This file contains the code used to compute type I error rates for each
significance level (=0.1, 0.05, 0.01)

Author: Dr. Keisuke Ejima

### Supplementary Table

**File name for table:** manuscript\_materials\_2019\_table

## A Note on How to Replicate this Study

Because data for the review were extracted from PubMed on a specific
date, one would need to download PubMed history and assess the
literature from the point in time noted in the data file, using the
methods described in this document. Another option might be to run the
search described herein and subtract dates from the date reported in our
data file. Visuals and simulation code are replicable as is. Figures 7
and 8 in our paper can be replicated by running the R codes in the
following order: 1. manuscript\_materials\_2019\_code\_simulation\_1, 2.
manuscript\_materials\_2019\_code\_simulation\_2, 3.
manuscript\_materials\_2019\_code\_simulation\_error, 4.
manuscript\_materials\_2019\_code\_review\_visuals.R.

## Author Contribution

Dr. Cynthia M. Kroeger lead the review portion of this study, originated
the idea of implementing Open Science R packages to semi-automate
methods, wrote the review code, created the open science documents for
the repository, and managed the integration and edits of the manuscript.
Dr. Keisuke Ejima lead the simulation portion of this study and wrote
the simulation code. Ms. Bridget A. Hannon and Dr. Tanya M Halliday
assisted with the design and conduct of the review and provided
editorial assistance with the review materials and manuscript. Mr. Bryan
McComb contributed to drafting and editing the manuscript. Dr. Margarita
Teran-Garcia contributed to the search strategy and methods for the
review and provided editorial assistance with the manuscript. Dr. John
A. Dawson checked the code for replicability, helped develop methods for
the simulation study and provided editorial assistance with the
manuscript. Dr. Andrew W. Brown drafted sections of the manuscript and
provided editoral assistance. Dr. David B. King helped develop the
simulation portion of the study, drafted the tutorial section of the
manuscript, and provided editorial assistance. Dr. David B. Allison
originated the study and is the senior author of the manuscript.

## License Information

These materials are licensed under the Creative Commons Attribution
Share Alike 4.0.

**File name for analysis code:** LICENSE.txt

## Citation Information

### Recommended citation for Manuscript Materials 2019

Please use the following to cite any of the supporting materials herein:

Kroeger CM and Ejima K. Data and analysis code for manuscript:
Persistent confusion in nutrition and obesity research about the
validity of classic nonparametric tests in the presence of
heteroscedasticity: Evidence of the problem and valid alternatives.
Zenodo. 2019. DOI: 10.5281/zenodo.3625431

## Funding Information

The manuscript and development of these materials was supported by the
National Institute of Diabetes, Digestive and Kidney Diseases of the
National Institutes of Health (F32DK107157). The content is solely the
responsibility of the authors and does not necessarily represent the
official views of the National Institutes of Health or any other
organization.
