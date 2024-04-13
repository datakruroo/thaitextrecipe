
thai_tokenizer <- function(x, token_engine = "newmm", keep_whitespace = FALSE, custom_dict = NULL) {
  library(reticulate)
  pythainlp <- import("pythainlp")
  
  # Use lapply to apply the word_tokenize to each element in the text vector
  tokens_list <- lapply(x, function(text) {
    tokens <- pythainlp$word_tokenize(text, engine = token_engine, keep_whitespace = keep_whitespace,
                                      custom_dict = custom_dict)
    return(as.character(tokens))
  })
  return(tokens_list)
}