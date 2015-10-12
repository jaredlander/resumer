#' @title createDatabase
#' @description Creates a database to hold resume information
#' @details Creates a SQLITE database with the necessary columns for making a resume
#' @author Jared P. Lander
#' @rdname createDatabase
#' @export createDatabase
#' @param location Directory in which to create the database
#' @param name Name to use for the database
createDatabase <- function(location=getwd(), name='Resume')
{
    fileName <- file.path(location, sprintf('%s.sqlite', name))
    
    if(file.exists(fileName))
    {
        stop(
            sprintf(
                '%s already exists!  Delete the file manually if you wish to create a new database', 
                fileName
                )
            )
    }
    
    # create the database file
    db <- dbConnect(SQLite(), dbname=fileName)
    # create a table
    dbSendQuery(conn=db, 
                "CREATE TABLE School(SchID INTERGER, Location Text, Authority TEXT, SchSize TEXT)"
                )
}