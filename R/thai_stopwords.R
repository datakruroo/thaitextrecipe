
thai_stopwords <- function(){
  suppressPackageStartupMessages(library(dplyr))
  if (!"pythainlp" %in% ls() ) {
    library(reticulate)
    pythainlp<-import("pythainlp")
  }
  
thai_stopword_fn <- "
def thai_stopword():
  import pythainlp
  stopword = pythainlp.corpus.thai_stopwords() ## frozenset
  stopword = list(stopword)
  return stopword
"
py_run_string(thai_stopword_fn)
th_stopwords <- tibble(word = py$thai_stopword(), lexicon = "PyThaiNLP")
return(th_stopwords)

}