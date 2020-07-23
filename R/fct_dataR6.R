DataChoice <- R6::R6Class("DataChoice",
                          public = list(
                            choice = NULL,
                            choice2 = NULL,
                            datachoice = NULL,
                            selected = function(){
                              self$choice = TRUE

                            },
                            notselected = function(){
                              self$choice = FALSE
                            },

                            impress = function(x){
                              self$choice2 = TRUE
                              self$datachoice = x
                              dates <- lubridate::round_date(as.POSIXct(x$time),"days")
                              imp <- x$impressions
                              new_df <- data.frame(dates, imp)
                              plot_df <- new_df%>% dplyr::group_by(dates)%>%dplyr::summarise(time = sum(imp))
                              ggplot2::ggplot(data= plot_df,ggplot2::aes(x = dates, y =time))+
                               ggplot2::geom_bar(stat="identity")
                            },
                            engage = function(x){
                              self$choice2 = TRUE
                              self$datachoice = x
                              dates <- lubridate::round_date(as.POSIXct(x$time),"days")
                              eng <- x$engagements
                              new_df <- data.frame(dates, eng)
                              plot_df <- new_df%>% dplyr::group_by(dates)%>%dplyr::summarise(time =sum(eng))
                              ggplot2::ggplot(data= plot_df,ggplot2::aes(x = dates, y =time))+
                                ggplot2::geom_bar(stat="identity")
                            },
                            retweet = function(x){
                              self$choice2 = TRUE
                              self$datachoice = x
                              dates <- lubridate::round_date(as.POSIXct(x$time),"days")
                              rt <- x$retweets
                              new_df <- data.frame(dates, rt)
                              plot_df <- new_df%>% dplyr::group_by(dates)%>%dplyr::summarise(time =sum(rt))
                              ggplot2::ggplot(data= plot_df,ggplot2::aes(x = dates, y =time))+
                                ggplot2::geom_bar(stat="identity")
                            },
                            like = function(x){
                              self$choice2 = TRUE
                              self$datachoice = x
                              dates <- lubridate::round_date(as.POSIXct(x$time),"days")
                              favs <- x$likes
                              new_df <- data.frame(dates, favs)
                              plot_df <- new_df%>% dplyr::group_by(dates)%>%dplyr::summarise(time =sum(favs))
                              ggplot2::ggplot(data= plot_df,ggplot2::aes(x = dates, y =time))+
                                ggplot2::geom_bar(stat="identity")
                            },
                            topimpress = function(x){
                              self$datachoice = x
                              top_df <- self$datachoice %>% dplyr::arrange(desc(self$datachoice$impressions))
                              DT::datatable(head(top_df,5))
                            },
                            topengage = function(x){
                              self$datachoice = x
                              top_df <- self$datachoice %>% dplyr::arrange(desc(self$datachoice$engagements))
                              DT::datatable(head(top_df,5))
                            },
                            topretweet = function(x){
                              self$datachoice = x
                              top_df <- self$datachoice %>% dplyr::arrange(desc(self$datachoice$retweets))
                              DT::datatable(head(top_df,5))
                            },
                            toplike = function(x){
                              self$datachoice = x
                              top_df <- self$datachoice %>% dplyr::arrange(desc(self$datachoice$likes))
                              DT::datatable(head(top_df,5))
                            }
                          ))






