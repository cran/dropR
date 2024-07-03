## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
library(dropR)
data("dropRdemo")
qs <- which(grepl("vi_", names(dropRdemo)))
dropRdemo <- add_dropout_idx(dropRdemo, q_pos = qs)

stats <- compute_stats(dropRdemo,
                             by_cond = "experimental_condition",
                             no_of_vars = length(qs))

## -----------------------------------------------------------------------------
do_chisq(stats,
         chisq_question = 15,
         sel_cond_chisq = c('11','12'),
         p_sim = TRUE)

## -----------------------------------------------------------------------------
kpm <- do_kpm(df = add_dropout_idx(dropRdemo, qs),
              condition_col = "experimental_condition",
              model_fit = "total")

kpm$model_fit
head(kpm$steps)
head(kpm$d)

