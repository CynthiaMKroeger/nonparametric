Manuscript Materials 2019
================
Cynthia M Kroeger and Keisuke Ejima
6/7/2019

Project Description
-------------------

This project studied the prevalence and impact of the error of using classic nonparametric tests in the presence of heteroscedasticity within nutrition obesity research. Details of which have been submitted for peer-reviewed publication. This repository contains the data and code used to substantiate the manuscript. The full manuscript, which includes methodological details, will be added to this repository following the journal's embargo lift. A developing version of this project was presented previously at The Obesity Society (TOS) Obesity Week Annual Scientific Meeting in 2018 (DOI: 10.5281/zenodo.14800042).

Contact Information for Repository Authors
------------------------------------------

Cynthia M. Kroeger, PhD, Postdoctoral Fellow, Charles Perkins Centre, School of Pharmacy, Faculty of Medicine and Health, The University of Sydney. <cynthia.kroeger@sydney.edu.au> (Principal Investigator and Corresponding Author)

Keisuke Ejima, PhD, Postdoctoral Fellow, Department of Epidemiology and Biostatistics, Indiana University School of Public Health-Bloomington. <kejima@iu.edu>

Description of Supporting Materials
-----------------------------------

### Data

**File name for dataset:** manuscript\_materials\_2019\_data\_review.csv

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
<tr class="even">
<td>registered</td>
<td>whether the study was registered</td>
<td>yes; no</td>
</tr>
<tr class="odd">
<td>preregistered</td>
<td>whether the registration occured prior to data collection</td>
<td>yes; no</td>
</tr>
<tr class="even">
<td>statistics</td>
<td>whether the statistical analysis plan was preregistered</td>
<td>yes; no</td>
</tr>
<tr class="odd">
<td>outcome</td>
<td>whether primary outcomes were preregistered</td>
<td>yes; no; mixed</td>
</tr>
<tr class="even">
<td>data_available</td>
<td>whether data were indicated as available</td>
<td>yes; no; request</td>
</tr>
<tr class="odd">
<td>code</td>
<td>whether statistical analysis code was made available</td>
<td>yes; no</td>
</tr>
</tbody>
</table>

Data were collected by Ms. Bridget A. Hannon, Dr. Tanya M. Halliday, and Dr. Cynthia M. Kroeger and formatted by Dr. Cynthia M. Kroeger.

### Code

**File name for search and extraction code:** manuscript\_materials\_2019\_code\_review\_search\_extraction.R

This file contains the code used to conduct the literature search and extract Almetric and citation data from included studies

Author: Dr. Cynthia M. Kroeger

**File name for visual development code (review):** manuscript\_materials\_2019\_code\_review\_visuals.R

This file contains the code used to generate the figures used in the manuscript that pertain to the results of the review

Author: Dr. Cynthia M. Kroeger

**File name for visual development code (simulation):** manuscript\_materials\_2019\_code\_review\_visuals.R

This file contains the code used to generate the figures used in the manuscript that pertain to the results of the simulations

Author: Dr. Keisuke Ejima

**File name for simulation code (1):** manuscript\_materials\_2019\_code\_simulation\_1

This file contains the code used to generate the simulation fixing the maximum standard error, k as 2, fixing the number of group, g as 5, varying the sample size (20:40, 30:30, 40:20)

Author: Dr. Keisuke Ejima

**File name for simulation code (2):** manuscript\_materials\_2019\_code\_simulation\_2

This file contains the code used to generate the simulation varying the maximum standard error, k from 1 to 9, fixing the number of group, g as 5, fixing the sample size (40:40)

Author: Dr. Keisuke Ejima

**File name for simulation code (3):** manuscript\_materials\_2019\_code\_simulation\_error

This file contains the code used to compute type I error rates for each significance level (=0.1, 0.05, 0.01)

Author: Dr. Keisuke Ejima

A Note on How to Replicate this Study
-------------------------------------

Because data for the review were extracted from PubMed on a specific date, one would need to download PubMed history and assess the literature from the point in time noted in the data file, using the methods described in this document. Another option might be to run the search described herein and subtract dates from the date reported in our data file. Visuals and simulation code are replicable as is.

Author Contribution
-------------------

Dr. Cynthia M. Kroeger lead the review portion of this study, originated the idea of implementing Open Science R packages to semi-automate methods, wrote the review code, created the open science documents for the repository, and managed the integration and edits of the manuscript. Dr. Keisuke Ejima lead the simulation portion of this study and wrote the simulation code. Ms. Bridget A. Hannon and Dr. Tanya M Halliday assisted with the design and conduct of the review and provided editorial assistance with the review materials and manuscript. Mr. Bryan McComb contributed to drafting and editing the manuscript. Dr. Margarita Teran-Garcia contributed to the search strategy and methods for the review and provided editorial assistance with the manuscript. Dr. John A. Dawson checked the code for replicability, helped develop methods for the simulation study and provided editorial assistance with the manuscript. Dr. Andrew W. Brown drafted sections of the manuscript and provided editoral assistance. Dr. David B. King helped develop the simulation portion of the study, drafted the tutorial section of the manuscript, and provided editorial assistance. Dr. David B. Allison originated the study and is the senior author of the manuscript.

License Information
-------------------

These materials are licensed under the Creative Commons Attribution Share Alike 4.0.

**File name for analysis code:** LICENSE.txt

Citation Information
--------------------

### Recommended citation for Manuscript Materials 2019

Please use the following to cite any of the supporting materials herein:

Kroeger CM and Ejima K. Data and analysis code for manuscript: Persistent confusion in nutrition and obesity research about the validity of classic nonparametric tests in the presence of heteroscedasticity: Evidence of the problem and valid alternatives. Zenodo. 2019. DOI: 10.5281/zenodo.3240923

Funding Information
-------------------

The manuscript and development of these materials was supported by the National Institute of Diabetes, Digestive and Kidney Diseases of the National Institutes of Health (F32DK107157). The content is solely the responsibility of the authors and does not necessarily represent the official views of the National Institutes of Health or any other organization.
