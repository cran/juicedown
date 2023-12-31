% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert.R
\name{convert}
\alias{convert}
\title{Converts R Markdown file into HTML fragment with inline styles}
\usage{
convert(
  file = NULL,
  dir = NULL,
  tag = NULL,
  id = NULL,
  clip = TRUE,
  full_html = NULL,
  remove_script = NULL,
  stylesheet = NULL,
  template = NULL
)
}
\arguments{
\item{file}{character. Path to the (R)markdown file.}

\item{dir}{character. Output directory.}

\item{tag}{character. Surrounding tag for the HTML block, "article" and "div"
are allowed.}

\item{id}{character. ID attribute for the surrounding tag.}

\item{clip}{logical. Whether or not copy the result to clipboard. Ignored
(set to FALSE) if \code{full_html = TRUE}. Default is TRUE.}

\item{full_html}{logical. Produce the complete HTML or HTML block only?}

\item{remove_script}{logical. Whether or not remove script tags. Ignored
(set to FALSE) if \code{full_html = TRUE}.}

\item{stylesheet}{character. Paths to the CSS files used in markdown::mark()}

\item{template}{character. Path to the template used in markdown::mark()}
}
\value{
Invisibly returns a character vector identical to the result file.
}
\description{
This function facilitates writing contents in R Markdown formats for CMS the
source editor of which silently removes style tags. When run interactively,
the resulting HTML code will be copied to the clipboard.

It basically does three things:
\enumerate{
\item it converts (R) Markdown file into a HTML file with
\code{\link[knitr:knit]{knitr::knit()}} + \code{\link[markdown:mark]{markdown::mark()}},
\item embed CSS information in style atribute with \code{\link[juicyjuice:css_inline]{juicyjuice::css_inline()}},
and then
\item extracts article/div element that is ready for copying and pasting into
CMS's source editor.
}
}
\section{Details}{
\subsection{Change default behaviors with \code{\link[=options]{options()}}}{

Currently, three global defaults are available. You can set these defaults to
alter the appearance of the result.
\itemize{
\item \code{juicedown.template}: Defaults to \code{juicedown:::pkg_file("xml", "template.html")}
\item \code{juicedown.article.css}: Defaults to \code{juicedown:::pkg_file("css", "article.scss")}
\item \code{juicedown.div.css}: \code{juicedown:::pkg_file("css", "div.scss")}
}
}

\subsection{Priority order}{

You can pass conversion parameters in function argument and YAML metadata
(under \code{juicedown} key) and for some parameters, global options, with priority
given in that order. For instance, if the \code{stylesheet} parameter exists in the
function call, it is used. If not and if YAML metadata has stylesheet key
under juicedown key, then that will be used. In the below example, some.css
used.

\if{html}{\out{<div class="sourceCode markdown">}}\preformatted{---
juicedown:
  stylesheet:
     some.css
---
}\if{html}{\out{</div>}}

If neither the function argument nor missing YAML metadata exist, then
the global option (such as \code{juicedown.article.css}) will be used.
}
}

\examples{
file <- juicedown_example("markdown", "sample.md")
tdir <- tempdir()
convert(file, dir = tdir, clip = FALSE)
unlink(file.path(tdir, "sample.html"))
}
