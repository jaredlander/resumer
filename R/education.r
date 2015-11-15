#' #' @title schoolText
#' #' @description Builds LaTeX code for info on a school
#' #' @details Builds LaTeX code for info on a school
#' #' @author Jared P. Lander
#' #' @export schoolText
#' #' @rdname schoolText
#' #' @param schoolInfo A named list of information about the school.  Must contain c('school', 'dates', 'degree', 'gpa')
#' #' @return LaTeX formatted text for the school
#' #' @examples 
#' #' schoolText(list(school='Columbia University', 
#' #' dates=c(2007, 2009), degree="Master of Arts in Statistics", gpa=3.926))
#' #' 
#' schoolText <- function(schoolInfo)
#' {
#'     # if they entered two dates build a dash, otherwise provide the one date
#'     if(length(schoolInfo$dates) == 2)
#'     {
#'         theDates <- sprintf("%s--%s", schoolInfo$dates[1], schoolInfo$dates[2])
#'     }else if(length(schoolInfo$dates) == 1)
#'     {
#'         theDates <- schoolInfo$dates
#'     }
#'     else
#'     {
#'         stop("Exactly one or two dates must be specified")
#'     }
#'     
#'     # patch together all the info
#'     sprintf("{\\bf %s} \\hfill {%s} \\\\ GPA %s \\\\ %s", 
#'             schoolInfo$school, theDates, schoolInfo$gpa, schoolInfo$degree)
#' }
#' 
#' #' @title buildEducation
#' #' @description Builds an education section for all schools
#' #' @details Builds LaTeX formated code for all schools
#' #' @author Jared P. Lander
#' #' @export buildEducation
#' #' @rdname buildEducation
#' #' @param info A list of lists for school information.  Each inner list must be of the form c('school', 'dates', 'degree', 'gpa') as in \code{\link{schoolText}}.
#' #' @examples 
#' #' eduction <- list(
#' #' list(school='Columbia University', 
#' #' dates=c(2007, 2009), degree="Master of Arts in Statistics", gpa=3.926),
#' #' list(school='Muhlenberg College', 
#' #' dates=c(2000, 2004), 
#' #' degree="Bachelor of Science in Mathematics, Business Administration Minor", gpa=3.748))
#' #' buildEducation(education)
#' #' 
#' buildEducation <- function(info)
#' {
#'     # build text for the different schools
#'     schoolInfo <-sapply(info, schoolText)
#'     
#'     # build text
#'     multSchools <- paste(sapply(education, schoolText), collapse=" \\smallskip\\\\\n")
#'     
#'     # return all text
#'     sprintf("\\begin{rSection}{Eduction}\n %s \n \\end{rSection}", multSchools)
#' }