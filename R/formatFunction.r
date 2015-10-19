#' @title resumer
#' @inheritParams rmarkdown::pdf_document
#' 
#' @export
resumer <- function(fig_width = 4, fig_height = 2.5, fig_crop = TRUE, dev = 'pdf',
                    highlight = "default", keep_tex = FALSE, includes = NULL, md_extensions = NULL,
                    pandoc_args = NULL)
{
    # resolve default highlight
    if (identical(highlight, "default"))
        highlight <- "pygments"
    
    # get the tufte handlout template
    template <-  system.file(
        "rmarkdown/templates/resumer/resources/resumer.tex", 
        package = "resumer"
    )
    
    # call the base pdf_document format with the appropriate options
    rmarkdown::pdf_document(fig_width = fig_width,
                                      fig_height = fig_height,
                                      fig_crop = fig_crop,
                                      dev = dev,
                                      highlight = highlight,
                                      template = template,
                                      keep_tex = keep_tex,
                                      latex_engine = "pdflatex",
                                      includes = includes,
                                      md_extensions = md_extensions,
                                      pandoc_args = pandoc_args)
}
