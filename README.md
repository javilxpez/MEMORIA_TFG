# TFG y artículo — actuador de ganancia variable

Documentos en [Typst](https://typst.app) (≥ 0.15).

| Carpeta | Contenido |
|---|---|
| `tfg/` | Memoria del TFG (formato ETSIDI-UPM) |
| `paper/` | Artículo para *Intelligent Computing* (pendiente) |
| `shared/` | Bibliografía (`refs.bib`) y figuras comunes a ambos documentos |
| `fonts/` | Liberation Sans (OFL) para la portada; así se compila igual en cualquier equipo |
| `examples/` | TFG de referencia en PDF (no versionados) |

## Compilar

```sh
./build.sh          # → build/tfg.pdf
./build.sh watch    # recompila al guardar
```

Hay que compilar con `--root .` desde la raíz (lo hace `build.sh`) para que el TFG pueda leer `/shared`.
En VS Code con Tinymist, configurar `tinymist.rootPath` a la raíz del repositorio y añadir `fonts` a `tinymist.fontPaths`.

## TFG

El proceso para completar la memoria está en [tfg/CHECKLIST.md](tfg/CHECKLIST.md).

- Metadatos (título, autor, tutores, fecha) en `tfg/main.typ`.
- `borrador: true` muestra las notas `#pendiente[...]` y la extensión objetivo de cada capítulo; poner `false` para la versión final.
- Figuras, tablas y ecuaciones se numeran por capítulo (3.1, 3.2…; en anexos A.1…). Se referencian con etiquetas: `<fig-...>` y `@fig-...`.

### Extensión objetivo

Basada en los tres TFG de referencia (126–147 páginas en total; cuerpo de 84–118 páginas; 33–54 referencias):

| Parte | Ejemplos (págs.) | Objetivo |
|---|---|---|
| Preliminares (portada → acrónimos) | 24–26 | ~20–25 |
| 1. Introducción | 2–3 | 2–3 |
| 2. Estado del arte | 8–9 | 8–10 |
| 3. Marco teórico | 16–43 | 15–20 |
| 4. Diseño del sistema | 20–56 * | 25–30 |
| 5. Implementación y validación | — * | 12–18 |
| 6. Resultados experimentales | 4–34 * | 15–20 |
| 7. Conclusiones y desarrollos futuros | 3–4 | 3–4 |
| Bibliografía | 4–5 | 30–50 referencias |
| Anexos | 15–20 | 10–20 |
| **Total** | **126–147** | **~120–140** |

\* Los ejemplos reparten de forma distinta el desarrollo y los resultados; la suma de desarrollo y resultados está entre 54 y 63 páginas.
