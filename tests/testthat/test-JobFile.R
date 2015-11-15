context("JobFile creates file correctly")

fileName <- 'ThisFileAndThatFile.csv'
defaultPath <- createJobFile()
newName <- createJobFile(fileName)
sepFileName <- 'Sillycommas.csv'
sepWith <- ','
withDifferentSep <- createJobFile(sepFileName, sep=sepWith)

colNames <- c("JobName", "Company", "Title", "Start", "End", "BulletName", "Bullet", "Type")

test_that("JobFile creates a csv properly", {
    ## default file
    expect_true(file.exists('Resume.csv'))
    ## named file
    expect_true(file.exists(fileName))
    ## different separator
    expect_true(file.exists(sepFileName))
})

test_that("There's an error if the file exists", {
    expect_error(createJobFile())
    expect_error(createJobFile(fileName))
    expect_error(createJobFile(sepFileName))
})

test_that('The proper columns were created by createJobFile', {
    expect_is(defaultPath, 'data.frame')
    expect_is(newName, 'data.frame')
    expect_is(withDifferentSep, 'data.frame')
    
    expect_named(defaultPath)
    expect_named(newName)
    expect_named(withDifferentSep)
    
    expect_equal(names(defaultPath), colNames)
    expect_equal(names(newName), colNames)
    expect_equal(names(withDifferentSep), colNames)
})

test_that('The resume file can be read', {
    defaultFile <- read.table('Resume.csv', header=TRUE, stringsAsFactors=FALSE, sep=';')
    newFile <- read.table(fileName, header=TRUE, stringsAsFactors=FALSE, sep=';')
    newFileSep <- read.table(sepFileName, header=TRUE, stringsAsFactors=FALSE, sep=sepWith)
    
    expect_equal(dim(defaultFile), c(0, 8))
    expect_equal(dim(newFile), c(0, 8))
    expect_equal(dim(newFileSep), c(0, 8))
    
    expect_equal(names(defaultFile), colNames)
    expect_equal(names(newFile), colNames)
    expect_equal(names(newFileSep), colNames)
})

unlink(c('Resume.csv', fileName, sepFileName))
