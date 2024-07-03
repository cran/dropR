## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(kableExtra)

## ----setup, message=FALSE-----------------------------------------------------
library(dropR)

## -----------------------------------------------------------------------------
library(dropR)
# Use demo dataset in a new data frame to be edited
df <- dropRdemo

## ----echo = FALSE-------------------------------------------------------------
df_subset <- cbind(df[1:5, 1:5], c(" ", " ", " ", " ", " "), df[1:5, (ncol(df)-1):ncol(df)])
colnames(df_subset) <- c(colnames(df)[1:5], "...", colnames(df)[(ncol(df)-1):ncol(df)])
kable(df_subset, "html", escape = FALSE)

## -----------------------------------------------------------------------------
qs <- which(grepl("vi_", names(df)))
# add numeric drop out position to original dataset
df <- add_dropout_idx(df, q_pos = qs)
kable(head(df[,c(1:3,(ncol(df)-1):ncol(df))]))

## -----------------------------------------------------------------------------
stats <- compute_stats(df,
                       by_cond = "experimental_condition",
                       no_of_vars = length(qs))
kable(head(stats))

## -----------------------------------------------------------------------------
plot_do_curve(stats)

## ----tidyflow, warning=F------------------------------------------------------
library(ggplot2)

dropRdemo %>% 
  add_dropout_idx(3:54) %>% 
  compute_stats(by_cond = "experimental_condition", no_of_vars = 52) %>% 
  plot_do_curve(linetypes = F, full_scale = F, show_confbands = T) +
  labs(title = "Dropout Plot with tidyverse Workflow") +
  scale_color_brewer(palette = "Dark2") + scale_fill_brewer(palette = "Dark2")

