path <- "~/Munzert Dropbox/Simon Munzert/github/hertie-ai-certificate/modul-2-daten/deepRstudioSimon"
devtools::install(path)
library(deepRstudio)



convert_ipynb(input, output = xfun::with_ext(input, "Rmd"))
