#' @title generateListing
#' @description Generate LaTeX code for job info
#' @details Given a subsetted dataset of just one job this generates LaTeX code.  Given jobname and company name, print out the section.
#' @author Jared P. Lander
#' @export generateListing
#' @rdname generateListing
#' @importFrom dplyr filter_ "%>%"
#' @seealso \code{\link{generateMultipleListings}} \code{\link{generateSection}}
#' @param data data.frame holding the info for one job
#' @param bullets The BulletName's for the desired rows
#' @param type The type of subsection to build; defaults to 'Job', the other currently supported value is 'Research'
#' @param specialChars Vector of characters that need to be double-backslashed escaped
#' @return LaTeX code for a subsection in the resume
#' @examples 
#' library(dplyr)
#' oneJob <- jobs %>% filter(JobName=='Pied Piper', Company=='Tech Central')
#' generateListing(oneJob)
#' generateListing(oneJob, bullets=c(1, 3))
#' 
#' oneResearch <- jobs %>% filter(JobName=='Oddie Research', Company=='Hudson University')
#' generateListing(oneResearch, bullets=4, type='Research')
#' generateListing(oneResearch, bullets=4:5, type='Research')
#' 
generateListing <- function(data, bullets, type='Job', specialChars='&')
{
    # select just the wanted bullets
    if(!missing(bullets))
    {
        data <- data %>% filter_(~BulletName %in% bullets)
    }
    
    # only get the type we are looking for
    data <- data %>% filter_(~Type==type)
    
    # get the information that is only needed once
    company <- data$Company[1]
    location <- data$Location[1]
    title <- data$Title[1]
    
    ## build date section
    # the start and stop are identical so just grab the first row
    jobStart <- data$Start[1]
    jobStop <- data$End[1]
    
    # if the end date is not there, just use the start date, otherwise build both with a hyphen in between
    if(is.na(jobStop) || jobStop == '')
    {
        dates <- jobStart
    }else
    {
        dates <- sprintf("%s--%s", jobStart, jobStop)
    }
    
    if(type == 'Job')
    {
        type <- 'rSubsection'
        
        # build opening line for the job based on the company name, dates, title and location
        opening <- sprintf("\\begin{%s}{%s}{%s}{%s}{%s}", type, company, dates, title, location)
        
        # get all the bullets, prefixed with \item, sub out characters which cause trouble and unlist
        #points <- data %$% sprintf('\\item %s', Bullet) %>% useful::subSpecials(specialChars=specialChars) %>% unlist
        points <- sprintf('\\item %s', data$Bullet) %>% useful::subSpecials(specialChars=specialChars) %>% unlist
        
        # build ending which is the same for all jobs
        ending <- sprintf("\\end{%s}", 'rSubsection')
    } else
    {
        # build opening line for the job based on the company name, dates, title and location
        opening <- sprintf("\\begin{%s}{%s}{%s}{%s}", 'research', company, data$Description[1], dates)
        
        # get all the bullets, prefixed with \item, sub out characters which cause trouble and unlist
        #points <- data %$% sprintf('%s\n\n', Bullet) %>% useful::subSpecials(specialChars=specialChars) %>% unlist
        points <- sprintf('%s\n\n', data$Bullet) %>% useful::subSpecials(specialChars=specialChars) %>% unlist
        
        # build ending which is the same for all jobs
        ending <- sprintf("\\end{%s}", 'research')
    }
    
    paste(opening, paste(points, collapse="\n"), ending, sep="\n")
}
