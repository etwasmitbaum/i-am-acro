#import "acronym.typ": *

#let acronyms = (
  key1: (
    en: (
      short: "srt",
      short-pl: "srts",
      long: "long",
      long-pl: "long-pl",
    ),
    de: (
      short: "krz",
      short-pl: "krzs",
      long: "lang",
      long-pl: "lang-pl",
    ),
  ),
  key2: (
    en: (
      short: "srt2",
      short-pl: "srts2",
      long: "long2",
      long-pl: "long-pl2",
    ),
    fr: (
      short: "krz2",
      short-pl: "krzs2",
      long: "lang2",
      long-pl: "lang-pl2",
    ),
  ),
)
#acronyms

#pagebreak()


#init-acronyms(acronyms, "en")
#print-acronyms()

#ac("key1")


//#acronyms
