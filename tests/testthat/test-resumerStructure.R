context("The resumer returns the proper list")

resBlank <- resumer()
    
test_that('resumer returns a named rmakdown object with the correct class', {
    expect_named(resBlank)
    expect_is(resBlank, 'rmarkdown_output_format')
    
    # expect_equal(length(resBlank), 10)
    # expect_equal(names(resBlank), c("knitr", "pandoc", "keep_md", "clean_supporting", 
    #                                 "pre_knit", "post_knit",
    #                                 "pre_processor", "intermediates_generator", "post_processor", 'on_exit'))
})

unlink('resume.cls')
