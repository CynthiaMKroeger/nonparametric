# ------------------------------------------------------------------------------ #
# Code for Nonparametric: Visuals for TOS 2018 Poster
# By: Cynthia M. Kroeger (cynthia.kroeger@sydney.edu.au)
# ------------------------------------------------------------------------------ #
# Import data 
# ------------------------------------------------------------------------------ #
library(readr)
nonparametric_data <- read_csv("nonparametric_data.csv", 
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
                            physicians = col_number(), 
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
                                                         "observational")))) 

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
                                  labels = c("Non-parametric Tests",
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
colors <- c('rgb(127, 127, 127)', # error, gray50
            'rgb(94, 94, 94)', # nolink, gray0
            'rgb(56, 56, 56)', # ambiguous, gray22
            'rgb(0, 0, 0)') # correct, gray37 

# Create pie chart 
plot_ly(methods_count, 
        labels = ~methods, 
        values = ~freq, 
        type = 'pie', 
        textposition = 'inside', 
        textinfo = 'label+percent', 
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

# Panel 1: plot for Test (kruskal, whitney, signed, nonparametric) by Methods 
fill <- c("gray50", "gray37", "gray22", "gray0")
test_bar <- ggplot(nonparametric_data, aes(test)) +
        theme_bw() +
        geom_bar(aes(fill = methods)) + 
        labs(x = "Test Type", 
             y = "Number of Articles") + 
        ggtitle("A. Types of Nonparametric Tests Used in Included Studies") + 
        scale_fill_manual(values = fill) + 
        theme(legend.position = "right", 
              legend.direction = "vertical", 
              legend.title = element_blank())

# Panel 2: plot for Significance (significant, mixed, not) by Methods 
sign_bar <- ggplot(nonparametric_data, aes(significance)) +
        theme_bw() +
        geom_bar(aes(fill = methods)) + 
        labs(x = "Degree of Statistical Significance", 
             y = "Number of Articles") + 
        ggtitle("B. Number of Statistically Significant Results when Nonparametric Tests were Used") + 
        scale_fill_manual(values = fill) + 
        theme(legend.position = "right", 
              legend.direction = "vertical", 
              legend.title = element_blank())

# Panel 3: plot for Type (interventional, observational) by Methods
type_bar <- ggplot(nonparametric_data, aes(type)) +
        theme_bw() +
        geom_bar(aes(fill = methods)) + 
        labs(x = "Study Type", 
             y = "Number of Articles") + 
        ggtitle("C. Study Designs Used in Included Studies") + 
        scale_fill_manual(values = fill) + 
        theme(legend.position = "right", 
              legend.direction = "vertical", 
              legend.title = element_blank())

# Panel 4: plot for Model (rodents, humans) by Methods
model_bar <- ggplot(nonparametric_data, aes(model)) +
        theme_bw() +
        geom_bar(aes(fill = methods)) + 
        labs(x = "Model Type", 
             y = "Number of Articles") + 
        ggtitle("D. Models Used in Included Studies") + 
        scale_fill_manual(values = fill) + 
        theme(legend.position = "right", 
              legend.direction = "vertical", 
              legend.title = element_blank())

# Create png for multi-panel stacked barplots
# Characteristics of included studies 
library(ggplot2)
library(gridExtra)
png(filename = "breadth.png", width = 960, height = 960)
fill <- c("gray50", "gray37", "gray22", "gray0")
test_bar <- ggplot(nonparametric_data, aes(test)) +
        theme_bw() +
        geom_bar(aes(fill = methods)) + 
        labs(x = "Test Type", 
             y = "Number of Articles") + 
        ggtitle("A. Types of Nonparametric Tests Used in Included Studies") + 
        scale_fill_manual(values = fill) + 
        theme(legend.position = "bottom", 
              legend.direction = "horizontal", 
              legend.title = element_blank())
sign_bar
type_bar
model_bar 
grid.arrange(test_bar, sign_bar, type_bar, model_bar, ncol = 2)
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
                           sum(error_data$physicians, na.rm = TRUE), 
                           sum(nolink_data$physicians, na.rm = TRUE), 
                           sum(ambiguous_data$physicians, na.rm = TRUE), 
                           sum(correct_data$physicians, na.rm = TRUE),
                           sum(error_data$scientists, na.rm = TRUE), 
                           sum(nolink_data$scientists, na.rm = TRUE), 
                           sum(ambiguous_data$scientists, na.rm = TRUE), 
                           sum(correct_data$scientists, na.rm = TRUE)), 
                         byrow = TRUE, 4, 4)
rownames(cohorts_matrix) <- c("General Public", 
                              "Science Communicators", 
                              "Physicians/Clinicians", 
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
png(filename = "dissemination_cohorts.png", res = 300, width = 14, height = 7, units = 'in')
dissemination_plot <- ggballoonplot(dissemination_matrix,
                                    main = "A.", 
                                    fill = "black")
cohorts_plot <- ggballoonplot(cohorts_matrix, 
                              main = "B.", 
                              fill = "black")
grid.arrange(dissemination_plot, cohorts_plot, ncol = 2)
dev.off()

