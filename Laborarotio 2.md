# Laboratorio 2 - Análisis de Vulnerabilidades

![VulnAss](Images/VulnerabilityAss.png)

---

- [Laboratorio 2 - Análisis de Vulnerabilidades](#laboratorio-2---análisis-de-vulnerabilidades)
  - [Objetivo](#objetivo)
  - [Catálogo de las herramientas](#catálogo-de-las-herramientas)
  - [Métodos de Análisis](#métodos-de-análisis)
  - [Requisitos](#requisitos)
  - [Procedimiento](#procedimiento)
    - [Análisis de vulnerabilidades en el IDE](#análisis-de-vulnerabilidades-en-el-ide)

---

## Objetivo

Por medio de las siguientes actividades usted aprenderá a realizar análisis de vulnerabilidades al código y a los contenedores con un conjunto de herramientas que ofrecen diferentes métodos y medios para la inspección.

---

## Catálogo de las herramientas

Para la ejecución de las actividades se hará uso de las siguientes herramientas Open Source o sus equivalentes en versiones gratuitas:

| Nombre | Sitio Web | Logo |
| --- | --- | --- |
| Snyk | <https://snyk.io/> | ![SnykLogo](Images/Snyk.png)|
| Trivy | <https://trivy.dev/> | ![TrivyLogo](Images/Trivy.png) |
| SonarQube | <https://www.sonarsource.com/open-source-editions/> | ![Sonarlogo](Images/SonarQube_Logo.png) |
| Checkov | <https://www.checkov.io/> | ![CheckovLogo](Images/Checkov.png)

---

## Métodos de Análisis

Para la ejecución de los análisis de vulnerabilidades se hará uso de dos esquemas:

1. __Análisis mediante IDE:__ Se realizará la instalación o integración de un plugin dentro del programa IDE. Para el caso de este laboratorio de integrará con Visual Studio Code.
2. __Análisis de Imágenes:__ Una vez construidas las imágenes de los contenedores se realizará la inspección de estas mismas con la ayuda de las herramientas.

---

## Requisitos

Para la ejecución de los siguientes laboratorios es necesario la descarga de un conjunto de aplicaciones sobre las cuales se van a realizar las diferentes tareas de análisis de vulnerabilidades.

1. Ingrese a la máquina virtual de Ubuntu. Las credenciales de acceso se encuentran indicadas en la descripción de la OVA entregada.
2. Ejecute la línea de comando. Es la aplicación llamada __Terminal__ en el borde izquierdo de la pantalla.
3. Acceder a la la ruta de trabajo de para los laboratorios en la carpeta '/home/hkuser/workdir'

    ```bash
    cd /home/hkuser/workdir
    ```

4. Ejecutar los siguientes comandos para realizar la descarga de las aplicaciones que serán usadas en los laboratorios.

    ```bash
    > git clone https://github.com/malevarro/reactjs-shopping-cart.git
    > git clone https://github.com/malevarro/DO180-apps.git
    > git clone https://github.com/malevarro/nodejs-goof.git
    > git clone https://github.com/malevarro/mslearn-aks-deployment-pipeline-github-actions.git
    > git clone https://github.com/malevarro/pipelines-javascript-docker.git
    ```

5. Ejecutar los siguientes comandos para realizar la descarga de algunas imágenes de contenedores que serán usadas en los laboratorios

    ```bash
    > docker pull tomcat:8.5.68
    > docker pull node:6-stretch
    > docker pull kodekloud/simple-webapp
    > docker pull kodekloud/ubuntu-ssh-enabled
    > docker pull kodekloud/throw-dice
    > docker pull kodekloud/webapp-color
    ```

---

## Procedimiento

A continuación se listan los diferentes pasos a seguir para poder realizar los análisis de vulnerabilidades sobre las aplicaciones.

### Análisis de vulnerabilidades en el IDE

Por medio de las siguientes acciones se realizará la inspección del código de la aplicación y de la definición del contenedor (Dockerfile) directamente en el IDE al momento de realizar el desarrollo (Coding) de los mismos. Para esta labor es necesario realizar la instalación de las extensiones de Visual Studio Code. 

Se pueden verificar todas las extensiones disponibles para Visual Studio Code en el [Marketplace](https://marketplace.visualstudio.com/vscode)

1. En la máquina virtual ejecute Visual Studio Code, haciendo click en el ícono ubicado la barra lateral izquierda.
2. 