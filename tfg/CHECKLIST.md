# Checklist para completar el TFG

El trabajo técnico (PCB, montaje mecánico, *firmware* y campañas de medida) está terminado; lo que queda es redactar la memoria a partir del esqueleto de `tfg/`. Marca cada casilla (`- [x]`) a medida que avances.

Referencias de extensión: los tres TFG de `examples/` tienen 126–147 páginas, 35.000–39.000 palabras y 33–54 referencias. La extensión objetivo de cada capítulo aparece en el propio PDF mientras `borrador: true`, y la tabla completa está en el [README](../README.md).

---

## 1. Datos de portada

En `tfg/main.typ`:

- [ ] Título definitivo, acordado con el tutor (debe coincidir con el título registrado).
- [ ] Nombre y departamento del tutor y del co-tutor (o `cotutor: none` si no hay).
- [ ] Fecha (`fecha: [mes de año]`) de la convocatoria de defensa.

## 2. Reunir el material existente

Antes de escribir, junta todo lo producido durante el proyecto. Cada elemento de esta lista acaba en una figura, tabla o anexo.

- [ ] Esquemáticos, capas de la PCB y BOM exportados desde la herramienta de diseño (PDF/SVG).
- [ ] Capturas del modelo CAD y planos de las piezas.
- [ ] Código del *firmware* (y enlace a su repositorio, si lo tiene).
- [ ] Fotos de la PCB fabricada, del montaje mecánico y del sistema completo.
- [ ] Datos y resultados de la calibración de cada sensor.
- [ ] *Dataset* de las campañas de medida y los *scripts* de análisis.
- [ ] *Datasheets* de los componentes y sensores empleados.
- [ ] Notas, diagramas y decisiones de diseño (por qué se eligió cada componente o solución).
- [ ] Todo copiado a `tfg/figures/` (o a `shared/figures/` si también va al artículo).

## 3. Bibliografía

- [ ] Recuperar las fuentes ya consultadas durante el proyecto: artículos, libros, *datasheets* y notas de aplicación.
- [ ] Completar con búsqueda bibliográfica para el estado del arte.
- [ ] Gestor de referencias (p. ej. Zotero + Better BibTeX) exportando a `shared/refs.bib`, y citar en el texto con `@clave`.
- [ ] Objetivo: 30–50 referencias (sólo aparecen en la bibliografía las citadas).

## 4. Orden de redacción recomendado

Empezar por lo que describe el trabajo hecho, que es lo que mejor conoces y para lo que ya tienes el material, y dejar los capítulos "de marco" para el final:

1. **Diseño del sistema** (cap. 4)
2. **Implementación y validación** (cap. 5)
3. **Resultados experimentales** (cap. 6)
4. **Marco teórico** (cap. 3): sólo la teoría que usan los capítulos 4–6.
5. **Estado del arte** (cap. 2)
6. **Conclusiones** (cap. 7), **Introducción** (cap. 1), **Resumen/Abstract** y **Agradecimientos**

## 5. Capítulo a capítulo

Cada sección tiene una nota `Pendiente` con lo que debe contener. Al completarla, borra la nota.

### Cap. 4 — Diseño del sistema (25–30 págs.)
- [ ] Tabla de requisitos y especificaciones (magnitudes, rangos, resolución, frecuencia de muestreo).
- [ ] Diagrama de bloques de la arquitectura.
- [ ] Diseño mecánico: piezas, capturas del modelo CAD y justificación de las decisiones.
- [ ] Diseño electrónico: selección de componentes justificada, acondicionamiento de cada sensor, esquemático por bloques y criterios de *layout*.
- [ ] *Firmware*: arquitectura, diagramas de flujo, temporización y formato de los datos.
- [ ] Esquemáticos completos y BOM en el Anexo A; planos en el Anexo B; código en el Anexo C.

### Cap. 5 — Implementación y validación (12–18 págs.)
- [ ] Fotos de la PCB fabricada y del montaje.
- [ ] Procedimiento y resultados de calibración de cada sensor (gráfica y recta/curva de ajuste con su error).
- [ ] Validación: ruido, resolución efectiva y frecuencia de muestreo real alcanzada.
- [ ] Problemas encontrados durante el montaje y cómo se resolvieron.

### Cap. 6 — Resultados experimentales (15–20 págs.)
- [ ] Protocolo de ensayo descrito de forma que otra persona pueda repetirlo.
- [ ] Descripción del *dataset* (variables, unidades, formato, volumen y dónde está).
- [ ] Gráficas fuerza–posición y caracterización de la ganancia variable.
- [ ] Comparación con el modelo del cap. 3 y discusión de las limitaciones.
- [ ] Gráficas secundarias en el Anexo D (los ejemplos dedican 15–20 páginas).

### Cap. 3 — Marco teórico (15–20 págs.)
- [ ] Modelo del mecanismo: transmisión *capstan*, ganancia variable en función del ángulo y modelo del brazo tipo palanca.
- [ ] Fundamentos de cada medida (fuerza, posición, corriente) y de la adquisición digital.
- [ ] Cada ecuación importante debe reaparecer en los capítulos 4–6.

### Cap. 2 — Estado del arte (8–10 págs.)
- [ ] Las cuatro secciones del esqueleto, cada una apoyada en referencias.
- [ ] Cerrar el capítulo situando este trabajo respecto a lo existente (qué aporta).

### Cap. 7 — Conclusiones (3–4 págs.)
- [ ] Repasar uno a uno los objetivos del cap. 1 e indicar si se han cumplido.
- [ ] Desarrollos futuros concretos.

### Cap. 1 — Introducción (2–3 págs.)
- [ ] Motivación con una foto del actuador.
- [ ] Objetivos revisados para que coincidan con lo realmente hecho.
- [ ] "Estructura del documento" actualizada si cambian los capítulos.

### Preliminares
- [ ] Resumen (≈1 página) y Abstract con el mismo contenido, más palabras clave / *keywords*. Sustituir los textos provisionales.
- [ ] Lista de acrónimos (`frontmatter/acronimos.typ`) con todos los que aparecen en el texto y ninguno más.
- [ ] Agradecimientos (opcional).

## 6. Figuras, tablas y ecuaciones

- [ ] Gráficas en formato vectorial (SVG o PDF) cuando sea posible; fotos en JPG/PNG con resolución suficiente.
- [ ] Gráficas de resultados regeneradas desde el *dataset* con un estilo uniforme (tamaño de letra, colores, ejes con magnitud y unidades).
- [ ] Cada figura, tabla y ecuación relevante lleva etiqueta (`<fig-...>`, `<tab-...>`, `<eq-...>`) y se cita en el texto (`@fig-...`) **antes** de aparecer.
- [ ] Pies de figura descriptivos; las figuras tomadas de otras fuentes llevan su cita en el pie.

## 7. Revisión con el tutor

- [ ] Enviar cada capítulo al terminarlo (PDF de `build/`), sin esperar a tener la memoria entera.
- [ ] Anotar los comentarios recibidos y resolverlos antes de pasar al siguiente capítulo.
- [ ] Versión completa al tutor con margen suficiente antes del depósito para una última ronda.

## 8. Revisión final antes del depósito

- [ ] `grep -rn "#pendiente" tfg/` no devuelve nada.
- [ ] `borrador: false` en `tfg/main.typ`.
- [ ] Compila sin avisos (`./build.sh`). Typst da error si una referencia o cita no existe.
- [ ] Extensión: `pdfinfo build/tfg.pdf | grep Pages` y `pdftotext build/tfg.pdf - | wc -w` dentro de lo esperado.
- [ ] Índices de figuras y tablas completos y con pies coherentes.
- [ ] Ortografía y gramática revisadas (corrector en español, términos en inglés en cursiva: `_firmware_`).
- [ ] Unidades del SI, coma decimal coherente en todo el texto y notación uniforme en las ecuaciones.
- [ ] Resumen y Abstract coinciden con el contenido final.
- [ ] Portada, página de firmas y página del tribunal con los datos correctos.
- [ ] Revisión antiplagio si la universidad la exige.
- [ ] PDF final generado y guardado con el nombre que pida la normativa.

## 9. Defensa

- [ ] Presentación preparada a partir de las figuras de la memoria.
- [ ] Demostración o vídeo del sistema funcionando, si es viable.
- [ ] Ensayo de la exposición en el tiempo asignado.
