
custom_dict <- function(my_dict, include_pythaidict = TRUE){
if (!"pythainlp" %in% ls() ) {
    library(reticulate)
    pythainlp<-import("pythainlp")
}

if (include_pythaidict == TRUE) {
mythaiword_fn <- "
def mythaiword():
  import pythainlp
  thaiword = pythainlp.corpus.thai_words() ## frozenset
  thaiword = list(thaiword)
  return thaiword
"
py_run_string(mythaiword_fn)
thai_words <- py$mythaiword()
custom_dict <- trie <- pythainlp$util$Trie(c(my_dict, thai_words))
}
else {
custom_dict <- trie <- pythainlp$util$Trie(my_dict)
}
return(custom_dict)
}

