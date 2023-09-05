
#' List example files
#'
#' @description
#' List example files for the package. Show the path when the exact name is given.
#'
#' @details
#' The package sample files are organized under samples directory like so:
#'
#' samples/
#' |-- from-html/
#' |   `-- sample.html
#' `-- include/
#'     |-- pic/
#'     `-- sample.Rmd
#'
#' * `juicedown_example()` is equivalent to `ls samples`,
#' * `juicedown_example("from-html")` is to `ls samples/from-html`, and
#' * `juicedown_example("from-html", "sample.html")` shows the full path.
#'
#' @param name character. A single string for example name.
#' @param file character. A single string for the main file.
#'
#' @return character. A list of example files or a path string to each example file.
#' @export
#'
#' @examples
#' juicedown_example()
#' juicedown_example("from-html")
#' juicedown_example("from-html", "sample.html")
#'
juicedown_example <- function(name = NULL, file = NULL) {
  if (is.null(name)) {
    list.files(pkg_file("samples"))
  } else {
    if (is.null(file)) {
      list.files(pkg_file("samples", name))
    } else {
      pkg_file("samples", name, file)
    }
  }
}
