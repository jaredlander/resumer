context("Generate listing builds appropriate LaTeX code")

oneJob <- jobs %>% filter(JobName=='Tech Startup', Company=='Pied Piper')
noBullets <- generateListing(oneJob)
withBullets <- generateListing(oneJob, bullets=c(1, 3))

test_that("generateListing returns only one element of text", {
    expect_equal(length(noBullets), 1)
    expect_equal(length(withBullets), 1)
    
    expect_is(noBullets, 'character')
    expect_is(withBullets, 'character')
})

test_that('generateListing builds the right text', {
    expect_equal(noBullets,
                 "\\begin{rSubsection}{Pied Piper}{2013--Present}{CTO}{New York, NY}\n\\item Set up company's computing platform\n\\item Designed data strategy overseeing many datasources\n\\item Constructed statistical models for predictive analytics of big data\n\\end{rSubsection}"
    )
    
    expect_equal(withBullets,
                 "\\begin{rSubsection}{Pied Piper}{2013--Present}{CTO}{New York, NY}\n\\item Set up company's computing platform\n\\item Constructed statistical models for predictive analytics of big data\n\\end{rSubsection}"
    )
})
