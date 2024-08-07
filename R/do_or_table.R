#' Dropout Odds Ratio Table
#' 
#' This function calculates an Odds Ratio table at a given question for selected experimental
#' conditions. It needs data in the format as created by [compute_stats()] as input.
#' 
#' @param do_stats data.frame statistics table as computed by [compute_stats()].
#' @param chisq_question numeric Which question to calculate the OR table for
#' @param sel_cond_chisq character vector naming the experimental conditions to compare
#' @export
#' 
#' @seealso [compute_stats()]
#' 
#' @returns Returns a Matrix containing the Odds Ratios of dropout between all selected conditions.
#' 
#' @examples
#' do_stats <- compute_stats(df = add_dropout_idx(dropRdemo, 3:54),
#' by_cond = "experimental_condition",
#' no_of_vars = 52)
#' 
#' do_or_table(do_stats, chisq_question = 51, sel_cond_chisq = c("11", "12", "21", "22"))
#' 
#' 
do_or_table <- function(do_stats,
                        chisq_question,
                        sel_cond_chisq){
  # Resolve global variable issue
  q_idx <- condition <- NULL
  
  df <- as.data.frame(do_stats)
  df <- subset(df,condition %in% sel_cond_chisq)
  df$condition <- factor(df$condition)
  # d <- subset(d,condition != "total")
  
  test_input <- subset(df, q_idx == chisq_question)
  
  OR_matrix <- outer(test_input$pct_remain,
                     test_input$pct_remain,
                     FUN = get_odds_ratio)
  colnames(OR_matrix) <- test_input$condition
  row.names(OR_matrix) <- test_input$condition
  OR_matrix
}
