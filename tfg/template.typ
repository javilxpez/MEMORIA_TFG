// Plantilla de TFG — ETSIDI, Universidad Politécnica de Madrid.
// Reproduce el formato de los TFG de referencia en /examples:
// portada con logos, página de firmas, página del tribunal, preliminares en
// numeración romana, capítulos con cabecera "CAPÍTULO N. TÍTULO" y anexos.

#let fuente-serif = "New Computer Modern"
#let fuente-sans = "Liberation Sans"  // incluida en /fonts

#let _borrador = state("tfg-borrador", true)
#let _anexos = state("tfg-anexos", false)

// Nota de trabajo; sólo se muestra con `borrador: true`.
#let pendiente(cuerpo) = context {
  if _borrador.get() {
    block(
      width: 100%,
      inset: (x: 8pt, y: 6pt),
      radius: 2pt,
      fill: rgb("#fff6dc"),
      stroke: (left: 2pt + rgb("#d4a017")),
      text(size: 9pt, font: fuente-sans, fill: rgb("#5c4500"))[*Pendiente:* #cuerpo],
    )
  }
}

// Extensión objetivo de un capítulo; sólo se muestra con `borrador: true`.
#let extension(objetivo) = context {
  if _borrador.get() {
    align(right, text(size: 8.5pt, font: fuente-sans, fill: rgb("#7a7a7a"))[
      Extensión objetivo: #objetivo
    ])
  }
}

// Número del capítulo (o letra del anexo) vigente en `loc`.
#let _num-capitulo(loc) = {
  let n = counter(heading).at(loc).first()
  numbering(if _anexos.at(loc) { "A" } else { "1" }, n)
}

// Numeración "capítulo.n" para figuras, tablas y ecuaciones.
// Al empezar cada capítulo los contadores se fijan a `capítulo × 1000`
// (anexos: `(100 + letra) × 1000`), de modo que el número de capítulo viaja
// con el propio contador y las referencias y los índices lo muestran bien
// desde cualquier parte del documento.
#let _base-capitulo = 1000
#let _num-por-capitulo(formato) = n => {
  let cap = calc.quo(n, _base-capitulo)
  let i = calc.rem(n, _base-capitulo)
  let prefijo = if cap > 100 { numbering("A", cap - 100) } else { str(cap) }
  formato.replace("#", prefijo + "." + str(i))
}

#let _empieza-capitulo(pag) = query(heading.where(level: 1)).any(h => h.location().page() == pag)

#let _cabecera = context {
  let pag = here().page()
  let previos = query(heading.where(level: 1).before(here()))
  if not _empieza-capitulo(pag) and previos.len() > 0 {
    let h = previos.last()
    let etiqueta = if h.numbering == none { h.body } else {
      [#h.supplement #_num-capitulo(h.location()). #h.body]
    }
    set text(size: 9pt, style: "italic")
    grid(columns: (1fr, auto), upper(etiqueta), counter(page).display())
  }
}

#let _pie = context {
  if _empieza-capitulo(here().page()) {
    align(center, text(size: 10pt, counter(page).display()))
  }
}

#let _logos = grid(
  columns: (1fr, 1fr),
  align: (left + horizon, right + horizon),
  image("assets/logos/upm.png", height: 26mm), image("assets/logos/etsidi.png", height: 20mm),
)

#let _encabezado-institucional(m) = {
  set align(center)
  _logos
  v(12mm)
  text(13pt, upper(m.universidad))
  v(7mm)
  text(12pt, upper(m.escuela))
  v(7mm)
  text(12pt, m.grado)
  v(5mm)
  text(17pt, [TRABAJO FIN DE GRADO])
  v(14mm)
  block(width: 88%, text(13pt, weight: "bold", m.titulo))
}

#let _portada(m) = page(header: none, footer: none, margin: (x: 25mm, top: 20mm, bottom: 25mm))[
  #set text(font: fuente-sans)
  #set par(first-line-indent: 0pt, justify: false)
  #_encabezado-institucional(m)
  #v(12mm)
  #align(center, text(13pt)[Autor: #m.autor])
  #v(1fr)
  #let bloque(rol, p) = stack(spacing: 3mm, [#rol:], p.nombre, text(10pt, p.departamento))
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 10mm,
    if m.cotutor != none { bloque("Co-tutor", m.cotutor) }, bloque("Tutor", m.tutor),
  )
  #v(14mm)
  #align(right, text(11pt)[#m.ciudad, #m.fecha])
]

#let _pagina-firmas(m) = page(header: none, footer: none, margin: (x: 25mm, top: 20mm, bottom: 25mm))[
  #set text(font: fuente-sans)
  #set par(first-line-indent: 0pt, justify: false)
  #_encabezado-institucional(m)
  #v(20mm)
  #align(center, text(12pt)[Firma autor])
  #v(40mm)
  #grid(
    columns: (1fr, 1fr),
    align: center,
    if m.cotutor != none { text(12pt)[Firma co-tutor] }, text(12pt)[Firma tutor],
  )
]

#let _pagina-tribunal(m) = page(header: none, footer: none)[
  #set par(justify: true, first-line-indent: 0pt)
  #grid(
    columns: (auto, 1fr),
    column-gutter: 2mm,
    row-gutter: 3mm,
    [*Título:*], m.titulo,
    [*Autor:*], m.autor,
    [*Tutor:*], m.tutor.nombre,
    ..if m.cotutor != none { ([*Cotutor:*], m.cotutor.nombre) },
  )
  #v(18mm)
  #align(center, text(13pt, tracking: 2pt)[*EL TRIBUNAL*])
  #v(12mm)
  Presidente: \ \
  Vocal: \ \
  Secretario:
  #v(14mm)
  #h(1.5em) Realizado el acto de defensa y lectura del Trabajo Fin de Grado el día ……. de
  ……………….. de … en ............., en la #m.escuela de la #m.universidad,
  acuerda otorgarle la CALIFICACIÓN de:
  #v(28mm)
  #align(center)[VOCAL]
  #v(24mm)
  #grid(columns: (1fr, 1fr), align: (left, right), [SECRETARIO], [PRESIDENTE])
]

// Índice general, de figuras y de tablas.
#let indices() = {
  outline(title: [Índice general], depth: 3)
  outline(title: [Índice de figuras], target: figure.where(kind: image))
  outline(title: [Índice de tablas], target: figure.where(kind: table))
}

// Lista de acrónimos ordenada alfabéticamente.
// `entradas` es un diccionario sigla → significado.
#let tabla-acronimos(entradas) = {
  let claves = entradas.keys().sorted(key: lower)
  grid(
    columns: (auto, 1fr),
    column-gutter: 8mm,
    row-gutter: 0.9em,
    ..claves.map(k => (strong(k), entradas.at(k))).flatten(),
  )
}

// Cuerpo del trabajo: numeración arábiga y capítulos numerados.
#let cuerpo(doc) = {
  set page(numbering: "1")
  counter(page).update(1)
  set heading(numbering: "1.1.", supplement: [Capítulo])
  doc
}

// Anexos: capítulos con letra (Anexo A, B, …).
#let anexos(doc) = {
  _anexos.update(true)
  counter(heading).update(0)
  set heading(numbering: "A.1.", supplement: [Anexo])
  doc
}

#let tfg(
  titulo: none,
  autor: none,
  tutor: (nombre: none, departamento: none),
  cotutor: none,
  grado: [Grado en Ingeniería Electrónica Industrial y Automática],
  escuela: [Escuela Técnica Superior de Ingeniería y Diseño Industrial],
  universidad: [Universidad Politécnica de Madrid],
  ciudad: [Madrid],
  fecha: none,
  borrador: true,
  doc,
) = {
  let m = (
    titulo: titulo, autor: autor, tutor: tutor, cotutor: cotutor,
    grado: grado, escuela: escuela, universidad: universidad, ciudad: ciudad, fecha: fecha,
  )

  set document(title: titulo, author: autor)
  set text(font: fuente-serif, size: 11pt, lang: "es", region: "es")
  set page(
    paper: "a4",
    margin: (left: 35mm, right: 30mm, top: 30mm, bottom: 30mm),
    numbering: "i",
    header: _cabecera,
    footer: _pie,
  )
  set par(justify: true, first-line-indent: 1.5em, leading: 0.65em, spacing: 1.1em)
  set list(indent: 1em)
  set enum(indent: 1em)

  // Encabezados
  set heading(numbering: none)
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    context {
      let base = _base-capitulo * (counter(heading).get().first() + if _anexos.get() { 100 } else { 0 })
      for tipo in (image, table, raw) { counter(figure.where(kind: tipo)).update(base) }
      counter(math.equation).update(base)
    }
    set par(first-line-indent: 0pt, justify: false)
    v(18mm)
    if it.numbering != none {
      block(below: 8mm, text(size: 16pt, weight: "regular")[
        #it.supplement #context _num-capitulo(here())
      ])
    }
    block(below: 12mm, text(size: 22pt, weight: "bold", it.body))
  }
  show heading.where(level: 2): set text(size: 13pt)
  show heading.where(level: 2): set block(above: 1.8em, below: 1em)
  show heading.where(level: 3): set text(size: 11.5pt)
  show heading.where(level: 3): set block(above: 1.5em, below: 0.9em)

  // Figuras, tablas y ecuaciones numeradas por capítulo
  set figure(numbering: _num-por-capitulo("#"))
  set figure.caption(separator: [: ])
  show figure.where(kind: table): set figure.caption(position: top)
  set math.equation(numbering: _num-por-capitulo("(#)"))

  // Índices
  show outline.entry.where(level: 1): it => {
    if it.element.func() != heading { return it }
    v(1.1em, weak: true)
    strong(it)
  }

  _borrador.update(borrador)
  _portada(m)
  _pagina-firmas(m)
  _pagina-tribunal(m)
  doc
}
