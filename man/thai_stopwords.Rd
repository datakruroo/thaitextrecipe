\name{thai_stopwords}
\alias{thai_stopwords}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
thai_stopwords() function
}
\description{
ชุดข้อมูล stop words ภาษาไทย จาก PyThaiNLP
}
\usage{
thai_stopwords()
}
%- maybe also 'usage' for other objects documented here.

\details{
ฟังก์ชันจะให้ผลลัพธ์เป็น tibble ที่มี 2 คอลัมน์ได้แก่ word เก็บ stop words ภาษาไทย และ lexicon คือชื่อพจนาณุกรมของ stop words ในตอนนี้เป็นพจนานุกรมจาก PyThaiNLP
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
th_stopwords <- thai_stopwords()
th_stopwords
# A tibble: 6 × 2
  word    lexicon  
  <chr>   <chr>    
1 กระผม   PyThaiNLP
2 อย่างใด  PyThaiNLP
3 เป็นที่    PyThaiNLP
4 แล้วเสร็จ PyThaiNLP
5 ก็จะ     PyThaiNLP
6 ทั้ง      PyThaiNLP
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
