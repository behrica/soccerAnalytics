library(RCurl)

countryStats <- function(country,games)  {
  results <- games[games$b_team_home==country | games$b_team_away==country ,c("b_team_home","b_team_away","r_goals_final_home","r_goals_final_away")]
  results <- results[complete.cases(results),]
  
  results$points_home<-sign(results$r_goals_final_home - results$r_goals_final_away)+1
  results$points_away<-sign(results$r_goals_final_away - results$r_goals_final_home)+1
  
  
  goals.home <- results[results$b_team_home==country,"r_goals_final_home"]
  goals.away <- results[results$b_team_away==country,"r_goals_final_away"]

  
  

  points.home <- results[results$b_team_home==country,"points_home"]
  points.away <- results[results$b_team_away==country,"points_away"]
  
  
  goals <- c(goals.away,goals.home)
  points <- factor(c(points.away,points.home),levels=c(0,1,2),labels = c("Lost","Draw","Won"))
  
  list(goals = goals,points=points)
}



