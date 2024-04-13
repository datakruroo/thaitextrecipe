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

## ตัวอย่างการใช้งาน 1
## without custom_dict
text1 <-  "เมื่อปรับการจัดการเรียนรู้ ผลสัมฤทธิ์ของผู้เรียนมีแนวโน้มเพิ่มขึ้นอย่างมีนัยสำคัญทางสถิติ"
text2 <- "ที่ผ่านมาคะแนนผลสอบมาตรฐานระดับประเทศของนักเรียนในโรงเรียนของประเทศมีแนวโน้มลดลงอย่างต่อเนื่องอยู่แล้ว"
thai_tokenizer(text1, token_engine = "longest")
[[1]]
 [1] "เมื่อ"     "ปรับ"     "การ"     "จัดการ"   "เรียนรู้"   "ผลสัมฤทธิ์" "ของ"     "ผู้เรียน"   "มีแนวโน้ม" "เพิ่มขึ้น"   "อย่าง"    "มีนัย"    
[13] "สำคัญ"    "ทาง"     "สถิติ" 

thai_tokenizer(text2, token_engine = "longest")
[[1]]
 [1] "ที่ผ่านมา"  "คะแนน"   "ผลสอบ"   "มาตรฐาน" "ระดับ"    "ประเทศ"  "ของ"     "นักเรียน"  "ใน"      "โรงเรียน" "ของ"     "ประเทศ" 
[13] "มีแนวโน้ม" "ลดลง"    "อย่าง"    "ต่อเนื่อง"  "อยู่แล้ว" 

## with custom_dict
### prepare dict
my_edustat_dict <- c("ผลสัมฤทธิ์","แนวโน้ม","นัยสำคัญทางสถิติ","O-NET","ผลสอบมาตรฐาน")
my_dict <- custom_dict(my_edustat_dict, include_pythaidict = T)
thai_tokenizer(text1, token_engine = "newmm", custom_dict = my_dict)
[[1]]
 [1] "เมื่อ"          "ปรับ"          "การ"          "จัด"           "การเรียนรู้"     "ผลสัมฤทธิ์"      "ของ"          "ผู้เรียน"       
 [9] "มีแนวโน้ม"      "เพิ่มขึ้น"        "อย่าง"         "มี"            "นัยสำคัญทางสถิติ"
 
thai_tokenizer(text2, token_engine = "newmm", custom_dict = my_dict)
[[1]]
 [1] "ที่ผ่านมา"       "คะแนน"        "ผลสอบมาตรฐาน" "ระดับ"         "ประเทศ"       "ของ"          "นักเรียน"       "ใน"          
 [9] "โรงเรียน"      "ของ"          "ประเทศ"       "มีแนวโน้ม"      "ลดลง"         "อย่าง"         "ต่อเนื่อง"       "อยู่แล้ว"      

## ตัวอย่างการใช้งาน 2 : การใช้งานร่วมกับ textrecipes ใน tidymodels 
train_data <- data.frame(
  label = c("Positive", "Negative"),
  answers = c("เมื่อปรับการจัดการเรียนรู้ ผลสัมฤทธิ์ของผู้เรียนมีแนวโน้มเพิ่มขึ้นอย่างมีนัยสำคัญทางสถิติ",
              "ที่ผ่านมาคะแนนผลสอบมาตรฐานระดับประเทศของนักเรียนในโรงเรียนของประเทศมีแนวโน้มลดลงอย่างต่อเนื่องอยู่แล้ว"),
  student_id = c(1, 2)
)

textrec<- recipe(label ~ . , data=train_data)  %>% 
            step_tokenize(answers, custom_token = thai_tokenizer,
                                    options = list(token_engine = "longest", 
                                    keep_whitespace = TRUE,
                                    custom_dict = my_dict))

textrec %>% prep() %>% juice()
# A tibble: 2 × 3
      answers student_id label   
    <tknlist>      <dbl> <fct>   
1 [16 tokens]          1 Positive
2 [16 tokens]          2 Negative

textrec %>% show_tokens(answers)
[[1]]
 [1] "เมื่อ"     "ปรับ"     "การ"     "จัดการ"   "เรียนรู้"   " "       "ผลสัมฤทธิ์" "ของ"     "ผู้เรียน"   "มีแนวโน้ม" "เพิ่มขึ้น"   "อย่าง"   
[13] "มีนัย"     "สำคัญ"    "ทาง"     "สถิติ"    

[[2]]
 [1] "ที่ผ่านมา"       "คะแนน"        "ผลสอบมาตรฐาน" "ระดับ"         "ประเทศ"       "ของ"          "นักเรียน"       "ใน"          
 [9] "โรงเรียน"      "ของ"          "ประเทศ"       "มีแนวโน้ม"      "ลดลง"         "อย่าง"         "ต่อเนื่อง"       "อยู่แล้ว" 
}
