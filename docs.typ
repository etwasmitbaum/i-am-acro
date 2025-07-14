#import "@preview/tidy:0.4.3"
#import "@preview/codly:1.3.0": *
#import "acronym.typ": *

#set heading(numbering: "1.1")
#show: codly-init.with()

#let docs = tidy.parse-module(read("acronym.typ"), name: "i-am-acro")

#outline(depth: 3)
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
  PLC: (
    en: (
      short: [PLC],
      short-pl: [PLCs],
      long: [Programmable Logic Controller],
      long-pl: [Programmable Logic Controllers],
    ),
    de: (
      short: [SPS],
      short-pl: [SPSen],
      long: [Speicherprogrammierbare Steuerung],
      long-pl: [Speicherprogrammierbare Steuerungen],
    ),
  ),
  AC: (
    en: (
      short: [AC],
      long: [Acronym],
    ),
    de: (
      short: [AC],
      long: [Acronym],
    ),
  ),
)
#let language-display = (
  en: [english],
  de: [german],
)
#init-acronyms(acronyms, "en", always-link: false)

= User Guide
== Quick start
First import the package and define your acronyms in a dictionary like this:
```typ
TODO: #import "acronym.typ": *
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

Then pass the definitions to the package, set the default language and choose whether you want labels to be created between the acronyms and where they are printed (using `print-acronyms`):
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
This will show a configuration showing every possible feature used.

First we create langauge "en" (english) and "de" (german) using the acronyms LED and PLC.
For PLC all possible variations are defined.
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
  PLC: (
    en: (
      short: [PLC],
      short-pl: [PLCs],
      long: [Programmable Logic Controller],
      long-pl: [Programmable Logic Controllers],
    ),
    de: (
      short: [SPS],
      short-pl: [SPSen],
      long: [Speicherprogrammierbare Steuerung],
      long-pl: [Speicherprogrammierbare Steuerungen],
    ),
  ),
  AC: (
    en: (
      short: [AC],
      long: [Acronym],
    ),
    de: (
      short: [AC],
      long: [Acronym],
    ),
  ),
)
```

After that we should define how other languages are written out, in case the second language gets used. See @howDoesSecondLangWork for more details.
```typ
#let language-display = (
  en: [english],
  de: [german]
)
```

After that we pass this to the package and set the configuration.
```typ
#init-acronyms(
  acronyms,
  "en",
  language-display: language-display,
  default-second-lang: "de",
  always-link: true
)
```
// reinit the package here with default second lang
#init-acronyms(
  acronyms,
  "en",
  language-display: language-display,
  default-second-lang: "de",
  always-link: true,
)

Now we are ready to use out arconyms!
The order of operation here is important, since showing the acronym will change its state.
So the long form only gets shown the first time or when specifically requested.
#table(
  columns: (auto, 1fr),
  table.header([*Command*], [*Output*]),
  [`#ac("LED")`], [#ac("LED")],

  [`#ac("LED")`], [#ac("LED")],

  [`#acl("LED")`], [#acl("LED")],

  [`#acl("LED", lang: "de")`], [#acl("LED", lang: "de")],

  [`#acs("PLC")`], [#acs("PLC")],

  [`#ac("PLC")`], [#ac("PLC")],
)

We can also mark acronyms as used or unsed, even if we did not use them.
Also we can make the package believe the long version was shown (or not) before.
Marking an ancronym as used will make it appear in the acronym table.
```typ
#update-acronym-used("AC", true)
#update-acronym-long-shown("AC", true)
```
#update-acronym-used("AC", true)
#update-acronym-long-shown("AC", true)

Lastly (or firstly, if you prefer it in your document) we print all used acronyms.
```typ
#print-acronyms()
```
// We have to use out acronyms here, so the used flag gets set.
// With this flag #print-acronyms() will create the required label
#print-acronyms()


== How does the second language work? <howDoesSecondLangWork>
TODO

== Print custom acronym table <printCustomAcronymTable>
TODO
It is not possible to sort by content.
If you want to sort the arconyms by their short definition, they all need to be strings.


#pagebreak(weak: true)
= Full package documentation <full-package-docs>
#set heading(numbering: none) // turn off numbering for tidy docs
#tidy.show-module(docs, style: tidy.styles.default)
