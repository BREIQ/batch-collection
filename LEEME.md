🛠️ Colección de Utilidades Batch para Windows por Breiq

Una colección de scripts de automatización de alto rendimiento diseñada para optimizar la gestión del sistema, la conectividad de red y el mantenimiento para usuarios avanzados y administradores de sistemas.
☕ Soporte / Donaciones

Si estas herramientas han mejorado tu flujo de trabajo, te han ahorrado tiempo o te han ayudado a gestionar tus servidores de manera más eficiente, ¡considera apoyar mi trabajo!
Haz clic aquí para Donar vía PayPal
📂 Arquitectura del Proyecto

Este repositorio está organizado en categorías para mantener tu flujo de trabajo limpio:
Categoría	Carpeta	Script	Descripción
🌐 Red	connections/	sshc.bat	Gestor SSH inteligente con detección automática de puerto.
🌐 Red	connections/	statusservers.bat	Monitor de servidores en tiempo real con códigos de color.
🖥️ Sistema	system/	shutpc.bat	Programador de apagado avanzado y gestor de tareas.
🖥️ Sistema	system/	host.bat	Editor de archivos Hosts instantáneo con auto-elevación.
🖥️ Sistema	system/	cachec.bat	Limpiador profundo de archivos basura y caché del sistema.
⚡ Uso Global (Variables de Entorno) - Recomendado

Para una máxima productividad, puedes configurar estos scripts como comandos globales. Esto te permite ejecutarlos desde cualquier terminal (CMD o PowerShell) escribiendo solo su nombre.
Configuración:

    Crear carpeta: Crea una carpeta en la raíz de tu disco, por ejemplo: C:\batchs.

    Mover scripts: Copia los archivos .bat a esa carpeta.

    Configurar PATH:

        Presiona la tecla Inicio y busca: Variables de entorno.

        Entra a "Editar las variables de entorno del sistema" > Variables de entorno.

        En "Variables del sistema", busca Path, dale a Editar > Nuevo.

        Agrega la ruta: C:\batchs y acepta los cambios.

¡Listo! Ahora puedes abrir una terminal y escribir sshc o cachec desde cualquier lugar.
📝 Documentación Detallada
🌐 Herramientas de Conexión
🔹 sshc.bat

    Función: Simplifica las conexiones SSH con entradas separadas para usuario y host.

    Ventaja: La ventana no se cierra al fallar o terminar la sesión, permitiéndote leer los logs de error de SSH.

🔹 statusservers.bat

    Función: Monitor visual de pings cada 10 segundos.

    Ventaja: Usa códigos ANSI para mostrar [ EN LINEA ] en verde o [ CAIDO ] en rojo de forma dinámica.

🖥️ Herramientas de Sistema
🔹 shutpc.bat

    Función: Programador interactivo de apagado/reinicio.

    Ventaja: Incluye un botón de pánico para cancelar cualquier apagado programado accidental.

🔹 host.bat

    Función: Acceso directo al archivo hosts.

    Ventaja: Incluye Auto-UAC Elevation; solicita permisos de administrador automáticamente.

🔹 cachec.bat

    Función: Limpiador integral del sistema.

    Ventaja: Vacía carpetas Temp, Prefetch, DNS y Papelera de Reciclaje en un solo comando.

🚀 Instalación
Bash

git clone https://github.com/BREIQ/batch-collection.git

    [!IMPORTANT]
    Codificación: Se recomienda editar estos archivos con VS Code o Notepad++ en formato ANSI o UTF-8 (sin BOM) para asegurar la compatibilidad de caracteres en la consola.
