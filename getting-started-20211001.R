
# http://nickstrayer.me/datadrivencv/

# setup -------------------------------------------------------------------

library(tidyverse)

# shout out to [this commenter](https://github.com/nstrayer/datadrivencv/issues/9#issuecomment-821840970)
# remotes::install_github('mitchelloharawild/icons@v0.1.0')

devtools::install_github("nstrayer/datadrivencv")

library(datadrivencv)

PATH <- getwd()
PATH_OUT <- str_c(PATH, "/OUT")

# running this will overwrite all my files with default names in this directory, beware
# datadrivencv::use_datadriven_cv(
#   full_name = "Jacob Eliason",
#   data_location = "https://docs.google.com/spreadsheets/d/1XIW0Dl4PT6uPTHl8WjU0iXlIhCGcCLGJCIVBBcQChJ4/edit?usp=sharing",
#   pdf_location = "https://github.com/eliason-j/resume/jacob-eliason-resume.pdf",
#   html_location = "jacobeliason.com/resume/",
#   source_location = "https://github.com/eliason-j/resume"
# )
