context("education functions generate approrpiate LaTeX")

education <- list(
    list(school='Columbia University', dates=c(2007, 2009), 
         degree="Master of Arts in Statistics", gpa=3.926),
    list(school='Muhlenberg College', dates=c(2000, 2004),
         degree="Bachelor of Science in Mathematics, Business Administration Minor", gpa=3.748)
)

test_that('schoolText returns proper LaTeX for one school', {
    expect_equal(schoolText(education[[1]]), 
                 "{\\bf Columbia University} \\hfill {2007--2009} \\\\ GPA 3.926 \\\\ Master of Arts in Statistics")
    expect_equal(schoolText(education[[2]]), 
                 "{\\bf Muhlenberg College} \\hfill {2000--2004} \\\\ GPA 3.748 \\\\ Bachelor of Science in Mathematics, Business Administration Minor")
})

test_that('buildEducation returns proper LaTeX block and code for all schools', {
    expect_equal(buildEducation(education),
                 "\\begin{rSection}{Eduction}\n {\\bf Columbia University} \\hfill {2007--2009} \\\\ GPA 3.926 \\\\ Master of Arts in Statistics \\smallskip\\\\{\\bf Muhlenberg College} \\hfill {2000--2004} \\\\ GPA 3.748 \\\\ Bachelor of Science in Mathematics, Business Administration Minor \n \\end{rSection}")
})

test_that('school builders return the proper class', {
    expect_is(schoolText(education[[1]]), 'character')
    expect_is(schoolText(education[[2]]), 'character')
    expect_is(buildEducation(education), 'character')
})
