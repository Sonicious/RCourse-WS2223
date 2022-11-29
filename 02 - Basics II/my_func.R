func01 <- function() {
  x <- 3
  nestedfun <- function() {
    return(3 + x)
  }
  return(nestedfun())
}
