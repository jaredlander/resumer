#' @title resumer
#' @description Convert to a resume
#' 
#' @inheritParams rmarkdown::html_document
#' 
#' @param fig_crop \code{TRUE} to automatically apply the \code{pdfcrop} utility (if available) to pdf figures
#' @param dev Graphics device to use for figure output (defaults to pdf)
#' @param highlight Syntax highlighting style. Supported styles include "default", "tango", "pygments", "kate", "monochrome", "espresso", "zenburn", and "haddock". Pass \code{NULL} to prevent syntax highlighting.
#' @param keep_tex Keep the intermediate tex file used in the conversion to PDF
#' @param latex_engine LaTeX engine for producing PDF output. Options are "pdflatex", "lualatex", and "xelatex".
#' @param template Pandoc template to use for rendering. Pass "default" to use the resumer package default template; pass \code{NULL} to use pandoc's built-in template; pass a path to use a custom template that you've created.  See the documentation on \href{http://johnmacfarlane.net/pandoc/demo/example9/templates.html}{pandoc templates} for more details.
#' 
#' @export
resumer <- function(fig_width = 4, fig_height = 2.5, fig_crop = TRUE, dev = 'pdf',
                    highlight = "default", keep_tex = FALSE, latex_engine = "pdflatex", 
                    includes = NULL, md_extensions = NULL,
                    pandoc_args = NULL, template='default')
{
    # resolve default highlight
    if (identical(highlight, "default"))
        highlight <- "pygments"
    
    if(identical(template, 'default'))
    {
        # get the resume template
        template <-  system.file(
            "rmarkdown/templates/resumer/resources/resumer.tex", 
            package = "resumer"
        )
    }
    
    classLoc <- file.path(getwd(), '/resume.cls')
    file.copy(
        from=system.file("rmarkdown/templates/resumer/resources/resume.cls", package = "resumer"), 
        to=classLoc
            #file.path(getwd(), 'resume.cls')
    )
    
    #on.exit(unlink(classLoc), add=TRUE)
    
    # call the base pdf_document format with the appropriate options
    # rmarkdown::pdf_document(fig_width = fig_width,
    #                                   fig_height = fig_height,
    #                                   fig_crop = fig_crop,
    #                                   dev = dev,
    #                                   highlight = highlight,
    #                                   template = template,
    #                                   keep_tex = keep_tex,
    #                                   latex_engine = latex_engine,
    #                                   includes = includes,
    #                                   md_extensions = md_extensions,
    #                                   pandoc_args = pandoc_args)
    
    args <- c()
    args <- c(args)#, rmarkdown::pandoc_toc_args(toc, toc_depth))
    
    args <- c(args, "--template", rmarkdown::pandoc_path_arg(template))
    
    latex_engine = match.arg(latex_engine, c("pdflatex", "lualatex", 
                                             "xelatex"))
    args <- c(args, rmarkdown::pandoc_latex_engine_args(latex_engine))
    args <- c(args, rmarkdown::includes_to_pandoc_args(includes))
    args <- c(args, pandoc_args)
    saved_files_dir <- NULL
    pre_processor <- function(metadata, input_file, runtime, 
                              knit_meta, files_dir, output_dir) {
        saved_files_dir <<- files_dir
        if (identical(template, "default")) 
            pdf_pre_processor(metadata, input_file, runtime, 
                              knit_meta, files_dir, output_dir)
        else invisible(NULL)
    }
    intermediates_generator <- function(original_input, encoding, 
                                        intermediates_dir) {
        intermediates <- copy_render_intermediates(original_input, 
                                                   encoding, intermediates_dir, FALSE)
        if (!is.null(saved_files_dir) && dir_exists(saved_files_dir)) {
            file.copy(saved_files_dir, intermediates_dir, recursive = TRUE)
            intermediates <- c(intermediates, list.files(path = file.path(intermediates_dir, 
                                                                          basename(saved_files_dir)), all.files = TRUE, 
                                                         recursive = TRUE, full.names = TRUE))
        }
        intermediates
    }
    
    post_processor <- function(metadata, input_file, output_file, clean, verbose)
    {
        if(clean)
            unlink(classLoc)
        return(output_file)
    }
    rmarkdown::output_format(knitr=rmarkdown::knitr_options_pdf(fig_width, fig_height, fig_crop, dev), 
                             pandoc=rmarkdown::pandoc_options(to="latex", 
                                                     #from=from_rmarkdown(fig_caption, md_extensions),
                                                     args=args, keep_tex = keep_tex
                             ), 
                             clean_supporting = !keep_tex, 
                             pre_processor=pre_processor, 
                             intermediates_generator=intermediates_generator, 
                             post_processor=post_processor
    )
}
