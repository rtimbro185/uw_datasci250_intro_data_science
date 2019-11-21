# KMeansNorm.R

KMeansNorm <- function(observations = sampleObservations, clusterCenters = centersGuess, normD1 = F, normD2 = F)
{
  if (normD1)
  {
    # Determine mean and standard deviation of 1st dimension (column) in observations
    #TODO - Code
    
    
    # normalize (z-normalize) 1st dimension (column) of observations
    #TODO - Code
    
    
    # normalize (z-normalize) 1st dimension (column) of clusterCenters (mean)
    #TODO - Code
    
  }
  if (normD2)
  {
    # Determine mean and standard deviation of 2nd dimension in observations
    #TODO - Code
    
    # normalize (z-normalize) 2nd dimension (column) of observations
    #TODO - Code
    
    # normalize (z-normalize) 2nd dimension (column) of clusterCenters
    #TODO - Code
    
  }
  clusterCenters <- KMeans(observations, clusterCenters)
  if (normD1)
  {
    # denormalize in first dimension
    #TODO - Code
  } 
  if (normD2)
  {
    # denormalize in second dimension
    #TODO - Code
  } 
  return(clusterCenters)
}

