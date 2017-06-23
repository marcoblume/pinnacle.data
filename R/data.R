#' MLB2016.
#'
#' MLB data 2016.
#'
#' All wagering lines from Pinnacle for the 2016  MLB season
#'
#' @import tibble
#'
#' @format A data frame with 14 variables:
#' \describe{
#' \item{\code{BaseballRefID}{same format as Retrosheets and BaseballReference data}
#' \item{\code{EventDateTimeEst}}{Time of the game in UTC}
#' \item{\code{AwayTeam}}{Team name of the Away Team}
#' \item{\code{HomeTeam}}{Team name of the Home Team}
#' \item{\code{AwayStartingPitcher}}{Starting pitcher Away Team}
#' \item{\code{HomeStartingPicher}}{Starting pitcher Home Team}
#' \item{\code{FinalScoreAway}}{Runs scored by Away Team}
#' \item{\code{FinalScoreHome}}{Runs scored by Home Team}
#' \item{\code{EnteredDateTime}}{Time of the wager line in UTC}
#' \item{\code{SpreadTeam1}}{Spread Handicap for Away Team}
#' \item{\code{SpreadUS1}}{Spread US odds for Away Team}
#' \item{\code{SpreadUS2}}{Spread US odds for Home Team}
#' \item{\code{MoneyUS1}}{Moneyline US odds for Away Team}
#' \item{\code{MoneyUS2}}{Moneyline US odds for Home Team}
#' \item{\code{TotalPoints}}{Total runs handicap}
#' \item{\code{TotalUSOver}}{Total runs US odds for Over}
#' \item{\code{TotalUSUnder}}{Total runs US odds for Under}
#' }
"MLB2016"


#' USA_Election_2016
#'
#' US Presidential Election data 2016.
#'
#' All lines from Pinnacle for the 2016 US Presidential Election
#'
#' @format A data frame with 12 variables:
#' \describe{
#' \item{\code{EnteredDateTime}}{Time of the wager line in UTC}
#' \item{\code{TeamName1}}{Team name of the Away Team}
#' \item{\code{TeamName2}}{Team name of the Home Team}
#' \item{\code{SpreadTeam1}}{Spread Handicap for Away Team}
#' \item{\code{SpreadUS1}}{Spread US odds for Away Team}
#' \item{\code{SpreadUS2}}{Spread US odds for Home Team}
#' \item{\code{MoneyUS1}}{Moneyline US odds for Away Team}
#' \item{\code{MoneyUS2}}{Moneyline US odds for Home Team}
#' \item{\code{TotalPoints}}{Total runs handicap}
#' \item{\code{TotalUSOver}}{Total runs US odds for Over}
#' \item{\code{TotalUSUnder}}{Total runs US odds for Under}
#' }
"USA_Election_2016"
