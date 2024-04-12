\name{custom_dict}
\alias{custom_dict}
\title{custom_dict() function}
\usage{
custom_dict(my_dict, include_pythaidict = TRUE)
}
\arguments{
\item{my_dict}{character vector ที่สมาชิกเป็นคำศัพท์ของ custom dictionary}
\item{include_pythaidict}{หากกำหนดเป็น TRUE จะรวมคำศัพท์จาก pythai dictionary ด้วย}
}
\description{

ฟังก์ชัน custom_dict() ใช้สร้าง custom dictionary ผลลัพธ์ที่ได้จะเป็น Tries structure ใช้ร่วมกับฟังก์ชันตัดคำ thai_tokenizer()
}

\examples{
## prerequisite
ติดตั้งและเรียกใช้ pythainlp ก่อนใช้งาน
reticulate::py_install("pythainlp")

## ตัวอย่างการใช้งาน 1
text <- 'ส่วนเบี่ยงเบนมาตรฐานใช้วัดการกระจายสัมบูรณ์ แต่ สัมประสิทธิ์การแปรผันใช้วัดการกระจายสัมพัทธ์'
extent_dict <- c("ส่วนเบี่ยงเบนมาตรฐาน","การกระจายสัมบูรณ์","การกระจายสัมพัทธ์","สัมประสิทธิ์การแปรผัน")

thai_tokenizer(text)
[[1]]
 [1] "ส่วน"      "เบี่ยงเบน"  "มาตรฐาน"  "ใช้"       "วัด"       "การ"      "กระจาย"
 [8] "สัมบูรณ์"    " "        "แต่"       " "        "สัมประสิทธิ์" "การ"      "แปรผัน"
[15] "ใช้"       "วัด"       "การ"      "กระจาย"   "สัมพัทธ์"

thai_tokenizer(text, custom_dict = custom_dict(extent_dict))
[[1]]
[1] "ส่วนเบี่ยงเบนมาตรฐาน" "ใช้"                "วัด"                "การกระจายสัมบูรณ์"
[5] "แต่"                "สัมประสิทธิ์การแปรผัน"  "ใช้"                "วัด"
[9] "การกระจายสัมพัทธ์"

}
