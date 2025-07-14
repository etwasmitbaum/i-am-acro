#import "@preview/tidy:0.4.3"
#import "acronym.typ": *

#set heading(numbering: "1.1")

#let docs = tidy.parse-module(read("acronym.typ"), name: "i-am-acro")

#outline()
#pagebreak(weak: true)

#let acronyms = (
  LED: (
    en: (
      short: [LED],
      short-pl: [LEDs],
      long: [Light Emitting Diode],
    ),
    de: (
      short: "LED",
      long: "Leuchtdiode",
      long-pl: "Leuchtdioden",
    ),
  ),
)
#init-acronyms(acronyms, "en", always-link: false)

= User Guide
== Quick start
First define your acronyms in a dictionary like this:
```typ
#let acronyms = (
  LED: (
    en: (
      short: [LED],
      short-pl: [LEDs],
      long: [Light Emitting Diode],
    ),
    de: (
      short: "LED",
      long: "Leuchtdiode",
      long-pl: "Leuchtdioden",
    ),
  ),
)
```

Then pass the definition to the package, set the default language and choose whether you want to labels to be created between the acronyms where they are printed (using `print-acronyms`):
```typ
#init-acronyms(acronyms, "en", always-link: false)
```

Now you can use your acronyms!
- `#ac("LED")` -> #ac("LED")
- `#ac("LED")` -> #ac("LED")
- `#acl("LED")` -> #acl("LED")
- `#acl("LED", lang: "de")` -> #acl("LED", lang: "de")

For all possible acronym functions see @full-package-docs.

== Full example using everything
TODO

== How does the second language work?
TODO

== Print custom acronym table <printCustomAcronymTable>
TODO

#pagebreak(weak: true)
= Full package documentation <full-package-docs>
#set heading(numbering: none) // turn off numbering for tidy docs
#tidy.show-module(docs, style: tidy.styles.default)
