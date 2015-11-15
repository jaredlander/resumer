context("GenerateSection generates proper LaTeX")

data(jobs)
jobList <- list(
     list("Pied Piper", "Tech Startup", c(1, 3)),
     list("Goliath National Bank", "Bank Intern", 1:3),
     list("Surveyors Inc", "Survery Stats", 1:2)
)

multListing <- generateMultipleListings(jobs, jobList)
theSection <- generateSection(jobs, jobList)

test_that('generateMultipleListings generates a vector of text of the correct length', {
    expect_equal(length(multListing), length(jobList))
    expect_is(multListing, 'character')
})

test_that('generateSection generates a vector of text of the correct length', {
    expect_equal(length(theSection), 1)
    expect_is(theSection, 'character')
})