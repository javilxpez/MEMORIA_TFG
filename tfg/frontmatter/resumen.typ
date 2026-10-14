#import "../template.typ": *

= Resumen

#pendiente[Versión provisional basada en la propuesta del TFG. Reescribir al final con los resultados reales (1 página, unas 250–300 palabras).]

Este proyecto se centra en el diseño e implementación de un sistema de adquisición de datos para caracterizar un actuador de ganancia variable basado en un mecanismo de _capstan drive_ aplicado a robótica. El actuador acciona un brazo tipo palanca cuyo comportamiento mecánico es análogo al de un bíceps realizando un _curl_: la fuerza necesaria para la actuación es máxima cuando el brazo está completamente contraído y disminuye a medida que se extiende.

Para ello se diseña y fabrica una PCB dedicada a la adquisición de las medidas de fuerza, posición angular y corriente del motor; se realiza el diseño mecánico necesario para integrar el sistema de medida con el actuador; y se desarrolla el _firmware_ de adquisición y registro de datos en tiempo real. Mediante campañas de medida sistemáticas se caracteriza la relación entre la posición del brazo, la ganancia del mecanismo y la fuerza de actuación, validando el comportamiento de ganancia variable del sistema.

*Palabras clave:* adquisición de datos, actuador de ganancia variable, _capstan drive_, instrumentación, diseño de PCB, sensores de fuerza, robótica bioinspirada.
