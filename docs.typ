#import "@preview/tidy:0.4.3"

#let docs = tidy.parse-module(read("acronym.typ"))
#tidy.show-module(docs, style: tidy.styles.default)