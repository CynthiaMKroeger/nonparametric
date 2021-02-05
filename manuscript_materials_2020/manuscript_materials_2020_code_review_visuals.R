# ------------------------------------------------------------------------------ #
# Code for Nonparametric: Visuals for Manuscript 
# By: Cynthia M. Kroeger (cynthia.kroeger@sydney.edu.au)
# ------------------------------------------------------------------------------ #
# Import data 
# ------------------------------------------------------------------------------ #
library(readr)
nonparametric_data <- read_csv("manuscript_materials_2020_data_review.csv", 
                        col_types = cols(citations = col_number(), 
                            communicators = col_number(), 
                            date_difference = col_number(), 
                            date_published = col_character(), 
                            methods = col_factor(levels = c("correct",
                                                            "ambiguous",
                                                            "nolink",
                                                            "error")), 
                            model = col_factor(levels = c("humans",
                                                          "rodents")), 
                            doctors = col_number(), 
                            posts = col_number(), 
                            public = col_number(), 
                            reads = col_number(), 
                            scientists = col_number(), 
                            score = col_number(), 
                            significance = col_factor(levels = c("not",
                                                                 "mixed",
                                                                 "significant")), 
                            test = col_factor(levels = c("nonparametric",
                                                         "signed",
                                                         "whitney", 
                                                         "kruskal")), 
                            type = col_factor(levels = c("intervention", 
                                                         "observational")), 
                            registered = col_factor(levels = c("no", 
                                                             "yes")), 
                            preregistered = col_factor(levels = c("no", 
                                                                  "yes")), 
                            statistics = col_factor(levels = c("no", 
                                                               "yes")), 
                            outcome = col_factor(levels = c("mixed", 
                                                            "no", 
                                                            "yes")), 
                            data_available = col_factor(levels = c("request", 
                                                                   "no", 
                                                                   "yes")), 
                            code = col_factor(levels = c("no",
                                                         "yes")))) 


# Change variable names for display 
nonparametric_data <- as.data.frame(nonparametric_data)
nonparametric_data$methods <- factor(nonparametric_data$methods, 
                                     levels = c("correct",
                                                "ambiguous",
                                                "nolink",
                                                "error"), 
                                     labels = c("Correct",
                                                "Ambiguous",
                                                "No Link", 
                                                "Error"))
nonparametric_data$test <- factor(nonparametric_data$test, 
                                  levels = c("nonparametric",
                                             "signed", 
                                             "whitney", 
                                             "kruskal"), 
                                  labels = c("Nonparametric Tests*",
                                             "Wilcoxon Signed-Rank",
                                             "Mann-Whitney U", 
                                             "Kruskal-Wallis"))
nonparametric_data$significance <- factor(nonparametric_data$significance, 
                                          levels = c("not", 
                                                     "mixed",
                                                     "significant"), 
                                          labels = c("Not Significant",
                                                     "Mixed Significance", 
                                                     "Significant"))
nonparametric_data$type <- factor(nonparametric_data$type, 
                                  levels = c("intervention", 
                                             "observational"), 
                                  labels = c("Interventional", 
                                             "Observational"))
nonparametric_data$model <- factor(nonparametric_data$model, 
                                   levels = c("humans", 
                                              "rodents"), 
                                   labels = c("Humans", 
                                              "Rodents"))
nonparametric_data$registered <- factor(nonparametric_data$registered, 
                                        levels = c("no", 
                                                   "yes"), 
                                        labels = c("No", 
                                                   "Yes"))
nonparametric_data$preregistered <- factor(nonparametric_data$preregistered, 
                                           levels = c("no", 
                                                      "yes"), 
                                           labels = c("No", 
                                                      "Yes"))
nonparametric_data$statistics <- factor(nonparametric_data$statistics, 
                                        levels = c("no", 
                                                   "yes"), 
                                        labels = c("No", 
                                                   "Yes"))
nonparametric_data$outcome <- factor(nonparametric_data$outcome, 
                                     levels = c("mixed", 
                                                "no", 
                                                "yes"),
                                     labels = c("Mixed", 
                                                "No", 
                                                "Yes"))
nonparametric_data$data_available <- factor(nonparametric_data$data_available, 
                                            levels = c("request", 
                                                       "no", 
                                                       "yes"), 
                                            labels = c("Request", 
                                                       "No", 
                                                       "Yes"))
nonparametric_data$code <- factor(nonparametric_data$code, 
                                  levels = c("no", 
                                             "yes"), 
                                  labels = c("No", 
                                             "Yes"))


# ------------------------------------------------------------------------------ #
# Visualize main outcome
# ------------------------------------------------------------------------------ #
# Create pie chart for Methods (Appropriateness of NPTc Use)

# Create frequency table for methods variable 
# install.packages("plyr")
library(plyr)
methods_count <- count(nonparametric_data, 'methods')

# Create colors for pie chart 
# install.packages("plotly")
library(plotly)
colors <- c('rgb(0, 0, 0)', # correct, gray37 
            'rgb(56, 56, 56)', # ambiguous, gray22
            'rgb(94, 94, 94)', # nolink, gray0
            'rgb(127, 127, 127)') # error, gray50 

# Create pie chart 
plot_ly(methods_count, 
        labels = ~methods, 
        values = ~freq, 
        type = 'pie', 
        textposition = 'inside', 
        textinfo = 'label+percent+value', 
        insidetextfont = list(color = '#FFFFFF'), 
        marker = list(colors = colors, 
                      line = list(color = '#FFFFFF', 
                                  width = 1)), 
        showlegend = FALSE) %>%
        layout(xaxis = list(showgrid = FALSE, 
                            zeroline = FALSE, 
                            showticklabels = FALSE), 
               yaxis = list(showgrid = FALSE, 
                            zeroline = FALSE, 
                            showticklabels = FALSE))


# ------------------------------------------------------------------------------ #
# Visualize categorical outcomes  
# ------------------------------------------------------------------------------ #
# Create 4-panel 100% stacked barplots for Test, Significance, Type, & Model 
# Start with individual plots 

library(ggplot2)

test_table <- with(nonparametric_data, table(methods, test))
sign_table <- with(nonparametric_data, table(methods, significance))
type_table <- with(nonparametric_data, table(methods, type))
model_table <- with(nonparametric_data, table(methods, model))

png("characteristics.png", res = 300, width = 14, height = 7, units = 'in')
combined_table <- cbind(model_table, type_table, sign_table, test_table)
par(mgp = c(1.5, 0.5, 0), mai = c(0.8, 4.5, 0.6, 0.8), ps = 14)
barplot(combined_table, 
        col = c("gray0", "gray25", "gray50", "gray75"), 
        legend = rownames(combined_table), 
        args.legend = list(x = 25.3, 
                           y = 14.6, 
                           cex = 1, 
                           bty = "n", 
                           horiz = TRUE), 
        names.arg = NULL, 
        horiz = TRUE, 
        las = 1, 
        xlim = c(0, 30), 
        xlab = "Number of Articles", 
        axes = FALSE)
axis(1, 
     pos = 0.1, 
     at = seq(0, 30, by = 5), 
     labels = seq(0, 30, by = 5))
axis(2, 
     pos = -8.5, 
     at = c(1.4, 3.7, 6.7, 11), 
     labels = c("Model       
                Type        ",
                "Study       
                Type        ", 
                "Observed    
                Statistical    
                Significance  ", 
                "Nonparametric
                Test Used    "), 
     adj = 0, 
     tick = TRUE, 
     lwd = 0, 
     lty = 1, 
     las = 2)
abline(h = c(2.5, 4.9, 8.5, 13.3), lty = 1)
dev.off()


# ------------------------------------------------------------------------------ #
# Visualize categorical outcomes -- registration and data availability 
# ------------------------------------------------------------------------------ #
library(ggplot2)

registered_table <- with(nonparametric_data, table(methods, registered))
preregistered_table <- with(nonparametric_data, table(methods, preregistered))
statistics_table <- with(nonparametric_data, table(methods, statistics))
outcome_table <- with(nonparametric_data, table(methods, outcome))
data_available_table <- with(nonparametric_data, table(methods, data_available))
code_table <- with(nonparametric_data, table(methods, code))

png("registration.png", res = 300, width = 14, height = 7, units = 'in')
combined_table <- cbind(code_table, 
                        data_available_table,
                        outcome_table,
                        statistics_table,
                        preregistered_table,
                        registered_table)
par(mgp = c(1.5, 0.5, 0), mai = c(0.8, 4.5, 0.6, 0.8), ps = 14)
barplot(combined_table, 
        col = c("gray0", "gray25", "gray50", "gray75"), 
        legend = rownames(combined_table), 
        args.legend = list(x = 35.3, 
                           y = 18.4, 
                           cex = 1, 
                           bty = "n", 
                           horiz = TRUE), 
        names.arg = NULL, 
        horiz = TRUE, 
        las = 1, 
        xlim = c(0, 40), 
        xlab = "Number of Articles", 
        axes = FALSE)
axis(1, 
     pos = 0.1, 
     at = seq(0, 40, by = 5), 
     labels = seq(0, 40, by = 5))
axis(2, 
     pos = -4.7, 
     at = c(1.4, 4.3, 7.9, 11, 13.4, 15.6), 
     labels = c("Analysis Code Available",
                "Raw Data Available", 
                "Primary Outcome(s) Preregistered", 
                "Statistical Plan Preregistered", 
                "Study Preregistered", 
                "Study Registered"), 
     adj = 0, 
     tick = TRUE, 
     lwd = 0, 
     lty = 1, 
     las = 2)
abline(h = c(2.5, 6.1, 9.7, 12.1, 14.5, 16.9), lty = 1)
dev.off()


# ------------------------------------------------------------------------------ #
# Visualize continuous outcomes  
# ------------------------------------------------------------------------------ #
# Create 2-panel balloon plot 
library(ggplot2)
# install.packages("ggpubr")
library(ggpubr)
theme_set(theme_pubr())

# Subset by Methods variable 
error <- "Error"
error_data <- nonparametric_data[nonparametric_data$methods %in% error, ]
correct <- "Correct"
correct_data <- nonparametric_data[nonparametric_data$methods %in% correct, ]
ambiguous <- "Ambiguous"
ambiguous_data <- nonparametric_data[nonparametric_data$methods %in% ambiguous, ]
nolink <- "No Link"
nolink_data <- nonparametric_data[nonparametric_data$methods %in% nolink, ]

# Create Dissemination matrix (Citations, Reads, Posts, Altmetric Score)
dissemination_matrix <- matrix(c(sum(error_data$citations, na.rm = TRUE), 
                                 sum(nolink_data$citations, na.rm = TRUE), 
                                 sum(ambiguous_data$citations, na.rm = TRUE), 
                                 sum(correct_data$citations, na.rm = TRUE),
                                 sum(error_data$reads, na.rm = TRUE), 
                                 sum(nolink_data$reads, na.rm = TRUE), 
                                 sum(ambiguous_data$reads, na.rm = TRUE), 
                                 sum(correct_data$reads, na.rm = TRUE),
                                 sum(error_data$posts, na.rm = TRUE), 
                                 sum(nolink_data$posts, na.rm = TRUE), 
                                 sum(ambiguous_data$posts, na.rm = TRUE), 
                                 sum(correct_data$posts, na.rm = TRUE),
                                 sum(error_data$score, na.rm = TRUE), 
                                 sum(nolink_data$score, na.rm = TRUE), 
                                 sum(ambiguous_data$score, na.rm = TRUE), 
                                 sum(correct_data$score, na.rm = TRUE)), 
                               byrow = TRUE, 4, 4)
rownames(dissemination_matrix) <- c("Journal Citations", 
                              "Mendeley Reads", 
                              "Internet Posts", 
                              "Altmetric Attention Score")
colnames(dissemination_matrix) <- c("Error", 
                              "No Link", 
                              "Ambiguous", 
                              "Correct")

# Create Cohorts matrix
cohorts_matrix <- matrix(c(sum(error_data$public, na.rm = TRUE), 
                           sum(nolink_data$public, na.rm = TRUE), 
                           sum(ambiguous_data$public, na.rm = TRUE), 
                           sum(correct_data$public, na.rm = TRUE),
                           sum(error_data$communicators, na.rm = TRUE), 
                           sum(nolink_data$communicators, na.rm = TRUE), 
                           sum(ambiguous_data$communicators, na.rm = TRUE), 
                           sum(correct_data$communicators, na.rm = TRUE),
                           sum(error_data$doctors, na.rm = TRUE), 
                           sum(nolink_data$doctors, na.rm = TRUE), 
                           sum(ambiguous_data$doctors, na.rm = TRUE), 
                           sum(correct_data$doctors, na.rm = TRUE),
                           sum(error_data$scientists, na.rm = TRUE), 
                           sum(nolink_data$scientists, na.rm = TRUE), 
                           sum(ambiguous_data$scientists, na.rm = TRUE), 
                           sum(correct_data$scientists, na.rm = TRUE)), 
                         byrow = TRUE, 4, 4)
rownames(cohorts_matrix) <- c("General Public", 
                              "Science Communicators", 
                              "Doctors", 
                              "Research Scientists")
colnames(cohorts_matrix) <- c("Error", 
                              "No Link", 
                              "Ambiguous", 
                              "Correct")

# Create png for multi-panel balloon plot
library(ggplot2)
library(ggpubr)
theme_set(theme_pubr())
library(gridExtra)
png(filename = "dissemination_cohorts.png", 
    res = 300, 
    width = 14, 
    height = 7, 
    units = 'in')
dissemination_plot <- ggballoonplot(dissemination_matrix,
                                    main = "A.", 
                                    fill = "black")
cohorts_plot <- ggballoonplot(cohorts_matrix, 
                              main = "B.", 
                              fill = "black")
grid.arrange(dissemination_plot, cohorts_plot, ncol = 2)
dev.off()


# ------------------------------------------------------------------------------ #
# Obtain counts by group from dissemination data   
# ------------------------------------------------------------------------------ #
# Obtain counts by group for each dissemination outcome 


# citations 
tapply(nonparametric_data$citations, 
       nonparametric_data$methods, 
       FUN = sum, 
       na.rm = TRUE)


# posts
tapply(nonparametric_data$posts, 
       nonparametric_data$methods, 
       FUN = sum, 
       na.rm = TRUE)


# reads 
tapply(nonparametric_data$reads, 
       nonparametric_data$methods, 
       FUN = sum, 
       na.rm = TRUE)


# score
tapply(nonparametric_data$reads, 
       nonparametric_data$methods, 
       FUN = sum, 
       na.rm = TRUE)


# public
tapply(nonparametric_data$public, 
       nonparametric_data$methods, 
       FUN = sum, 
       na.rm = TRUE)


# scientists 
tapply(nonparametric_data$scientists, 
       nonparametric_data$methods, 
       FUN = sum, 
       na.rm = TRUE)


# communicators 
tapply(nonparametric_data$communicators, 
       nonparametric_data$methods, 
       FUN = sum, 
       na.rm = TRUE)


# doctors 
tapply(nonparametric_data$doctors, 
       nonparametric_data$methods, 
       FUN = sum, 
       na.rm = TRUE)


# ------------------------------------------------------------------------------ #
# Obtain counts for results section of the manuscript 
# ------------------------------------------------------------------------------ #


# Total citations 
sum(nonparametric_data$citations)


# Average number of days since publication 
mean(nonparametric_data$date_difference)


# Counts of study type  
table(nonparametric_data$type)


# Counts of model type  
table(nonparametric_data$model)


# Counts of methods 
table(nonparametric_data$methods)


# Total reads
sum(nonparametric_data$reads, na.rm = TRUE)


# Total posts
sum(nonparametric_data$posts, na.rm = TRUE)


# Total Altmetric score 
sum(nonparametric_data$score, na.rm = TRUE)
