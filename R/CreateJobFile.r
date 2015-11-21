#' @title createJobFile
#' @description Creates a CSV to hold information about jobs and research
#' @details This creates a data.frame and writes an empty file to disk.  This file should either be edited by hand or with a data.frame.
#' @author Jared P. Lander
#' @export createJobFile
#' @rdname createJobFile
#' @param filename Name of file in which to create the csv
#' @param sep Separator to use, ; is suggested
#' @return An empty data.frame
#' @examples 
#' \dontrun{
#'createJobFile() 
#' }
#' 
createJobFile <- function(filename='Resume.csv', sep=';')
{
    if(file.exists(filename))
    {
        stop('You are about to overwrite an existing file')
    }
    
    jobFrame <- data.frame(JobName=character(0), 
                           Company=character(0), Title=character(0), 
                           Start=character(0), End=character(0), 
                           BulletName=character(0), Bullet=character(0), Type=character(0))
    write.table(jobFrame, file=filename, sep=sep, col.names=TRUE, row.names=FALSE, append=FALSE)
    
    return(jobFrame)
}

#createJobFile()