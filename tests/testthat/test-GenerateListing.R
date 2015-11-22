context("Generate listing builds appropriate LaTeX code")

oneJob <- jobs %>% dplyr::filter(JobName=='Tech Startup', Company=='Pied Piper')
noBullets <- generateListing(oneJob)
withBullets <- generateListing(oneJob, bullets=c(1, 3))

oneResearch <- jobs %>% dplyr::filter(JobName=='Oddie Research', Company=='Hudson University')
researchOne <- generateListing(oneResearch, bullets=4, type='Research')
researchTwo <- generateListing(oneResearch, bullets=4:5, type='Research')

test_that("generateListing returns only one element of text", {
    expect_equal(length(noBullets), 1)
    expect_equal(length(withBullets), 1)
    expect_equal(length(researchOne), 1)
    expect_equal(length(researchTwo), 1)
    
    expect_is(noBullets, 'character')
    expect_is(withBullets, 'character')
    expect_is(researchOne, 'character')
    expect_is(researchTwo, 'character')
})

test_that('generateListing builds the right text', {
    expect_equal(noBullets,
                 "\\begin{rSubsection}{Pied Piper}{2013--Present}{CTO}{New York, NY}\n\\item Set up company's computing platform\n\\item Designed data strategy overseeing many datasources\n\\item Constructed statistical models for predictive analytics of big data\n\\end{rSubsection}"
    )
    
    expect_equal(withBullets,
                 "\\begin{rSubsection}{Pied Piper}{2013--Present}{CTO}{New York, NY}\n\\item Set up company's computing platform\n\\item Constructed statistical models for predictive analytics of big data\n\\end{rSubsection}"
    )
    
    # expect_equal(researchOne,
    #              "\\begin{research}{Hudson University}{Humanitarian Research}{2008--Present}\nTo reduce the time, cost and effort necessary to properly analyze a region affected by a natural or manmade disaster Dr. Richard Garfield and I worked on methods to show that smaller sample sizes can adequately provide the same information as larger sample sizes.  For our study we used data from the 2010 Pakistan floods that devastated large swathes of the country.  We compared varying samples sizes ranging from 5 tehsils (villages) in each province to full enumeration.  While the research is still ongoing we have so far demonstrated that as few as 10 tehsils per province is sufficient.  This should help improve future responses to disasters.\\n\n\\end{research}"
    # )
    
    # expect_equal(researchTwo,
    #              "\\begin{research}{Hudson University}{Humanitarian Research}{2008--Present}\nTo reduce the time, cost and effort necessary to properly analyze a region affected by a natural or manmade disaster Dr. Richard Garfield and I worked on methods to show that smaller sample sizes can adequately provide the same information as larger sample sizes.  For our study we used data from the 2010 Pakistan floods that devastated large swathes of the country.  We compared varying samples sizes ranging from 5 tehsils (villages) in each province to full enumeration.  While the research is still ongoing we have so far demonstrated that as few as 10 tehsils per province is sufficient.  This should help improve future responses to disasters.\nI was engaged in statistical and analytic support to Dr. Garfield of Columbia’s School of Nursing and Dr. John Mutter from Columbia’s Earth Institute in their study of the socioeconomic, health and geographic factors affecting deaths in New Orleans following Hurricane Katrina. We are reconciling a self-reporting death list with an official State list that is thought to under represent Katrina related deaths. The goal is to determine what disparities, if any, resulted in a greater proportion of deaths among certain populations as opposed to others. The analysis will result in journal article preparation in in which I will be one of the authors.\n\\end{Research}"
    # )
})
