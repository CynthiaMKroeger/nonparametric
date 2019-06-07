# ------------------------------------------------------------------------------ #
# Code for Nonparametric: Literature Search and Data Extraction for Manuscript
# By: Cynthia M. Kroeger (cynthia.kroeger@sydney.edu.au)
# ------------------------------------------------------------------------------ #
# Define search queary and create object for search string 
# ------------------------------------------------------------------------------ #
nutrition_query <- "(body measure[ABST] OR body measures[ABST] OR 
body fat distribution[ABST] OR fat distribution[ABST] OR adiposity[ABST] OR 
obesity[ABST] OR overweight[ABST] OR body mass index[ABST] OR bmi[ABST] 
OR quetelet index[ABST] OR body weight[ABST] OR waist circumference[ABST] 
OR waist-height ratio[ABST] OR waist height ratio[ABST] OR 
waist-hip ratio[ABST] OR waist hip ratio[ABST] OR body composition[ABST])"

date_query <- "(2017:2017 [PDAT])"

nonparametric_query <- "(nonparametric[ARTI] OR non-parametric[ARTI] OR 
non parametric[ARTI] OR kruskal-wallis[ARTI] OR rank-sum test[ARTI] OR 
rank sum test[ARTI] OR spearman rank correlation coefficient[ARTI] OR 
spearman correlation[ARTI] OR wilcox test[ARTI] OR 
kolmogorov-smirnov test[ARTI] OR kolmogorov smirnov test[ARTI] OR 
u-test[ARTI] OR mann whitney[ARTI] OR mann-whitney[ARTI] OR 
wilcoxon-mann-whitney[ARTI] OR wilcoxon[ARTI] OR wilcoxon-rank[ARTI] OR 
kruskal wallis[ARTI] OR sign test[ARTI] OR signed-rank[ARTI] OR 
friedman test[ARTI] OR mood’s median test[ARTI] OR bootstrapping[ARTI] OR 
permutation test[ARTI])"

heteroscedasticity_query <- "(heteroscedasticity[ARTI] OR 
heterogeneous variances[ARTI] OR unequal variances[ARTI] OR 
unequal variance[ARTI] OR heterogeneous variance[ARTI] OR 
homogeneity of variance[ARTI] OR homoscedasticity[ARTI] OR 
equality of variances[ARTI])"

full_search_term <- paste(nutrition_query, "AND", date_query, "AND", 
                          nonparametric_query, "AND", 
                          heteroscedasticity_query)


# ------------------------------------------------------------------------------ #
# Conduct search using rEntrez
# ------------------------------------------------------------------------------ #
# install.packages("rentrez")
library(rentrez)

search <- entrez_search(db = "pmc", term = full_search_term)
search


# ------------------------------------------------------------------------------ #
# Obtain date published from PMC 
# ------------------------------------------------------------------------------ #
library(rentrez)

meta_golshan <- entrez_search(db = "pmc", 
                              term = "10.22038/AJP.2016.7844[doi]")
meta_golshan
# Golshan not found via doi
# Look up searchable terms in PMC 
entrez_db_searchable(db = "pmc")
# Search with PMID instead
meta_golshan <- entrez_search(db = "pmc", 
                              term = "28348973[PMID]")
summs_golshan <- entrez_summary(db = "pmc", id = meta_golshan$ids)
date_golshan <- extract_from_esummary(summs_golshan, "pubdate")
date_golshan
# ------------------------------------------------------------------------------ #
meta_gucalp <- entrez_search(db = "pmc", 
                             term = "10.1038/pcan.2017.31[doi]")
summs_gucalp <- entrez_summary(db = "pmc", id = meta_gucalp$ids)
date_gucalp <- extract_from_esummary(summs_gucalp, "pubdate")
date_gucalp
# ------------------------------------------------------------------------------ #
meta_lacoste <- entrez_search(db = "pmc", 
                              term = "10.7717/peerj.3302[doi]")
summs_lacoste <- entrez_summary(db = "pmc", id = meta_lacoste$ids)
date_lacoste <- extract_from_esummary(summs_lacoste, "pubdate")
date_lacoste
# ------------------------------------------------------------------------------ #
meta_mohammad <- entrez_search(db = "pmc", 
                               term = "10.1038/nutd.2016.38[doi]")
summs_mohammad <- entrez_summary(db = "pmc", id = meta_mohammad$ids)
date_mohammad <- extract_from_esummary(summs_mohammad, "pubdate")
date_mohammad
# ------------------------------------------------------------------------------ #
meta_attah <- entrez_search(db = "pmc", 
                            term = "10.1371/journal.pone.0179441[doi]")
summs_attah <- entrez_summary(db = "pmc", id = meta_attah$ids)
date_attah <- extract_from_esummary(summs_attah, "pubdate")
date_attah
# ------------------------------------------------------------------------------ #
meta_quesada <- entrez_search(db = "pmc", 
                              term = "10.1371/journal.pone.0175462[doi]")
summs_quesada <- entrez_summary(db = "pmc", id = meta_quesada$ids)
date_quesada <- extract_from_esummary(summs_quesada, "pubdate")
date_quesada
# ------------------------------------------------------------------------------ #
meta_gadducci <- entrez_search(db = "pmc", 
                               term = "10.6061/clinics/2017(05)03[doi]")
meta_gadducci
# Returned no hits
# Search with PMID instead
meta_gadducci <- entrez_search(db = "pmc", 
                               term = "28591338[PMID]")
meta_gadducci
summs_gadducci <- entrez_summary(db = "pmc", id = meta_gadducci$ids)
date_gadducci <- extract_from_esummary(summs_gadducci, "pubdate")
date_gadducci
# ------------------------------------------------------------------------------ #
meta_alvarez_1 <- entrez_search(db = "pmc", 
                                term = "10.3389/fphys.2017.00444[doi]")
summs_alvarez_1 <- entrez_summary(db = "pmc", id = meta_alvarez_1$ids)
date_alvarez_1 <- extract_from_esummary(summs_alvarez_1, "pubdate")
date_alvarez_1
# ------------------------------------------------------------------------------ #
meta_alvarez_2 <- entrez_search(db = "pmc", 
                                term = "10.3389/fphys.2017.00479[doi]")
summs_alvarez_2 <- entrez_summary(db = "pmc", id = meta_alvarez_2$ids)
date_alvarez_2 <- extract_from_esummary(summs_alvarez_2, "pubdate")
date_alvarez_2
# ------------------------------------------------------------------------------ #
meta_bastos <- entrez_search(db = "pmc", 
                             term = "10.1210/js.2017-00130[doi]")
summs_bastos <- entrez_summary(db = "pmc", id = meta_bastos$ids)
date_bastos <- extract_from_esummary(summs_bastos, "pubdate")
date_bastos
# ------------------------------------------------------------------------------ #
meta_rossetti <- entrez_search(db = "pmc", 
                               term = "10.1038/s41398-017-0023-4[doi]")
summs_rossetti <- entrez_summary(db = "pmc", id = meta_rossetti$ids)
date_rossetti <- extract_from_esummary(summs_rossetti, "pubdate")
date_rossetti
# ------------------------------------------------------------------------------ #
meta_arriscado <- entrez_search(db = "pmc", 
                                term = "10.1007/s10389-017-0823-2[doi]")
summs_arriscado <- entrez_summary(db = "pmc", id = meta_arriscado$ids)
date_arriscado <- extract_from_esummary(summs_arriscado, "pubdate")
date_arriscado
# ------------------------------------------------------------------------------ #
meta_herzig <- entrez_search(db = "pmc", 
                             term = "10.3389/fphys.2017.00109[doi]")
summs_herzig <- entrez_summary(db = "pmc", id = meta_herzig$ids)
date_herzig <- extract_from_esummary(summs_herzig, "pubdate")
date_herzig
# ------------------------------------------------------------------------------ #
meta_schlecht <- entrez_search(db = "pmc", 
                               term = "10.1371/journal.pone.0175133[doi]")
summs_schlecht <- entrez_summary(db = "pmc", id = meta_schlecht$ids)
date_schlecht <- extract_from_esummary(summs_schlecht, "pubdate")
date_schlecht
# ------------------------------------------------------------------------------ #
meta_kocot_1 <- entrez_search(db = "pmc", 
                              term = "10.12659/MSM.904318[doi]")
summs_kocot_1 <- entrez_summary(db = "pmc", id = meta_kocot_1$ids)
date_kocot_1 <- extract_from_esummary(summs_kocot_1, "pubdate")
date_kocot_1
# ------------------------------------------------------------------------------ #
meta_kocot_2 <- entrez_search(db = "pmc", 
                              term = "10.3390/ijerph15010019[doi]")
summs_kocot_2 <- entrez_summary(db = "pmc", id = meta_kocot_2$ids)
date_kocot_2 <- extract_from_esummary(summs_kocot_2, "pubdate")
date_kocot_2
# ------------------------------------------------------------------------------ #
meta_hollis <- entrez_search(db = "pmc", 
                             term = "10.1038/ijo.2017.78[doi]")
summs_hollis <- entrez_summary(db = "pmc", id = meta_hollis$ids)
date_hollis <- extract_from_esummary(summs_hollis, "pubdate")
date_hollis
# ------------------------------------------------------------------------------ #
meta_lytle <- entrez_search(db = "pmc", 
                            term = "10.1371/journal.pone.0173376[doi]")
summs_lytle <- entrez_summary(db = "pmc", id = meta_lytle$ids)
date_lytle <- extract_from_esummary(summs_lytle, "pubdate")
date_lytle
# ------------------------------------------------------------------------------ #
meta_philbrick <- entrez_search(db = "pmc", 
                                term = "10.1530/JOE-16-0484[doi]")
summs_philbrick <- entrez_summary(db = "pmc", id = meta_philbrick$ids)
date_philbrick <- extract_from_esummary(summs_philbrick, "pubdate")
date_philbrick
# ------------------------------------------------------------------------------ #
meta_boyle <- entrez_search(db = "pmc", 
                            term = "10.1016/j.molmet.2017.08.012[doi]")
summs_boyle <- entrez_summary(db = "pmc", id = meta_boyle$ids)
date_boyle <- extract_from_esummary(summs_boyle, "pubdate")
date_boyle
# ------------------------------------------------------------------------------ #
meta_vanwagner <- entrez_search(db = "pmc", 
                                term = "10.1002/oby.21767[doi]")
summs_vanwagner <- entrez_summary(db = "pmc", id = meta_vanwagner$ids)
date_vanwagner <- extract_from_esummary(summs_vanwagner, "pubdate")
date_vanwagner
# ------------------------------------------------------------------------------ #
meta_clamp <- entrez_search(db = "pmc", 
                            term = "10.1038/nutd.2017.31[doi]")
summs_clamp <- entrez_summary(db = "pmc", id = meta_clamp$ids)
date_clamp <- extract_from_esummary(summs_clamp, "pubdate")
date_clamp
# ------------------------------------------------------------------------------ #
meta_moir <- entrez_search(db = "pmc", 
                           term = "10.1016/j.molmet.2017.08.006[doi]")
summs_moir <- entrez_summary(db = "pmc", id = meta_moir$ids)
date_moir <- extract_from_esummary(summs_moir, "pubdate")
date_moir
# ------------------------------------------------------------------------------ #
meta_mokros <- entrez_search(db = "pmc", 
                             term = "10.5664/jcsm.6664[doi]")
summs_mokros <- entrez_summary(db = "pmc", id = meta_mokros$ids)
date_mokros <- extract_from_esummary(summs_mokros, "pubdate")
date_mokros
# ------------------------------------------------------------------------------ #
meta_tu <- entrez_search(db = "pmc", 
                         term = "10.1038/s41598-017-05040-6[doi]")
summs_tu <- entrez_summary(db = "pmc", id = meta_tu$ids)
date_tu <- extract_from_esummary(summs_tu, "pubdate")
date_tu
# ------------------------------------------------------------------------------ #
meta_stefan <- entrez_search(db = "pmc", 
                             term = "10.3390/ijerph14080893[doi]")
summs_stefan <- entrez_summary(db = "pmc", id = meta_stefan$ids)
date_stefan <- extract_from_esummary(summs_stefan, "pubdate")
date_stefan
# ------------------------------------------------------------------------------ #
meta_bahls <- entrez_search(db = "pmc", 
                            term = "10.1371/journal.pone.0179534[doi]")
summs_bahls <- entrez_summary(db = "pmc", id = meta_bahls$ids)
date_bahls <- extract_from_esummary(summs_bahls, "pubdate")
date_bahls
# ------------------------------------------------------------------------------ #
meta_hennig <- centrez_search(db = "pmc", 
                              term = "10.1161/JAHA.117.005506[doi]")
# Returned no hits
# Search with PMID instead
meta_hennig <- centrez_search(db = "pmc", 
                              term = "28778941[PMID]")
# Returned no hits
# Look up searchable terms in PMC 
entrez_db_searchable(db = "pmc")
# No other unique identifiers, so added manually
# ------------------------------------------------------------------------------ #
meta_paquette <- entrez_search(db = "pmc", 
                               term = "10.1017/S0007114517000393[doi]")
summs_paquette <- entrez_summary(db = "pmc", id = meta_paquette$ids)
date_paquette <- extract_from_esummary(summs_paquette, "pubdate")
date_paquette
# ------------------------------------------------------------------------------ #
meta_pedersen <- entrez_search(db = "pmc", 
                               term = "10.1371/journal.pone.0186384[doi]")
summs_pedersen <- entrez_summary(db = "pmc", id = meta_pedersen$ids)
date_pedersen <- extract_from_esummary(summs_pedersen, "pubdate")
date_pedersen
# ------------------------------------------------------------------------------ #
meta_kitao <- entrez_search(db = "pmc", 
                            term = "10.1186/s12933-017-0607-6[doi]")
summs_kitao <- entrez_summary(db = "pmc", id = meta_kitao$ids)
date_kitao <- extract_from_esummary(summs_kitao, "pubdate")
date_kitao
# ------------------------------------------------------------------------------ #
meta_wischmeyer <- entrez_search(db = "pmc", 
                                 term = "10.1186/s13054-017-1736-8[doi]")
summs_wischmeyer <- entrez_summary(db = "pmc", id = meta_wischmeyer$ids)
date_wischmeyer <- extract_from_esummary(summs_wischmeyer, "pubdate")
date_wischmeyer
# ------------------------------------------------------------------------------ #
meta_bluemel <- entrez_search(db = "pmc", 
                              term = "10.1186/s12876-016-0560-y[doi]")
summs_bluemel <- entrez_summary(db = "pmc", id = meta_bluemel$ids)
date_bluemel <- extract_from_esummary(summs_bluemel, "pubdate")
date_bluemel
# ------------------------------------------------------------------------------ #
meta_pischke <- entrez_search(db = "pmc", 
                              term = "10.4254/wjh.v9.i8.427[doi]")
summs_pischke <- entrez_summary(db = "pmc", id = meta_pischke$ids)
date_pischke <- extract_from_esummary(summs_pischke, "pubdate")
date_pischke
# ------------------------------------------------------------------------------ #
meta_julian <- entrez_search(db = "pmc", 
                             term = "10.14740/jocmr3142w[doi]")
summs_julian <- entrez_summary(db = "pmc", id = meta_julian$ids)
date_julian <- extract_from_esummary(summs_julian, "pubdate")
date_julian
# ------------------------------------------------------------------------------ #
meta_chung <- entrez_search(db = "pmc", 
                            term = "10.5487/TR.2017.33.2.165[doi]")
summs_chung <- entrez_summary(db = "pmc", id = meta_chung$ids)
date_chung <- extract_from_esummary(summs_chung, "pubdate")
date_chung
# ------------------------------------------------------------------------------ #
meta_paalvast <- entrez_search(db = "pmc", 
                               term = "10.14814/phy2.13376[doi]")
summs_paalvast <- entrez_summary(db = "pmc", id = meta_paalvast$ids)
date_paalvast <- extract_from_esummary(summs_paalvast, "pubdate")
date_paalvast
# ------------------------------------------------------------------------------ #
meta_yang <- entrez_search(db = "pmc", 
                           term = "10.1186/s12877-017-0686-y[doi]")
summs_yang <- entrez_summary(db = "pmc", id = meta_yang$ids)
date_yang <- extract_from_esummary(summs_yang, "pubdate")
date_yang


# ------------------------------------------------------------------------------ #
# Obtain Citation Count via Crossref
# ------------------------------------------------------------------------------ #
# install.packages("rcrossref")
library(rcrossref)

# Share email with crossref
file.edit("~/.Renviron")
# Add email to file crossref_email = cynthiamkroeger@gmail.com
# Save and restart R

# Ran for manuscript on February 26, 2019 
citation_golshan <- cr_citation_count(doi = "10.22038/AJP.2016.7844")
citation_golshan
# Golshan returned NA, so citation count 6 was obtained from Google Scholar
citation_gucalp <- cr_citation_count(doi = "10.1038/pcan.2017.31")
citation_gucalp
citation_lacoste <- cr_citation_count(doi = "10.7717/peerj.3302")
citation_lacoste
citation_mohammad <- cr_citation_count(doi = "10.1038/nutd.2016.38")
citation_mohammad
citation_attah <- cr_citation_count(doi = "10.1371/journal.pone.0179441")
citation_attah 
citation_quesada <- cr_citation_count(doi = "10.1371/journal.pone.0175462")
citation_quesada
citation_gadducci <- cr_citation_count(doi = "10.6061/clinics/2017(05)03")
citation_gadducci 
citation_alvarez_1 <- cr_citation_count(doi = "10.3389/fphys.2017.00444")
citation_alvarez_1
citation_alvarez_2 <- cr_citation_count(doi = "10.3389/fphys.2017.00479")
citation_alvarez_2
citation_bastos <- cr_citation_count(doi = "10.1210/js.2017-00130")
citation_bastos
citation_rossetti <- cr_citation_count(doi = "10.1038/s41398-017-0023-4")
citation_rossetti
citation_arriscado <- cr_citation_count(doi = "10.1007/s10389-017-0823-2")
citation_arriscado
citation_herzig <- cr_citation_count(doi = "10.3389/fphys.2017.00109")
citation_herzig
citation_schlecht <- cr_citation_count(doi = "10.1371/journal.pone.0175133")
citation_schlecht
citation_kocot_1 <- cr_citation_count(doi = "10.12659/MSM.904318")
citation_kocot_1
citation_kocot_2 <- cr_citation_count(doi = "10.3390/ijerph15010019")
citation_kocot_2
citation_hollis <- cr_citation_count(doi = "10.1038/ijo.2017.78")
citation_hollis
citation_lytle <- cr_citation_count(doi = "10.1371/journal.pone.0173376")
citation_lytle
citation_philbrick <- cr_citation_count(doi = "10.1530/JOE-16-0484")
citation_philbrick
citation_boyle <- cr_citation_count(doi = "10.1016/j.molmet.2017.08.012")
citation_boyle
citation_vanwagner <- cr_citation_count(doi = "10.1002/oby.21767")
citation_vanwagner
citation_clamp <- cr_citation_count(doi = "10.1038/nutd.2017.31")
citation_clamp
citation_moir <- cr_citation_count(doi = "10.1016/j.molmet.2017.08.006")
citation_moir
citation_mokros <- cr_citation_count(doi = "10.5664/jcsm.6664")
citation_mokros
citation_tu <- cr_citation_count(doi = "10.1038/s41598-017-05040-6")
citation_tu
citation_stefan <- cr_citation_count(doi = "10.3390/ijerph14080893")
citation_stefan
citation_bahls <- cr_citation_count(doi = "10.1371/journal.pone.0179534")
citation_bahls
citation_hennig <- cr_citation_count(doi = "10.1161/JAHA.117.005506")
citation_hennig
citation_paquette <- cr_citation_count(doi = "10.1017/S0007114517000393")
citation_paquette
citation_pedersen <- cr_citation_count(doi = "10.1371/journal.pone.0186384")
citation_pedersen
citation_kitao <- cr_citation_count(doi = "10.1186/s12933-017-0607-6")
citation_kitao
citation_wischmeyer <- cr_citation_count(doi = "10.1186/s13054-017-1736-8")
citation_wischmeyer
citation_bluemel <- cr_citation_count(doi = "10.1186/s12876-016-0560-y")
citation_bluemel
citation_pischke <- cr_citation_count(doi = "10.4254/wjh.v9.i8.427")
citation_pischke
citation_julian <- cr_citation_count(doi = "10.14740/jocmr3142w")
citation_julian
citation_chung <- cr_citation_count(doi = "10.5487/TR.2017.33.2.165")
citation_chung
citation_paalvast <- cr_citation_count(doi = "10.14814/phy2.13376")
citation_paalvast
citation_yang <- cr_citation_count(doi = "10.1186/s12877-017-0686-y")
citation_yang


# ------------------------------------------------------------------------------ #
# Obtain Altmetrics  
# ------------------------------------------------------------------------------ #
# install.packages("rAltmetric")
library("rAltmetric")

# Test each DOI for errors 
alt_golshan <- altmetrics(doi = "10.22038/AJP.2016.7844") # no metrics found 
alt_bastos <- altmetrics(doi = "10.1210/js.2017-00130") # no metrics found 
alt_kocot_1 <- altmetrics(doi = "10.12659/MSM.904318") # no metrics found 
alt_mokros <- altmetrics(doi = "10.5664/jcsm.6664") # no metrics found 
alt_tu <- altmetrics(doi = "10.1038/s41598-017-05040-6") # no metrics found 
alt_stefan <- altmetrics(doi = "10.3390/ijerph14080893") # no metrics found 
alt_pedersen <- altmetrics(doi = "10.1371/journal.pone.0186384") # no metrics 
alt_pischke <- altmetrics(doi = "10.4254/wjh.v9.i8.427") # no metrics found 
alt_chung <- altmetrics(doi = "10.5487/TR.2017.33.2.165") # no metrics found 
alt_yang <- altmetrics(doi = "10.1186/s12877-017-0686-y") # no metrics found 

# DOIs without errors 
alt_gucalp <- altmetrics(doi = "10.1038/pcan.2017.31")
alt_lacoste <- altmetrics(doi = "10.7717/peerj.3302")
alt_mohammad <- altmetrics(doi = "10.1038/nutd.2016.38")
alt_attah <- altmetrics(doi = "10.1371/journal.pone.0179441")
alt_quesada <- altmetrics(doi = "10.1371/journal.pone.0175462")
alt_gadducci <- altmetrics(doi = "10.6061/clinics/2017(05)03")
alt_alvarez_1 <- altmetrics(doi = "10.3389/fphys.2017.00444")
alt_alvarez_2 <- altmetrics(doi = "10.3389/fphys.2017.00479")
alt_rossetti <- altmetrics(doi = "10.1038/s41398-017-0023-4")
alt_arriscado <- altmetrics(doi = "10.1007/s10389-017-0823-2")
alt_herzig <- altmetrics(doi = "10.3389/fphys.2017.00109")
alt_schlecht <- altmetrics(doi = "10.1371/journal.pone.0175133")
alt_kocot_2 <- altmetrics(doi = "10.3390/ijerph15010019")
alt_hollis <- altmetrics(doi = "10.1038/ijo.2017.78")
alt_lytle <- altmetrics(doi = "10.1371/journal.pone.0173376")
alt_philbrick <- altmetrics(doi = "10.1530/JOE-16-0484")
alt_boyle <- altmetrics(doi = "10.1016/j.molmet.2017.08.012")
alt_vanwagner <- altmetrics(doi = "10.1002/oby.21767")
alt_clamp <- altmetrics(doi = "10.1038/nutd.2017.31")
alt_moir <- altmetrics(doi = "10.1016/j.molmet.2017.08.006")
alt_bahls <- altmetrics(doi = "10.1371/journal.pone.0179534")
alt_hennig <- altmetrics(doi = "10.1161/JAHA.117.005506")
alt_paquette <- altmetrics(doi = "10.1017/S0007114517000393")
alt_kitao <- altmetrics(doi = "10.1186/s12933-017-0607-6")
alt_wischmeyer <- altmetrics(doi = "10.1186/s13054-017-1736-8")
alt_bluemel <- altmetrics(doi = "10.1186/s12876-016-0560-y")
alt_julian <- altmetrics(doi = "10.14740/jocmr3142w")
alt_paalvast <- altmetrics(doi = "10.14814/phy2.13376")

# Extract from many DOIs for working DOIs
library("magrittr")
library("purrr")

alt_ids <- list(c(
        alt_gucalp$doi, 
        alt_lacoste$doi,
        alt_mohammad$doi,
        alt_attah$doi,
        alt_quesada$doi,
        alt_gadducci$doi,
        alt_alvarez_1$doi,
        alt_alvarez_2$doi,
        alt_rossetti$doi,
        alt_arriscado$doi,
        alt_herzig$doi,
        alt_schlecht$doi,
        alt_kocot_2$doi,
        alt_hollis$doi,
        alt_lytle$doi,
        alt_philbrick$doi,
        alt_boyle$doi,
        alt_vanwagner$doi,
        alt_clamp$doi,
        alt_moir$doi,
        alt_bahls$doi,
        alt_hennig$doi,
        alt_paquette$doi,
        alt_kitao$doi,
        alt_wischmeyer$doi,
        alt_bluemel$doi,
        alt_julian$doi,
        alt_paalvast$doi
))
alt_ids

alm <- function(x) altmetrics(doi = x) %>% altmetric_data()
results <- pmap_df(alt_ids, alm)

write.csv(results, "altmetric_heteroscedasticity.csv")

