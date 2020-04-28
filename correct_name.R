correct_name <- function(x) {
    if (length(x)>2) {
        name <- paste(x[1],x[3], sep = "") %>% paste(x[2], sep = "-")
    }
    else {
        name <- paste(x[1], x[2], sep = "-")
    }
    name
}