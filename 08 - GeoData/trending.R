# dauert ca. 3-4h oder mehr
trend_raster <- function()
{
  trend_ras<-rast(resolution=c(0.25,0.25), xmin=-0.125, xmax=359.875, ymin=-90.125, ymax=90.125)
  for (lat in 1:length(t2m_nc_lat))
  {
    for (lon in length(t2m_nc_lon))
    {
      temperature <- ncvar_get(t2m_nc, "t2m",
        start=c(lon,lat,1,1),
        count=c(1,1,1,501))
      time_series<- tibble(temperature=temperature, month=1:501)
      model <- lm(temperature~month, time_series)
      trend <- coefficients(model)[2]
      trend_ras[lat,lon] = trend
    }
  }
  return(trend_ras)
}

# geht schneller
trend_raster_simple <- function()
{
  trend_ras<-rast(resolution=c(2,2), xmin=-1, xmax=359, ymin=-91, ymax=91)
  for (lat in 1:91)
  {
    for (lon in 1:180)
    {
      temperature <- ncvar_get(t2m_nc, "t2m",
                               start=c(8*lon,8*lat-7,1,1),
                               count=c(1,1,1,501))
      time_series<- tibble(temperature=temperature, month=1:501)
      model <- lm(temperature~month, time_series)
      trend <- coefficients(model)[2]
      trend_ras[lat,lon] = trend
    }
  }
  return(trend_ras)
}
