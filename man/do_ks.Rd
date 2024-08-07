% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/do_ks.R
\name{do_ks}
\alias{do_ks}
\title{Compute Kolmogorov-Smirnov Test for most extreme conditions}
\usage{
do_ks(do_stats, question)
}
\arguments{
\item{do_stats}{A data frame made from \code{\link[=compute_stats]{compute_stats()}}, containing information on the percent remaining per question per condition}

\item{question}{Index of question to be included in analysis, commonly the last question of the survey.}
}
\value{
Returns result of Kolmogorov-Smirnoff test including which conditions have the most different dropout rates.
}
\description{
This test is used for survival analysis between the most extreme conditions,
so the ones with the most different rates of dropout.
This function automatically prepares your data and runs \code{stats::ks.test()} on it.
}
\examples{
do_stats <- compute_stats(df = add_dropout_idx(dropRdemo, 3:54),
by_cond = "experimental_condition",
no_of_vars = 52)

do_ks(do_stats, 52)


}
