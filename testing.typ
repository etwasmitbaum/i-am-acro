#import "i-am-acro.typ": *

/////////////////////////////////////////////
/// This document is used for manual testing
/// of the package.
/////////////////////////////////////////////

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
  key2: (
    en: (
      short: "srt2",
      short-pl: "srts2",
      long: "long2",
      long-pl: "long-plural2",
    ),
    de: (
      short: "krz2",
      short-pl: "krzs2",
      long: "lang2",
      long-pl: "lang-plural2",
    ),
  ),
  key3: (
    fr: (
      // leave empty to test for errors
    ),
    en: (short: ""),
  ),
  key4: (
    en: (
      short: "k4",
      long: "key4",
    ),
    //de: (
    //  short: "k4",
    //  long: "kurz4",
    //),
  ),
)
#acronyms

#let language-mapping = (
  en: [englisch],
  de: [deutsch],
  fr: "französisch",
)

#pagebreak()


#init-acronyms(acronyms, "en", language-display: language-mapping, always-link: true)
#print-acronyms()

== Language: en
#table(
  columns: 4,
  table.header([command], [long shown], [output], [expected]),
  [ac("LED")], [false], [#ac("LED")], [Light Emitting Diode (LED)],
  [ac("LED")], [true], [#ac("LED")], [LED],
  [acp("LED")], [false #update-acronym-long-shown("LED", false)], [#acp("LED")], [Light Emitting Diodes (LEDs)],
  [acp("LED")], [true], [#acp("LED")], [LEDs],
  [], [], [], [],
  [acs("LED")], [true], [#acs("LED")], [LED],
  [acs("LED")], [false #update-acronym-long-shown("LED", false)], [#acs("LED")], [LED],
  [acsp("LED")], [false #update-acronym-long-shown("LED", false)], [#acsp("LED")], [LEDs],
  [acsp("LED")], [true #update-acronym-long-shown("LED", true)], [#acsp("LED")], [LEDs],
  [], [], [], [],
  [acl("LED")], [false #update-acronym-long-shown("LED", false)], [#acl("LED")], [Light Emitting Diode],
  [acl("LED")], [true #update-acronym-long-shown("LED", true)], [#acl("LED")], [Light Emitting Diode],
  [aclp("LED")], [false #update-acronym-long-shown("LED", false)], [#aclp("LED")], [Light Emitting Diodes],
  [aclp("LED")], [true #update-acronym-long-shown("LED", true)], [#aclp("LED")], [Light Emitting Diodes],
  [], [], [], [],
  [ac-suffix("LED", "Case")],
  [false #update-acronym-long-shown("LED", false)],
  [#ac-suffix("LED", "Case")],
  [Light Emitting Diode(LED)-Case],

  [ac-suffix("LED", "Case")], [true], [#ac-suffix("LED", "Case")], [LED-Case],

  [ac-suffix("LED", "Case",  plural: true)],
  [false #update-acronym-long-shown("LED", false)],
  [#ac-suffix("LED", "Case", plural: true)],
  [Light Emitting Diodes(LEDs)-Case],

  [ac-suffix("LED", "Case",  plural: true)], [true], [#ac-suffix("LED", "Case", plural: true)], [LEDs-Case],
  [], [], [], [],
  [ac-custom("LED", "Custom LED",  "Custom Light Emitting Diode")],
  [false #update-acronym-long-shown("LED", false)],
  [#ac-custom("LED", "Custom LED", "Custom Light Emitting Diode")],
  [Custom Light Emitting Diode (Custom LED)],

  [ac-custom("LED", "Custom LED",  "Custom Light Emitting Diode")],
  [true ],
  [#ac-custom("LED", "Custom LED", "Custom Light Emitting Diode")],
  [Custom LED],

  [ac-custom("LED", "Custom LED",  "Custom Light Emitting Diode", suffix: "Case")],
  [false #update-acronym-long-shown("LED", false)],
  [#ac-custom("LED", "Custom LED", "Custom Light Emitting Diode", suffix: "Case")],
  [Custom Light Emitting Diode(Custom LED)-Case],

  [ac-custom("LED", "Custom LED",  "Custom Light Emitting Diode", suffix: "Case")],
  [true],
  [#ac-custom("LED", "Custom LED", "Custom Light Emitting Diode", suffix: "Case")],
  [Custom LED-Case],
)

== Language: de
#update-acro-lang("de")
#update-acronym-used("LED", false)
#update-acronym-long-shown("LED", false)
#table(
  columns: 4,
  table.header([command], [long shown], [output], [expected]),
  [ac("LED")], [false], [#ac("LED")], [Leuchtdiode (LED)],
  [ac("LED")], [true], [#ac("LED")], [LED],
  [acp("LED")], [false #update-acronym-long-shown("LED", false)], [#acp("LED")], [Leuchtdioden (LEDs)],
  [acp("LED")], [true], [#acp("LED")], [LEDs],
  [], [], [], [],
  [acs("LED")], [true], [#acs("LED")], [LED],
  [acs("LED")], [false #update-acronym-long-shown("LED", false)], [#acs("LED")], [LED],
  [acsp("LED")], [false #update-acronym-long-shown("LED", false)], [#acsp("LED")], [LEDs],
  [acsp("LED")], [true #update-acronym-long-shown("LED", true)], [#acsp("LED")], [LEDs],
  [], [], [], [],
  [acl("LED")], [false #update-acronym-long-shown("LED", false)], [#acl("LED")], [Leuchtdiode],
  [acl("LED")], [true #update-acronym-long-shown("LED", true)], [#acl("LED")], [Leuchtdiode],
  [aclp("LED")], [false #update-acronym-long-shown("LED", false)], [#aclp("LED")], [Leuchtdioden],
  [aclp("LED")], [true #update-acronym-long-shown("LED", true)], [#aclp("LED")], [Leuchtdioden],
  [], [], [], [],
  [ac-suffix("LED", "Gehäuse")],
  [false #update-acronym-long-shown("LED", false)],
  [#ac-suffix("LED", "Gehäuse")],
  [Leuchtdiode(LED)-Gehäuse],

  [ac-suffix("LED", "Gehäuse")], [true], [#ac-suffix("LED", "Gehäuse")], [LED-Gehäuse],

  [ac-suffix("LED", "Gehäuse",  plural: true)],
  [false #update-acronym-long-shown("LED", false)],
  [#ac-suffix("LED", "Gehäuse", plural: true)],
  [Leuchtdioden(LEDs)-Gehäuse],

  [ac-suffix("LED", "Gehäuse",  plural: true)], [true], [#ac-suffix("LED", "Gehäuse", plural: true)], [LEDs-Gehäuse],
)

== Language: mixed (en, de)
#update-acro-lang("en")
#update-acronym-used("LED", false)
#update-acronym-long-shown("LED", false)
#table(
  columns: 4,
  table.header([command], [long shown], [output], [expected]),
  [ac("LED")], [false], [#ac("LED")], [Light Emitting Diode (LED)],
  [ac("LED", lang: "de")], [true], [#ac("LED", lang: "de")], [LED],
  [acp("LED")], [false #update-acronym-long-shown("LED", false)], [#acp("LED")], [Light Emitting Diodes (LEDs)],
  [acp("LED", lang: "de")], [true], [#acp("LED", lang: "de")], [LEDs],
  [], [], [], [],
  [acs("LED")], [true], [#acs("LED")], [LED],
  [acs("LED", lang: "de")], [false #update-acronym-long-shown("LED", false)], [#acs("LED", lang: "de")], [LED],
  [acsp("LED")], [false #update-acronym-long-shown("LED", false)], [#acsp("LED")], [LEDs],
  [acsp("LED", lang: "de")], [true #update-acronym-long-shown("LED", true)], [#acsp("LED", lang: "de")], [LEDs],
  [], [], [], [],
  [acl("LED")], [false #update-acronym-long-shown("LED", false)], [#acl("LED")], [Light Emitting Diode],
  [acl("LED", lang: "de")], [true #update-acronym-long-shown("LED", true)], [#acl("LED", lang: "de")], [Leuchtdiode],
  [aclp("LED")], [false #update-acronym-long-shown("LED", false)], [#aclp("LED")], [Light Emitting Diodes],
  [aclp("LED", lang: "de")], [true #update-acronym-long-shown("LED", true)], [#aclp("LED", lang: "de")], [Leuchtdioden],
  [], [], [], [],
  [ac-suffix("LED", "Gehäuse")],
  [false #update-acronym-long-shown("LED", false)],
  [#ac-suffix("LED", "Gehäuse")],
  [Light Emitting Diode(LED)-Gehäuse],

  [ac-suffix("LED", "Gehäuse", lang: "de")], [true], [#ac-suffix("LED", "Gehäuse", lang: "de")], [LED-Gehäuse],

  [ac-suffix("LED", "Gehäuse",  plural: true)],
  [false #update-acronym-long-shown("LED", false)],
  [#ac-suffix("LED", "Gehäuse", plural: true)],
  [Light Emitting Diodes(LEDs)-Gehäuse],

  [ac-suffix("LED", "Gehäuse",  plural: true, lang: "de")],
  [true],
  [#ac-suffix("LED", "Gehäuse", plural: true, lang: "de")],
  [LEDs-Gehäuse],

  [ac("LED", second-lang: "de")],
  [false #update-acronym-long-shown("LED", false)],
  [#ac("LED", second-lang: "de")],
  [Light Emitting Diode (LED, deutsch: Leuchtdiode)],

  [ac("LED")\ second default-lang = "de"],
  [false #update-acronym-long-shown("LED", false) #update-acro-second-lang("de")],
  [#ac("LED")],
  [Light Emitting Diode (LED, deutsch: Leuchtdiode)],

  [acp("LED")\ second default-lang = "de"],
  [false #update-acronym-long-shown("LED", false) #update-acro-second-lang("de")],
  [#acp("LED")],
  [Light Emitting Diodes (LED, deutsch: Leuchtdioden)],

  [acp("LED")\ second default-lang = "de"],
  [true #update-acronym-long-shown("LED", true) #update-acro-second-lang("de")],
  [#acp("LED")],
  [LEDs],

  [acp("key4")\ second default-lang = "de"],
  [false #update-acronym-long-shown("key4", false) #update-acro-second-lang("de")],
  [#acp("key4")],
  [key4s (k4s)],
)

#update-acronym-long-shown("key4", false)
#ac("key4")
