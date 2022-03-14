# This script builds both the HTML and PDF versions of your CV

# If you wanted to speed up rendering for googlesheets driven CVs you could use
# this script to cache a version of the CV_Printer class with data already
# loaded and load the cached version in the .Rmd instead of re-fetching it twice
# for the HTML and PDF rendering. This exercise is left to the reader.

# Knit the HTML version
format_date <- stringr::str_remove_all(lubridate::today()-1,"-")

rmarkdown::render(
  "cv.rmd",
  params = list(pdf_mode = FALSE),
  output_file = paste0(getwd(),"/html-versions/","cv-",format_date,".html")
)

# knit the PDF version to temporary html location
# note: this render stop breaks if the google sheet text includes non-linked parentheticals
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render(
  "cv.rmd",
  params = list(pdf_mode = FALSE),
  output_file = tmp_html_cv_loc
)

# Convert to PDF using Pagedown
pagedown::chrome_print(
  input = tmp_html_cv_loc,
  output = paste0(getwd(), "/pdf-versions/","jacob-eliason-cv-",format_date,".pdf")
)

# Save a separate copy for the repo
file.copy(paste0(getwd(), "/pdf-versions/","jacob-eliason-cv-",format_date,".pdf"), 
          paste0(getwd(), "/", "jacob-eliason-cv.pdf"), 
          overwrite = T)

# copy html to website ---------------------------------------------------------

# need a version called index.html
file.copy(paste0(getwd(),"/html-versions/","cv-",format_date,".html"), 
          paste0(getwd(),"/index.html"), 
          overwrite = T)

# set up strings
current_folder <- getwd()
list_of_files <- c("index.html", "resume.css", "dd_cv.css")
new_folder <- stringr::str_c(stringr::str_replace(getwd(), "resume", "jacobeliason-dot-com"), "/content/cv/")

# move to website repo
file.copy(file.path(current_folder,list_of_files), new_folder, overwrite = T)
