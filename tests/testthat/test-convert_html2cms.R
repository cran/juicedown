test_that("convert_html2cms", {
  res <- convert_html2cms(
    in_text = readLines(pkg_file("samples/from-html/sample.html"), warn = FALSE),
    full_html = FALSE, tag = "article", remove_script = FALSE)
  expected_result <- c(
    "<article><h1 style=\"color: blue;\">Hello, juicedown</h1>",
    "<p class=\"big\" style=\"font-size: 200%;\">This is a big paragraph.</p>",
    "<p class=\"small\" style=\"font-size: 70%;\">Here's the small paragraph.</p>",
    "<h2 style=\"color: gray;\">Bye</h2></article>"
  )
  expect_equal(res, expected_result)
})
