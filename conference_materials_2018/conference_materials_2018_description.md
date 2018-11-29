Conference Materials 2018
================
Cynthia M Kroeger
11/29/2018

Project Description
-------------------

This project studied the prevalence and impact of the error of using classic nonparametric tests in the presence of heteroscedasticity within nutrition obesity research. Details of which were presented at the Obesity Week conference in November, 2018. This repository contains the data and code used to substantiate the presentation, as well as the presented poster. This was the start of a larger project, that has since been further developed. A manuscript with fully-developed methods is now being developed for publication. 

Conference Description
----------------------

This work was presented at The Obesity Society (TOS): Obesity Week Annual Scientific Meeting, in Nashville, Tennessee, USA, in 2018.

Contact Information for Principal Investigator and Corresponding Author
-----------------------------------------------------------------------

Cynthia M. Kroeger, PhD, Postdoctoral Fellow, Charles Perkins Centre, School of Pharmacy, Faculty of Medicine and Health, The University of Sydney. <cynthia.kroeger@sydney.edu.au>

Description of Supporting Materials
-----------------------------------

### Presentation

**File name for poster:** conference\_materials\_2018\_poster.csv

### Data

**File name for dataset:** conference\_materials\_2018\_data.csv

**Full names and definitions of column headings**

<table>
<colgroup>
<col width="24%" />
<col width="46%" />
<col width="28%" />
</colgroup>
<thead>
<tr class="header">
<th>Column Heading</th>
<th>Definition</th>
<th>Possible Values</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>authors</td>
<td>authors of included study</td>
<td></td>
</tr>
<tr class="even">
<td>doi</td>
<td>doi of included study</td>
<td></td>
</tr>
<tr class="odd">
<td>link</td>
<td>link to full text of included study</td>
<td></td>
</tr>
<tr class="even">
<td>type</td>
<td>type of study design</td>
<td>intervention; observational</td>
</tr>
<tr class="odd">
<td>model</td>
<td>type of model organism</td>
<td>rodents; humans</td>
</tr>
<tr class="even">
<td>test</td>
<td>type of nonparametric test used</td>
<td>kruskal = Kruskal-Wallis; whitney = Mann-Whitney U; signed = Signed rank; nonparametric = &quot;non-parametric test&quot;</td>
</tr>
<tr class="odd">
<td>methods</td>
<td>appropriateness of nonparametric test use</td>
<td>error = clear use of nonparametric test in presence of heteroscedasticity; nolink = no link between use of heteroscedasticity term and rationale for nonparametric test use; ambiguous = states assumptions were tested but does not clearly state heteroscedasticity was not present; correct = clearly stated heteroscedasticity was not present when a the nonparametric test was used</td>
</tr>
<tr class="even">
<td>significance</td>
<td>statistical significance of results from nonparametric test</td>
<td>significant = result was statistically significant; mixed = some statistically significant, some statistically insignificant; not = not statistically significant</td>
</tr>
<tr class="odd">
<td>reads</td>
<td>number of article Mendeley reads</td>
<td></td>
</tr>
<tr class="even">
<td>posts</td>
<td>number of article posts in the internet</td>
<td></td>
</tr>
<tr class="odd">
<td>score</td>
<td>Altmetric score</td>
<td></td>
</tr>
<tr class="even">
<td>public</td>
<td>number of posts made by the public</td>
<td></td>
</tr>
<tr class="odd">
<td>scientists</td>
<td>number of posts made by scientists</td>
<td></td>
</tr>
<tr class="even">
<td>communicators</td>
<td>number of posts made by science communicators</td>
<td></td>
</tr>
<tr class="odd">
<td>physicians</td>
<td>number of posts made by physicians</td>
<td></td>
</tr>
<tr class="even">
<td>citations</td>
<td>number of citations in peer-reviewed journals</td>
<td></td>
</tr>
<tr class="odd">
<td>date_published</td>
<td>date article was published</td>
<td></td>
</tr>
<tr class="even">
<td>date_extracted</td>
<td>date citation and altmetric data was extracted</td>
<td></td>
</tr>
<tr class="odd">
<td>date_difference</td>
<td>date_extracted - date_published</td>
<td></td>
</tr>
</tbody>
</table>

Data were collected by Bridget A. Hannon, Dr. Tanya M. Halliday, and Dr. Kroeger and formatted by Dr. Kroeger.

### Code

**File name for search and extraction code:** conference\_materials\_2018\_code\_search\_extraction.R

This file contains the code used to conduct the literature search and extract Almetric and citation data

**File name for visual development code:** conference\_materials\_2018\_code\_visuals.R

This file contains the code used to generate the figures used in the presentation

A Note on How to Replicate this Study
-------------------------------------

Because data were extracted from PubMed on a specific date, one would need to download PubMed history and assess the literature from the point in time noted in the data file, using the methods described in this document. Another option might be to run the search described herein and subtract dates from the date reported in our data file.

Author Contribution
-------------------

Dr. Kroeger conducted the study, originated the idea of implementing Open Science R packages to semi-automated methods, wrote the code, made the figures and poster, and created the open science documents for the repository. Bridget A. Hannon and Dr. Tanya M Halliday assisted with the design and conduct of the research and provided editorial assistance with the presentation materials. Dr. David B. Allison originated the study and is the senior author of the presentation.

License Information
-------------------

These materials are licensed under the Creative Commons Attribution Share Alike 4.0.

**File name for analysis code:** LICENSE.txt

Citation Information
--------------------

### Recommended citation for Conference Materials 2018

Please use the following to cite any of the supporting materials herein:

Kroeger CM. Data and analysis code for published abstract: Misuse of nonparametric tests with heteroscedasticity: A semi-automated review of obesity research. Zenodo. 2018. DOI: 10.5281/zenodo.1672206 

### Recommended citation for published 2018 abstract

Please use the following to cite the published abstract:

Kroeger CM, Hannon BA, Halliday TM, Teran-Garcia M, Allison DB. Misuse of nonparametric tests with heteroscedasticity: A semi-automated review of obesity research. The Obesity Society (TOS): Annual Scientific Meeting. Nashville, Tennessee, USA, 2018.

Funding Information
-------------------

The presentation and development of these materials was supported by the National Institute of Diabetes, Digestive and Kidney Diseases of the National Institutes of Health (F32DK107157). The content is solely the responsibility of the authors and does not necessarily represent the official views of the National Institutes of Health or any other organization.

[![DOI](https://zenodo.org/badge/156651162.svg)](https://zenodo.org/badge/latestdoi/156651162)
