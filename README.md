# El Rancho de Mauricio (Wiki-Project-Group-32)

Bienvenido al repositorio oficial de "El Rancho de Mauricio", una plataforma web completa y colaborativa diseñada para entusiastas de la cocina.

**[Ver la aplicación en vivo en Render](https://wiki-project-group-32.onrender.com/)**

---

## Descripción del Proyecto

"El Rancho de Mauricio" es una aplicación web dinámica construida con Ruby on Rails, que funciona como una wiki culinaria donde una comunidad de usuarios puede crear, compartir, descubrir y colaborar en contenido gastronómico. La plataforma está diseñada para ser un punto de encuentro para chefs, bloggers y aficionados, con un fuerte enfoque en la colaboración y la calidad del contenido.

La aplicación se estructura en torno a dos tipos de contenido principal:
-   **Blogs de Recetas:** Guías detalladas paso a paso para preparar platos, con listas de ingredientes y tiempos de cocción.
-   **Páginas de Información:** Artículos sobre técnicas culinarias, historia de la comida, o detalles sobre ingredientes específicos.

---

## Funcionalidades Detalladas

La plataforma ofrece una rica gama de funcionalidades que varían según el rol del usuario, fomentando tanto el consumo de contenido como la creación colaborativa.

### Funcionalidades Generales (Para Todos)

-   **Exploración Intuitiva:** Navegación libre por todas las recetas y artículos de información públicos, presentados en un diseño de tarjetas moderno y visual.
-   **Búsqueda Global:** Un sistema de búsqueda permite a los usuarios encontrar rápidamente contenido específico por título o descripción.
-   **Visualización Detallada:** Cada receta y artículo tiene su propia página de detalle con un diseño profesional, mostrando toda la información relevante, incluyendo imágenes, ingredientes, pasos y secciones.

### Para Usuarios Registrados (`user`)

-   **Perfil Personalizado:** Cada usuario puede editar su perfil, incluyendo su nombre de usuario, y subir una **foto de avatar personalizada**, que se almacena y sirve a través de **Cloudinary**.
-   **Sistema de Reseñas y Calificaciones:** Los usuarios pueden dejar comentarios y una calificación por estrellas (de 1 a 5) en cualquier blog o página de información, contribuyendo a un sistema de rating comunitario.
-   **Solicitudes de Colaboración:** Si un usuario desea contribuir a un blog existente, puede enviar una "Solicitud de Edición" al autor, iniciando un flujo de trabajo colaborativo.
-   **Suscripción al Newsletter:** Los usuarios pueden suscribirse para recibir notificaciones por correo electrónico, gestionadas a través de la API de **SendGrid**.

### Para Moderadores (`moderator`) y Administradores (`admin`)

-   **Panel de Creación de Contenido:** Acceden a un menú desplegable "Crear" en la barra de navegación, que les permite iniciar el proceso de creación de nuevos blogs o páginas de información.
-   **Creación de Blogs de Recetas:**
    -   **Formularios Dinámicos:** Pueden añadir o eliminar campos de **ingredientes** y **pasos** dinámicamente gracias a la integración con StimulusJS.
    -   **Subida de Imágenes Múltiples:** Pueden subir una **imagen de portada** para la tarjeta del blog, así como **imágenes individuales** para cada ingrediente y cada paso de la receta, ofreciendo una guía visual muy completa.
-   **Creación de Páginas de Información:**
    -   Pueden construir artículos detallados con múltiples **secciones**, cada una con su propio título, contenido y una imagen opcional.
-   **Gestión de Colaboración:** Tienen la capacidad de revisar y aceptar o rechazar las solicitudes de edición enviadas por los usuarios.
-   **Salas de Chat Colaborativas:** Cada blog y página de información tiene asociada una **sala de chat en tiempo real** (utilizando Action Cable de Rails) accesible solo para el autor y los editores (incluyendo moderadores y administradores), permitiéndoles coordinar la creación y edición del contenido de forma privada y eficiente.

### Solo para Administradores (`admin`) - Control Total

-   **Superpoderes:** Un administrador tiene todos los permisos de un moderador y un usuario.
-   **Gestión Global de Contenido:** Tienen la autoridad para **editar o eliminar** cualquier blog, página de información, o reseña en toda la plataforma, garantizando el control de calidad y la integridad del sitio.

---

## Tecnologías y Servicios Clave

-   **Backend:** Ruby on Rails 7
-   **Frontend:** Hotwired (Turbo + StimulusJS) para interactividad moderna.
-   **Estilos:** Tailwind CSS, compilado con `tailwindcss-rails`.
-   **Autenticación:** Devise.
-   **Almacenamiento de Archivos:** **Cloudinary** se utiliza como el servicio principal para todas las subidas de imágenes.
-   **Envío de Correos:** **SendGrid** gestiona el envío de todos los correos transaccionales.
-   **Deployment:** La aplicación está alojada y servida por **Render**.

---

## Cuentas de Prueba

Para experimentar con los diferentes niveles de permiso en el sitio en vivo, puedes utilizar las siguientes cuentas:

#### Cuenta de Administrador
-   **Email:** `admin@admin.admin`
-   **Contraseña:** `admin@admin.admin`

#### Cuenta de Moderador
-   **Email:** `mod@mod.mod`
-   **Contraseña:** `mod@mod.mod`

---
## Recursos y Agradecimientos
- La lógica para los menús desplegables se basó en conceptos discutidos en foros como Stack Overflow, y la implementación final se adaptó a StimulusJS para una mejor integración con el ecosistema de Rails.
  - [Stack Overflow: How can I make a drop down menu in HTML?](https://stackoverflow.com/questions/76684999/how-can-i-make-a-drop-down-menu-in-html)