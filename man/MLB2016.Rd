% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{MLB2016}
\alias{MLB2016}
\title{MLB2016.}
\format{A tibble with 20 variables:

\describe{
\item{\code{GameID}}{same format as Retrosheets and BaseballReference data}
\item{\code{EventDateTimeUTC}}{Time of the game in UTC}
\item{\code{EventDateTimeET}}{Time of the game in Eastern Standardtime}
\item{\code{AwayTeam}}{Team name of the Away Team}
\item{\code{HomeTeam}}{Team name of the Home Team}
\item{\code{DoubleHeaderGame}}{Indicates if this was a double Header}
\item{\code{AwayStartingPitcher}}{Starting pitcher Away Team}
\item{\code{HomeStartingPitcher}}{Starting pitcher Home Team}
\item{\code{FinalScoreAway}}{Runs scored by Away Team}
\item{\code{FinalScoreHome}}{Runs scored by Home Team}
\item{\code{EnteredDateTimeUTC}}{Time of the wager line in UTC}
\item{\code{EnteredDateTimeET}}{Time of the wager line in Eastern Standardtime}
\item{\code{SpreadTeam1}}{Spread Handicap for Away Team}
\item{\code{SpreadUS1}}{Spread US odds for Away Team}
\item{\code{SpreadUS2}}{Spread US odds for Home Team}
\item{\code{MoneyUS1}}{Moneyline US odds for Away Team}
\item{\code{MoneyUS2}}{Moneyline US odds for Home Team}
\item{\code{TotalPoints}}{Total runs handicap}
\item{\code{TotalUSOver}}{Total runs US odds for Over}
\item{\code{TotalUSUnder}}{Total runs US odds for Under}
}}
\usage{
MLB2016
}
\description{
Major League Baseball (MLB) data for the 2016 season.
}
\details{
All wagering lines from Pinnacle for the 2016  MLB season
}
\examples{
if (require("tidyverse")) {
library(tidyverse)
# What was the range of expected total runs according to the prediction market at Pinnacle?
MLB2016 \%>\% 
 unnest() \%>\% 
 group_by(GameID) \%>\% 
 arrange(desc(EnteredDateTimeUTC)) \%>\% 
 slice(1) \%>\% 
 ungroup() \%>\% 
 group_by(TotalPoints) \%>\% 
 summarize(Count = n())

# How many games went Over/Under/Landed on the total?
MLB2016 \%>\% 
 unnest() \%>\% 
 group_by(GameID) \%>\% 
 arrange(desc(EnteredDateTimeUTC)) \%>\% 
 slice(1) \%>\% 
 ungroup() \%>\% 
 select(GameID,TotalPoints,FinalScoreAway,FinalScoreHome) \%>\% 
 mutate(TotalOutcome = case_when(
   FinalScoreAway + FinalScoreHome > TotalPoints ~ "Over",
   FinalScoreAway + FinalScoreHome < TotalPoints ~ "Under",
   FinalScoreAway + FinalScoreHome == TotalPoints ~ "Landed"
 )
 ) \%>\% 
 group_by(TotalPoints,TotalOutcome) \%>\% 
 summarize(Count = n()) \%>\% 
 print(n=100)
}
}
\keyword{datasets}
