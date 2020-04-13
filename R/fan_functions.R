#' fars_read
#' 
#' A function that converts the accident data to an object of the tbl_df class, a subclass of data.frame
#'
#' @param filename The CSV file to turn into an object of the tbl_df class
#' 
#' @return The tbl_df dataframe object
#'
#' @note If the data cannot be read, the program will attempt to read accident_xxx.CSV from the root dir. If neither can be read, an error will be thrown
#'
#' @importFrom dplyr tbl_df
#' 
#' @examples
#' csvdata <- fars_read(fars_data.zip)
#' 
#' @export
fars_read <- function(filename) {
        if(exists(filename))
        {
                return(get(filename))
        }
        filename <- paste0(filename, '.csv.bz2')
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
}

#' make_filename
#' 
#' A function returns a filename with the prefix 'accident_' followed by a given year
#' 
#' @param year The year to append to the 'accident_' prefix
#' 
#' @return A string containing the prefix 'accident_' followed by the given year
#' 
#' @note If the value provided for the year parameter is not of type integer, the function will attempt to coerce it into a value of type integer, and if it cannot do so, an error fill be thrown
#' 
#' @examples
#' filename <- make_filename(2015)
#' 
#' @export
make_filename <- function(year) {
        year <- as.integer(year)
        sprintf("accident_%d", year)
}

#' fars_read_years
#' 
#' A function that will read the accident CSV file(s) for given year(s), and return the year and month of the found observations
#'
#' @param year The year(s) of the accident CSV data file(s) to use
#' 
#' @return The tbl_df dataframe object, containing the year and month of the found observations
#' 
#' @note If the value provided for the year parameter is not of type integer, the function will attempt to coerce it into a value of type integer, and if it cannot do so, an error fill be thrown
#'
#' @importFrom dplyr tbl_df
#' @importFrom dplyr select
#' 
#' @examples
#' accident_ym <- fars_read_years(c(2014, 2015))
#' 
#' @export
fars_read_years <- function(years) {
        lapply(years, function(year) {
                file <- make_filename(year)
                tryCatch({
                        dat <- fars_read(file)
                        dplyr::mutate(dat, year = year) %>% 
                                dplyr::select(MONTH, year)
                }, error = function(e) {
                        warning("invalid year: ", year)
                        return(NULL)
                })
        })
}

#' fars_summarize_years
#' 
#' A function that will summarize the number of observations for every month, in the accident CSV file(s), by years
#'
#' @param year The year(s) of the accident CSV data file(s) to use
#' 
#' @return The tbl_df dataframe object, containing the summary
#' 
#' @note If the value provided for the year parameter is not of type integer, the function will attempt to coerce it into a value of type integer, and if it cannot do so, an error fill be thrown
#'
#' @importFrom dplyr tbl_df
#' @importFrom tidyr spread
#' 
#' @examples
#' accidentsummary <- fars_summarize_years(c(2014, 2015))
#' 
#' @export
fars_summarize_years <- function(years) {
        dat_list <- fars_read_years(years)
        dplyr::bind_rows(dat_list) %>% 
                dplyr::group_by(year, MONTH) %>% 
                dplyr::summarize(n = n()) %>%
                tidyr::spread(year, n)
}

#' fars_map_state
#' 
#' A function will plot the location of the observations with a LONGITUD value over 900, and a LATITUDE value over 90, in a specified state, during a specified year, on a map
#'
#' @param state.num The number of the state to filter the observations for
#' @param year The year(s) of the accident CSV data file(s) to use
#' 
#' @return A map object containing plotted points for the location of each observation in a specified state, with a LONGITUD value over 900, and a LATITUDE value over 90, during a specified year
#' 
#' @note If the value provided for the state.num is not of type numeric, and the value provided for the year parameter is not of type integer, the function will attempt to coerce it into a values of types numeric and integer, and if it cannot do so, an error fill be thrown
#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points

#' 
#' @examples
#' alabama_accidents <- fars_map_state(1, 2015)
#' 
#' @export
fars_map_state <- function(state.num, year) {
        filename <- make_filename(year)
        print(filename)
        data <- fars_read(filename)
        print(data)

        if(!(state.num %in% unique(data$STATE)))
                stop("invalid STATE number: ", state.num)
        data.sub <- dplyr::filter(data, STATE == state.num)
        if(nrow(data.sub) == 0L) {
                message("no accidents to plot")
                return(invisible(NULL))
        }
        is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
        is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
        with(data.sub, {
                maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
                          xlim = range(LONGITUD, na.rm = TRUE))
                graphics::points(LONGITUD, LATITUDE, pch = 46)
        })
}