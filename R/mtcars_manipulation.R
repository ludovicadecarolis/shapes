###average of miles per gallons (mpg) grouped by cylinders (cyl)
#' @export
#' @import dplyr
average_mpg<-function(tbl){
tbl%>%
  group_by(cyl)%>%
  summarise(average_mpg=mean(mpg))
}
