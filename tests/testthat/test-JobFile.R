context("JobFile creates file correctly")

fileName <- 'ThisFileAndThatFile.csv'
defaultPath <- createJobFile()
newName <- createJobFile(fileName)

test_that("JobFile creates a csv properly", {
    ## default file
    expect_true(file.exists('Resume.csv'))
    ## named file
    expect_true(file.exists(fileName))
})

test_that("There's an error if the file exists", {
    expect_error(createJobFile())
    expect_error(createJobFile(fileName))
})

test_that('The proper columns were created by createJobFile', {
    expect_is(defaultPath, 'data.frame')
    expect_is(newName, 'data.frame')
    
    expect_named(defaultPath)
    expect_named(newName)
    
    expect_equal(names(defaultPath), c("JobName", "Company", "Title", "Start", "End", "BulletName", "Bullet", "Type"))
    expect_equal(names(newName), c("JobName", "Company", "Title", "Start", "End", "BulletName", "Bullet", "Type"))
})

unlink(c('Resume.csv', fileName))
