


##' Grabs the serial number and date from a VRL file
##'
##' Grabs the serial number and date from a VRL file
##' @title Grab serial number and date
##' @param x a character vector of filenames of VRL files
##' @return data.frame with the serial number, date, and file name 
##' @author Matt Espe
##' @export
grab_serial_date = function(x)
{
    tmp = gsub("^.*_([0-9]{6})_([0-9]{8})_.*$", "\\1_\\2", basename(x))
    tmp = as.data.frame(do.call(rbind, strsplit(tmp, "_")))
    colnames(tmp) = c("serial", "date")
    tmp$date = as.Date(tmp$date, "%Y%m%d")
    tmp$filename = x

    tmp
}

##' This checks the serial number and date of VRL records against
##' those present in the database.
##'
##' This checks the serial number and date of VRL records against
##' those present in the database.
##' @title Check VRL files
##' @param vrl_file_dir the parent directory for the VRL files
##' @param db_filepath the full file path to the database
##' @param con a connection to a SQL database
##' @param vrl_files a character vector of the VRL files to check
##'     against
##' @param serial_date_df a data.frame created by
##'     \code{grab_serial_date}
##' @param deploy_query SQL query to grab the deployment records of
##'     interest
##' @return list, with two data.frame, the original serial_date_df
##'     with an additional logical column specifying if the VRL record
##'     was present in the database, and a data.frame of the
##'     detections, with an additional logical column indicating if
##'     the record in the database has an associated file in the
##'     folder.
##' @author Matt Espe
##' @export
check_vrls = function(vrl_file_dir, db_filepath,
                      date_range = c("2012-01-01", "2060-01-01"),
                      con = dbConnect(SQLite(), db_filepath),
                      vrl_files = list.files(vrl_file_dir, pattern = "\\.vrl$",
                                             recursive = TRUE, full.names = TRUE),
                      serial_date_df = grab_serial_date(vrl_files),
                      deploy_query = "SELECT Receiver, VRLDate FROM deployments")
{
    date_range = as.Date(date_range)
    
    tmp = dbGetQuery(con, deploy_query)
    tmp = subset(tmp, VRLDate > min(date_range) & VRLDate < max(date_range))
    in_db = paste(serial_date_df$serial, serial_date_df$date) %in%
        paste(tmp$Receiver, tmp$VRLDate)
    in_folder = paste(tmp$Receiver, tmp$VRLDate) %in%
        paste(serial_date_df$serial, serial_date_df$date)

    list(vrl_files = data.frame(serial_date_df, in_db = in_db),
         db_files = data.frame(tmp, in_folder = in_folder))
}
