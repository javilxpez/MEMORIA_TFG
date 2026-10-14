#import "../template.typ": *

= Introducción <cap-introduccion>
#extension[2–3 páginas]

== Motivación del proyecto

#pendiente[Contexto: robots que comparten espacio con personas necesitan brazos ligeros e intrínsecamente seguros. Los miembros biológicos lo consiguen con ventaja mecánica variable (el brazo de momento del músculo cambia con la postura). Presentar el actuador de ganancia variable basado en _capstan drive_ y la necesidad de datos experimentales para caracterizarlo. Incluir una foto del actuador (Figura 1.1).]

== Objetivos

El objetivo principal de este trabajo es diseñar e implementar un sistema de adquisición de datos que permita caracterizar experimentalmente un actuador de ganancia variable basado en _capstan drive_. Para ello se plantean los siguientes objetivos específicos:

- Diseñar y fabricar una PCB dedicada para la adquisición de datos del actuador (sensores de fuerza, posición angular y corriente del motor).
- Realizar el diseño mecánico necesario para el montaje e integración del sistema de medida con el actuador.
- Integrar y acondicionar los sensores para la medición de la fuerza de actuación y la posición del brazo.
- Desarrollar el _firmware_ de adquisición y registro de datos en tiempo real.
- Ejecutar campañas de medida para caracterizar la relación entre la posición del brazo, la ganancia del mecanismo y la fuerza de actuación.
- Analizar los datos recogidos para validar el comportamiento de ganancia variable del sistema.

== Estructura del documento

El resto de la memoria se estructura de la siguiente forma:

- El @cap-estado-arte revisa los actuadores de ganancia variable en robótica, las transmisiones de tipo _capstan_ y los sistemas de adquisición de datos para caracterización de actuadores.
- El @cap-marco-teorico presenta los fundamentos del mecanismo y de la instrumentación empleada.
- El @cap-diseno describe el diseño del sistema: requisitos, arquitectura, diseño mecánico, electrónico y de _firmware_.
- El @cap-implementacion detalla la fabricación, el montaje, la calibración y la validación del sistema de medida.
- El @cap-resultados presenta las campañas de medida y la caracterización del actuador.
- El @cap-conclusiones recoge las conclusiones y las líneas de desarrollo futuro.
