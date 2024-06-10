# Sistema de Control de Acceso con ESP32

Este proyecto implementa un sistema de control de acceso basado en el ESP32, permitiendo la autenticación mediante un teclado matricial y un lector de tarjetas RC522. El sistema se comunica a través de MQTT y controla un servomotor para abrir y cerrar un cofre de seguridad o puerta.

## Tabla de Contenidos

- [Descripción](#descripción)
- [Características](#características)
- [Hardware Necesario](#hardware-necesario)
- [Configuración del Proyecto](#configuración-del-proyecto)
  - [Clonar el Repositorio](#1-clonar-el-repositorio)
  - [Configurar el Entorno de Desarrollo](#2-configurar-el-entorno-de-desarrollo)
  - [Configurar MQTT](#3-configurar-mqtt)
  - [Configurar Pines](#4-configurar-pines)
  - [Compilar y Flashear](#5-compilar-y-flashear)
- [Uso del Sistema](#uso-del-sistema)
  - [Inicio del Sistema](#1-inicio-del-sistema)
  - [Ingreso de Código](#2-ingreso-de-código)
  - [Uso de Tarjeta RFID](#3-uso-de-tarjeta-rfid)
  - [Apertura y Cierre del Cofre/Puerta](#4-apertura-y-cierre-del-cofrepuerta)
- [Notas Técnicas](#notas-técnicas)
- [Licencia](#licencia)

## Descripción

Este proyecto está diseñado para gestionar el acceso a un cofre de seguridad o puerta mediante un teclado matricial y un lector de tarjetas RC522. El cofre puede ser utilizado para depositar llaves u otros objetos de valor. El sistema permite abrir el cofre mediante la introducción de un código numérico o la presentación de una tarjeta RFID autorizada.

## Características

- **Control de Acceso**: Utiliza un teclado matricial para la entrada de códigos y un lector RC522 para la autenticación con tarjetas RFID.
- **MQTT**: Comunicación con un servidor MQTT para gestionar comandos y respuestas.
- **Servo**: Controla la apertura y cierre del cofre/puerta mediante un servomotor.
- **Pantalla LCD**: Muestra mensajes e información del estado.
- **Modo Seguro**: Cierra automáticamente el cofre después de 15 segundos de apertura.

## Hardware Necesario

- **ESP32**: Microcontrolador central del sistema.
- **Teclado Matricial (4x4)**: Para la entrada de códigos.
- **Lector de Tarjetas RC522**: Para la autenticación RFID.
- **Servomotor**: Controla la apertura y cierre del cofre.
- **Pantalla LCD (ST7789)**: Muestra mensajes y estado.
- **Servidor MQTT**: Para la comunicación y gestión de comandos.

## Configuración del Proyecto

### 1. Clonar el Repositorio

```bash
git clone https://github.com/Isaac-94/Control-de-acceso.git
cd Control-de-acceso
```

2. Configurar el Entorno de Desarrollo
Sigue la guía oficial de ESP-IDF para configurar el entorno de desarrollo.

3. Configurar MQTT
Edita sdkconfig para configurar la URL de tu broker MQTT:
```bash
CONFIG_BROKER_URL="mqtt://broker.url"
```
4. Configurar Pines
Ajusta los pines en tu código según tu hardware:

Teclado Matricial: GPIO 0, 4, 12, 13, 15, 21, 32, 33
Servo: GPIO 2
RC522: GPIO 18 (MISO), 19 (SCK), 22 (SDA), 23 (MOSI)
LCD: GPIOs configurados en spi_master_init.
5. Compilar y Flashear
bash
Copiar código
idf.py build
idf.py -p [puerto_serial] flash
Uso del Sistema
1. Inicio del Sistema
Enciende el ESP32. Este debería conectarse a la red Wi-Fi configurada y al servidor MQTT. La pantalla LCD mostrará un mensaje de inicio.

2. Ingreso de Código
Usa el teclado para ingresar un código numérico de 6 dígitos.
Presiona # para enviar el código.
Presiona * para cancelar y reiniciar el ingreso del código.
3. Uso de Tarjeta RFID
Presenta una tarjeta al lector RC522.
El sistema autentica la tarjeta y responde con un mensaje en la LCD.
4. Apertura y Cierre del Cofre/Puerta
Código 111: Abre el cofre/puerta moviendo el servo a 0 grados.
Código 101: Abre el cofre a 170 grados y, después de 15 segundos, lo cierra moviendo el servo de vuelta a 0 grados.
Código 100: Abre el cofre moviendo el servo a 170 grados.
Notas Técnicas
Tiempo de Espera del Código: Si el código no se completa en 15 segundos, se limpia el buffer.
Servo: El servo se mueve a 0 grados para abrir y a 170 grados para cerrar.
Mensajes MQTT: El sistema publica y suscribe mensajes en los temas /cntrlaxs/solicitud y /cntrlaxs/respuesta.
Licencia
Este proyecto está licenciado bajo la MIT License.

Autor
Creado por @Isaac-94


### Explicación de las Secciones

1. **Descripción**: Ofrece un resumen del propósito del proyecto.
2. **Características**: Detalla las funcionalidades principales del sistema.
3. **Hardware Necesario**: Lista los componentes de hardware que se requieren.
4. **Configuración del Proyecto**: Instrucciones paso a paso para clonar, configurar, y flashear el proyecto en el ESP32.
5. **Uso del Sistema**: Guía sobre cómo operar el sistema, incluyendo el ingreso de códigos y la autenticación RFID.
6. **Notas Técnicas**: Información adicional sobre el funcionamiento del sistema.
7. **Licencia**: Información sobre la licencia.
8. **Autor**: Detalles sobre el creador del proyecto.
9. **Imágenes**: Sección para agregar imágenes que describan el hardware y conexiones del proyecto.


