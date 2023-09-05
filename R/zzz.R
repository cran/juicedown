.onLoad <- function(libname, pkgname) {
  op <- options()
  op.juicedown <- list(
    juicedown.template = pkg_file("xml", "template.html"),
    juicedown.article.css = pkg_file("css", "article.scss"),
    juicedown.div.css = pkg_file("css", "div.scss")
  )
  toset <- !(names(op.juicedown) %in% names(op))
  if (any(toset)) options(op.juicedown[toset])

  invisible()
}

.onAttach <- function(libname, pkgname) {
  # packageStartupMessage("Welcome to juicedown")
}
