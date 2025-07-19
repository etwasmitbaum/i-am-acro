#import "@preview/tidy:0.4.3"
#import "@preview/codly:1.3.0": *
#import "i-am-acro.typ": *

#set heading(numbering: "1.1")
#show heading: it => {
  // hide numbering for deeper levels, but keep numbering for refs
  if it.level >= 3 {
    it.body
    linebreak()
  } else {
    it
  }
}
#show: codly-init.with()

#let docs = tidy.parse-module(read("i-am-acro.typ"), name: "i-am-acro")

#align(center, text(size: 32pt)[i-am-acro])

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
#import "acronym.typ": * // import everything
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
#figure(
  ```typ
  #let language-display = (
    en: [english],
    de: [german]
  )
  ```,
) <code_fullExampleLanguageDisplay>

After that we pass this to the package and set the configuration.
#figure(
  ```typ
  #init-acronyms(
    acronyms,
    "en",
    language-display: language-display,
    default-second-lang: "de",
    always-link: true
  )
  ```,
)<code_fullExampleInitAcronym>

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
As seen before you can set a default second language using the `init-acronyms` function.
This is implemented so you can have those two languages shown for an acronym if they work in both languages.
There are some examples in german and english like "IR" which is "infrared" in english and "Infrarot" in german.
Both is commom to be used in german.

This package will automatically show the second langaue of such words, when the `default-second-lang` parameter is given.
The long form of the second language will be shown with the first long form of the default language.\
Important here is the `language-display` parameter.
This will define how the second language is displayed when needed.

Let's see an example:

#update-acronym-used("LED", false)
#update-acronym-long-shown("LED", false)

#ac("LED")

The acronym "LED" was displayed using `#ac("LED")`, since the default second langaue is given from before (see @code_fullExampleInitAcronym) the german version is also shown.
The text `german:` was given by setting the `language-display` parameter accordinly (see @code_fullExampleLanguageDisplay).

== Print custom acronym table <printCustomAcronymTable>
You can simply import the internal variables `_acroyms`, `_always-link` and `LABEL_KEY` to the stored acroynms with their states.
With them you can create your implementation of an acronym table.
The example below shows how it could be done.
It is important to provide the correct labels.
If `always-link` is set to true the labels must be of this scheme "`LABEL_KEY + KEY`" where `LABEL_KEY` is a contant of this package and `KEY` is the key of the printed acronym.


NOTE: It is not possible to sort by content.
If you want to sort the arconyms by their short definition, they all need to be strings.

```typ
#import "acronym.typ": * // import all or only needed

#context {
  // Get the final states of all acronyms
  let final-acronyms = _acronyms.final()
  // get the default language to display the long forms
  let default-lang-final = _default-lang.get()
  // prepare dictionary where all acroyns to be displayed are stored
  let printable-acronyms = (:)

  // Itterate over all acroynms and filter them
  for (key, (value, used, long-shown)) in final-acronyms {
    if used {
      // extract only used acronyms with their default-lang short and long form
      let short-long = (value.at(default-lang-final).short, value.at(default-lang-final).long)
      printable-acronyms.insert(str(key), short-long)
    }
  }

  // Sort by key, it is not possible to sort by content (the short definition).
  printable-acronyms = printable-acronyms.pairs().sorted(key: it => it.at(0))

  // Display acronyms
  grid(
    columns: (auto, 1fr),
    row-gutter: 1em,
    column-gutter: 2em,
    [*Acronym*], [*Definition*],
    ..{
      for (key, value) in printable-acronyms {
        (
          [#value.at(0) #if _always-link.final() { label(LABEL_KEY + key) }],
          [#value.at(1)],
        )
      }
    },
  )
}
```

The result looks like this:

#context {
  // Get the final states of all acronyms
  let final-acronyms = _acronyms.final()

  // get the default language to display the long forms
  let default-lang-final = _default-lang.get()

  // prepare dictionary where all acroyns to be displayed are stored
  let printable-acronyms = (:)

  // Itterate over all acroynms and filter them
  for (key, (value, used, long-shown)) in final-acronyms {
    if used {
      // extract only used acronyms with their default-lang short and long form
      let short-long = (value.at(default-lang-final).short, value.at(default-lang-final).long)
      printable-acronyms.insert(str(key), short-long)
    }
  }

  // Sort by key, it is not possible to sort by content (the short definition).
  printable-acronyms = printable-acronyms.pairs().sorted(key: it => it.at(0))

  // Display acronyms
  grid(
    columns: (auto, 1fr),
    row-gutter: 1em,
    column-gutter: 2em,
    //fill: (green, blue), // great for debugging
    [*Acronym*], [*Definition*],
    ..{
      for (key, value) in printable-acronyms {
        (
          [#value.at(0)],
          [#value.at(1)],
        )
      }
    },
  )
}

This is very similar to using `print-acronyms` (well it is what i came up with).
I expect you to implement your own display of the acronyms to fit the design of your document.
This is simply an example of how it could be done.

#pagebreak(weak: true)
= Full package documentation <full-package-docs>
#tidy.show-module(docs, style: tidy.styles.default)
