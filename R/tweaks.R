
#' Hide H2 heading for Moodle LMS
#'
#' You may want the title of the article to be different from the title of the
#' resource. Call this function in a code chunk somewhere in your R Markdown file.
#'
#' @return Script block that makes H2 head of the content invisible.
#' @export
tweak_moodle_heading <- function() {
  js <- "<script>
    document.querySelector('#maincontent+h2').style.display = 'none';
  </script>"
  the$script <- c(the$script, js)
  invisible()
}


#' Highlight target link for footnotes
#'
#' Footnote highlighting is corrupt when CSS is in-lined. Fix this by
#' calling this function in a code chunk somewhere in your R Markdown file.
#'
#' @return Script block that makes highlighting possible.
#' @export
#'
tweak_footnote_highlight <- function() {
  js <- str_glue("<script>
    var link = document.createElement('link');
    link.setAttribute('rel', 'stylesheet');
    link.setAttribute('href', '{const$juicedown_css_footnote}');
    document.head.appendChild(link);
  </script>")
  the$script <- c(the$script, js)
  invisible()
}
