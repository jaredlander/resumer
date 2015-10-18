context("JobFile creates file correctly")

defaultPath <- createJobFile()
newName <- createJobFile('ThisFileAndThatFile.csv')

test_that("JobFile creates a csv properly", {
    expect_eq file.exists
})
