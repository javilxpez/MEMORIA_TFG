// Compilar con ./build.sh desde la raíz del repositorio, o:
//   typst compile --root . --font-path fonts tfg/main.typ build/tfg.pdf
#import "template.typ": *

#show: tfg.with(
  titulo: [Diseño e implementación de un sistema de adquisición de datos para un actuador de ganancia variable basado en _capstan drive_],
  autor: "Javier López Morales",
  tutor: (nombre: [Nombre del tutor], departamento: [Departamento de Ingeniería Eléctrica, Electrónica, Automática y Física Aplicada]),
  cotutor: (nombre: [Nombre del co-tutor], departamento: [Departamento / grupo]),
  fecha: [mes de año],
  // Cambiar a `false` para ocultar notas "Pendiente" y extensiones objetivo.
  borrador: true,
)

#include "frontmatter/agradecimientos.typ"
#include "frontmatter/resumen.typ"
#include "frontmatter/abstract.typ"
#indices()
#include "frontmatter/acronimos.typ"

#show: cuerpo
#include "chapters/01-introduccion.typ"
#include "chapters/02-estado-del-arte.typ"
#include "chapters/03-marco-teorico.typ"
#include "chapters/04-diseno.typ"
#include "chapters/05-implementacion.typ"
#include "chapters/06-resultados.typ"
#include "chapters/07-conclusiones.typ"

#bibliography("/shared/refs.bib", title: [Bibliografía], style: "ieee")

#show: anexos
#include "appendices/a-electronica.typ"
#include "appendices/b-planos.typ"
#include "appendices/c-firmware.typ"
#include "appendices/d-graficas.typ"
