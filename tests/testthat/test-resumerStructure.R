context("The resumer returns the proper list")

resBlank <- resumer()

test_that('resumer returns an rmakdown object with the correct class', {
    expect_named(resBlank)
    expect_is(resBlank, 'rmarkdown_output_format')
})

unlink('resume.cls')
