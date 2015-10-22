#' @title generateMultipleListings
#' @description Generate an entire resume section
#' @details Using a list of lists to describe jobs generate text for each job subsection
#' @author Jared P. Lander
#' @export generateMultipleListings
#' @rdname generateMultipleListings
#' @importFrom dplyr "%>%"
#' @seealso \code{link{generateListings}} \code{\link{generateSection}}
#' @param data data.frame holding the info for one job
#' @param jobList A list of jobs, each of which is a list where the first element is the Company, the second is the JobName and the third is a vector of BulletName's
#' @param type The type of section to build; defaults to 'Job', the other currently supported value is 'Research'
#' @param specialChars Vector of characters that need to be double-backslashed escaped
#' @return A vector of text, one for each job
#' @examples 
#' jobList <- list(
#'      list("Pied Piper", "Tech Startup", c(1, 3)),
#'      list("Goliath National Bank", "Bank Intern", 1:3),
#'      list("Surveyors Inc", "Survery Stats", 1:2)
#' )
#' 
#' generateMultipleListings(jobs, jobList)
#' 
generateMultipleListings <- function(data, jobList, type='Job', specialChars='&')
{
    lapply(jobList, 
           function(x){ 
               data %>% 
                   dplyr::filter(Company==x[[1]], JobName==x[[2]]) %>% 
                   dplyr::do(Text=generateListing(., bullets=x[[3]], type=type, specialChars=specialChars)) 
           }
    ) %>% 
        unlist
}

generateSection(jobs, jobList, specialChars='&')
#' @title generateSection
#' @description Generate an entire job/research section
#' @details Given a jobs data.frame and a job list generate all the code needed for a jobs section
#' @author Jared P. Lander
#' @export generateSection
#' @rdname generateSection
#' @seealso \code{link{generateListings}} \code{\link{generateMultipleListings}}
#' @inheritParams generateMultipleListings
#' @param sectionName Name to be printed at the top of the section
#' @return All the text needed for a job section
#' @examples 
#' jobList <- list(
#'      list("Pied Piper", "Tech Startup", c(1, 3)),
#'      list("Goliath National Bank", "Bank Intern", 1:3),
#'      list("Surveyors Inc", "Survery Stats", 1:2)
#' )
#' 
#' generateSection(jobs, jobList)
#' 
generateSection <- function(data, jobList, sectionName='Relevant Experience', type='Job', specialChars='&')
{
    opening <- sprintf('\\begin{rSection}{%s}', sectionName)
    closing <- '\\end{rSection}'
    paste(opening, 
          paste(generateMultipleListings(data, jobList, type=type, specialChars=specialChars), 
                collapse='\n\n'
          ), 
          closing,
          sep='\n\n'
    )
}
