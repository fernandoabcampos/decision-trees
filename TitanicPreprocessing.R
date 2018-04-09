library(stringi)
Sys.getlocale("LC_CTYPE")
stri_trans_general(not_adult$AGE, 'latin')
stri_encode(not_adult$AGE, from = "UTF-16LE", to = "UTF-8")
head(not_adult)
Encoding("ñ")
stri_enc_detect(not_adult$AGE)

all(stri_enc_isutf8(not_adult$AGE))

stri_enc_mark(df$AGE)

not_adult <- stri_encode(not_adult, "", "UTF-8")

blab <- stri_trans_general(not_adult$AGE, "UTF-8")
blab











iconv(not_adult$AGE, to="ASCII//TRANSLIT")

library(stringi)
stri_enc_mark(not_adult$AGE)
stri_enc_mark(df$AGE)
#To check whether each string consists of valid UTF-8 byte sequences, call:
all(stri_enc_isutf8(not_adult$AGE))


#If it is not the case, then your file is not in UTF-8 at all.
#I suspect that you haven't instructed R while reading the file that it is indeed in UTF-8 (it should suffice to look at the contents of poli.dt$word to verify this statement). If my guess is true, try:


df$AGE <- stri_encode(df$AGE, "", "UTF-8") # re-mark encodings
#If data.table still complains about the "mixed" encodings, you may want to transliterate the non-ASCII characters, e.g.:

stri_trans_general("Zażółć gęślą jaźń", "Latin-ASCII")
## [1] "Zazolc gesla jazn"