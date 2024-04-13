\name{thai_tokenizer}
\alias{thai_tokenizer}
\title{thai_tokenizer() function}
\usage{
thai_tokenizer(text, token_engine = "newmm", keep_whitespace = FALSE)
}
\arguments{
\item{text}{ข้อความที่ต้องการตัดคำ}
\item{token_engine}{เครื่องมือตัดคำ ค่าเริ่มต้นคือ "newmm" ผู้วิเคราะห์สามารถเปลี่ยนได้ตามเครื่องมือที่มีให้เลือกใช้ใน pythainlp}
\item{keep_whitespace}{ถ้าเป็น TRUE จะเก็บช่องว่างไว้ด้วย ถ้าเป็น FALSE จะตัดช่องว่างออก}
\item{custom_dict}{สำหรับระบุ custom dictionary เพิ่มเติมโดยผู้วิเคราะห์ โดยสามารถสร้างผ่านฟังก์ชัน custom_dict() พิมพ์ ?custom_dict() เพื่อดูรายละเอียด}
}
\description{

tokenizer สำหรับภาษาไทย โดยใช้เครื่องมือจาก library-pythainlp สามารถใช้เป็น custom_token บนฟังก์ชัน step_tokenize() ของ library-textrecipes ได้

ในกรณีใช้เป็น custom_token บน step_tokenize() ผู้วิเคราะห์สามารถปรับแต่ง argument ของฟังก์ชันนี้ผ่าน options ของ step_tokenize() ดูวิธีการใช้ได้ในตัวอย่าง

ตัวเลือกสำหรับ token_engine

- "newmm" ใช้ Maximum Matching algorithm สำหรับตัดคำ ค่าเริ่มต้น

- "newmm-safe" ใช้ Maximum Matching algorithm สำหรับตัดคำ และตัดคำที่ไม่มีใน dictionary ออก

- "longest" ใช้ Longest Matching algorithm สำหรับตัดคำ

- "attacut" ใช้ \href{https://github.com/PyThaiNLP/attacut}{Attacut}
algorithm สำหรับตัดคำ

- "deepcut" ใช้ \href{https://github.com/rkcosmos/deepcut}{Deepcut} algorithm สำหรับตัดคำ

... และอื่นๆ ที่มีให้เลือกใน pythainlp

}
\examples{
## prerequisite
ติดตั้งและเรียกใช้ pythainlp ก่อนใช้งาน
reticulate::py_install("pythainlp")

## ตัวอย่างการใช้งาน 1
text <- 'ส่วนเบี่ยงเบนมาตรฐานใช้วัดการกระจายสัมบูรณ์ แต่ สัมประสิทธิ์การแปรผันใช้วัดการกระจายสัมพัทธ์'
thai_tokenizer(text)
[[1]]
 [1] "ส่วน"      "เบี่ยงเบน"  "มาตรฐาน"  "ใช้"       "วัด"       "การ"      "กระจาย"
 [8] "สัมบูรณ์"    " "        "แต่"       " "        "สัมประสิทธิ์" "การ"      "แปรผัน"
[15] "ใช้"       "วัด"       "การ"      "กระจาย"   "สัมพัทธ์"

thai_tokenizer(text, keep_whitespace = TRUE)
[[1]]
 [1] "ส่วน"      "เบี่ยงเบน"  "มาตรฐาน"  "ใช้"       "วัด"       "การ"      "กระจาย"   "สัมบูรณ์"
 [9] " "        "แต่"       " "        "สัมประสิทธิ์" "การ"      "แปรผัน"    "ใช้"       "วัด"
[17] "การ"      "กระจาย"   "สัมพัทธ์"

## ตัวอย่างการใช้งาน 2 : การใช้งานร่วมกับ step_tokenize() บน library-recipes
### 2.1 ตัวอย่างข้อมูล
train_data <- data.frame(
  label = c("Positive", "Negative"),
  answers = c("นี่คือตัวอย่างข้อความภาษาไทยที่ต้องการตัดคำ", "อีกหนึ่งตัวอย่างข้อความที่ใช้สำหรับการทดสอบ"),
  student_id = c(1, 2)
)
### 2.2 recipe pre-processing
textrec<- recipe(label ~ . , data=train_data) %>%
  step_tokenize(answers, custom_token = thai_tokenizer,
                options = list(token_engine = "longest", 
                               keep_whitespace = TRUE))
textrec %>% prep() %>% juice()
# A tibble: 2 × 3
     answers student_id label   
   <tknlist>      <dbl> <fct>   
1 [9 tokens]          1 Positive
2 [9 tokens]          2 Negative
}


