convert_markdown2html <- function(
    in_text, template = the$template, stylesheet = the$stylesheet) {

  template <- template %||% getOption("juicedown.template")
  stylesheet <- stylesheet %||% getOption("juicedown.article.css")

  tdir <- the$tempdir %||% tempdir()
  dir <- the$dir %||% tdir

  oopts_knit <- knitr::opts_knit$get()
  knitr::opts_knit$set(upload.fun = knitr::image_uri)
  on.exit(knitr::opts_knit$set(oopts_knit), add = TRUE)

  oopts_chunk <- knitr::opts_chunk$get()
  knitr::opts_chunk$set(eval = TRUE, echo = FALSE, fig.path = "figures/",
                        fig.cap = "")
  on.exit(knitr::opts_chunk$set(oopts_chunk), add = TRUE)

  intermediate_text <- knitr::knit(text = in_text, quiet = TRUE)

  # tweaks for math equations
  intermediate_text <- correct_equations_(intermediate_text)

  # Merge stylesheets and resolve CSS variables for :root.
  stylesheet <- css_find(stylesheet)
  combined_stylesheet <- tempfile(tmpdir = tdir, fileext = ".css")
  css_combine(stylesheet, file = combined_stylesheet)

  # Convert
  out <- markdown::mark(
    text = intermediate_text,
    output = NULL, format = "html",
    template = template,
    meta = list(css = combined_stylesheet,
                js = the$js,
                header_includes = the$header_includes,
                script = the$script),
    options = "-smartypants"
  )

  out <- gsub("<p>$$", "<p class=\"math\">$$", out, fixed = TRUE)
  out
}

