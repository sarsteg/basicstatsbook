#' Run a tutorial from the basicstatsbook package
#' @param name The tutorial name
#' @export
run_tutorial <- function(name) {
     tutorials <- learnr::available_tutorials(package = "basicstatsbook")$name

     if (!(name %in% tutorials)) {
          stop(glue::glue(
               "The tutorial '{name}' was not found. Use basicstatsbook::list_tutorials() to see available options."
          ))
     }

     config_path <- system.file("www/_brand.yaml", package = "basicstatsbook")

     learnr::run_tutorial(
          name = name,
          package = "basicstatsbook",
          config = config_path
     )
}


#' List available tutorials in the basicstatsbook package
#' @export
list_tutorials <- function() {
     dplyr::as_tibble(
          learnr::available_tutorials(package = "basicstatsbook")[, c("name", "title")]
     )
}
