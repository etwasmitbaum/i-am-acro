
#let _acronyms = state("_acronyms", none)
#let _default-lang = state("_default-lang", none)
#let _always-link = state("_always-link", true)

#let LABEL_KEY = "acronymlinks-"

// TODO create command to display "Polyurethan(PU)-Schaum" correctly

// TODO create command to display custom form of acronym -> function with custom long and short form but store the usage correctly. So you can display a acronym for the first time (with custom ending for exmaple) and it is remembered as already shown

#let init-acronyms(acronyms, default-lang) = {
  _default-lang.update(default-lang)

  let data = (:)
  for (key, value) in acronyms {
    // map key to its value (lang and short/long; used; long-shown)
    data.insert(key, (value: value, used: true, long-shown: false))
  }

  _acronyms.update(data)
}

#let display-text(key, text, do-link) = {
  if do-link {
    link(label(LABEL_KEY + key), text)
  }
}

#let ac(key, lang: none) = {
  context {
    let selected-lang = if lang == none { _default-lang.final() } else { lang }
    let selected-acro = _acronyms.get().at(key)

    if selected-acro.long-shown == false {
      display-text(key, selected-acro.value.at(_default-lang.final()).short, _always-link.final())
    }
  }
}


#let print-acronyms(create-labels: true) = {
  context {
    let final-acronyms = _acronyms.final()
    let printable-acronyms = (:)
    let default-lang-final = _default-lang.final()

    for (key, (value, used, long-shown)) in final-acronyms {
      if used {
        // extract only used acronyms with their default-lang short and long form
        let short-long = (value.at(default-lang-final).short, value.at(default-lang-final).long)
        printable-acronyms.insert(str(key), short-long)
      }
    }


    grid(
      columns: (1fr, 1fr),
      fill: (green, blue),
      ..{
        for (key, value) in printable-acronyms {
          (
            [#value.at(0) #if create-labels { label(LABEL_KEY + key) }],
            [#value.at(0)],
          )
        }
      },
    )
  }
}
