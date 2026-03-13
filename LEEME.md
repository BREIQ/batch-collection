# 🛠️ Colección de Utilidades Batchs por Breiq

![Language](https://img.shields.io/badge/Language-Batch-orange?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Windows-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

Una colección de scripts de automatización de alto rendimiento diseñados para optimizar la gestión del sistema, la conectividad de red y el mantenimiento para usuarios avanzados y administradores de sistemas.

---

## ☕ Soporte / Donaciones

Si estas herramientas han mejorado tu flujo de trabajo, te han ahorrado tiempo o te han ayudado a gestionar tus servidores de manera más eficiente, ¡considera apoyar mi trabajo!

### [Haz clic aquí para donar vía PayPal](https://www.paypal.com/paypalme/breiq)

[![Donate via PayPal](https://img.shields.io/badge/Donate-PayPal-003087?style=for-the-badge&logo=paypal&logoColor=white)](https://www.paypal.com/paypalme/breiq)

---

## 📂 Arquitectura del Proyecto

Este repositorio está organizado en dos categorías especializadas para mantener tu flujo de trabajo limpio:

| Categoría | Carpeta | Script | Descripción |
| :--- | :--- | :--- | :--- |
| 🌐 **Red** | `connections/` | `sshc.bat` | Gestor SSH inteligente con detección automática de puertos. |
| 🌐 **Red** | `connections/` | `statusservers.bat` | Monitor de servidores en tiempo real con códigos de color. |
| 🖥️ **Sistema** | `system/` | `shutpc.bat` | Programador de apagado avanzado y gestor de tareas. |
| 🖥️ **Sistema** | `system/` | `host.bat` | Editor de Hosts instantáneo con auto-elevación. |
| 🖥️ **Sistema** | `system/` | `cachec.bat` | Limpiador profundo de caché y basura del sistema. |

---

## 📝 Documentación Detallada de Scripts

### 🌐 Herramientas de Red

#### 🔹 `sshc.bat`
* **Función:** Simplifica las cadenas de conexión SSH permitiendo entradas separadas para usuario y host/puerto.
* **Por qué es mejor:** Las ventanas estándar de SSH se cierran inmediatamente al ocurrir un error. Este script permanece abierto tras finalizar la sesión, permitiéndote revisar logs o errores antes de cerrar manualmente.

#### 🔹 `statusservers.bat`
* **Función:** Realiza pings a una lista personalizable de servidores cada 10 segundos.
* **Por qué es mejor:** Utiliza **Códigos de Escape ANSI** dinámicos para feedback visual instantáneo: **[ ONLINE ]** en Verde y **[ OFFLINE ]** en Rojo.

---

### 🖥️ Herramientas de Sistema

#### 🔹 `shutpc.bat`
* **Función:** Menú interactivo para programar apagados o reinicios en minutos.
* **Por qué es mejor:** Incluye una función de "Cancelar" que detiene cualquier tarea de energía pendiente de Windows, evitándote apagados accidentales.

#### 🔹 `host.bat`
* **Función:** Abre directamente el archivo `hosts` de Windows en el Bloc de notas.
* **Por qué es mejor:** Cuenta con **Elevación Auto-UAC**; solicita automáticamente privilegios de Administrador para que no tengas que "Ejecutar como administrador" manualmente.

#### 🔹 `cachec.bat`
* **Función:** Una herramienta potente de mantenimiento para recuperar espacio en disco.
* **Por qué es mejor:** Limpia archivos temporales, datos de Prefetch, vacía la caché DNS y fuerza el vaciado de la Papelera de reciclaje mediante integración con PowerShell.
