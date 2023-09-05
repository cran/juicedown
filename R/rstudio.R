preview <- function(input, ...) {
  convert(file = input, clip = FALSE, full_html = TRUE)
  htmlFile <- paste0(tools::file_path_sans_ext(input), ".html")
  message(
    "Preview output created: ", htmlFile, "\n",
    "CSS files used: \n", paste("  *", the$stylesheet, collapse = "\n")
  )

  message(
    "Please verify the final result on your CMS site.\n",
    "To produce the final result, run juicedown::convert() ",
    "in the console."
  )

  invisible(utils::browseURL(htmlFile))
}
