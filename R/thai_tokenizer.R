library(reticulate)

thai_tokenizer <- function(text, token_engine = "newmm", keep_whitespace = FALSE,
                           custom_dict = NULL) {
  if (!"pythainlp" %in% ls() ) {
    pythainlp<-import("pythainlp")
    cat("importing pythainlp... \n ")
  }
  lapply(text, function(x){
    tokens <- pythainlp$word_tokenize(x, engine = token_engine, keep_whitespace =  keep_whitespace,
                                      custom_dict = custom_dict)
    return(as.character(tokens))
  })
}
