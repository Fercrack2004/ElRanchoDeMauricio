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
-   **Visualización Detallada:** Cada receta y artículo tiene su propia página de detalle con un diseño profesional, mostrando toda la información relevante.
-   **Perfiles Públicos de Usuario:** Cada usuario tiene una página de perfil pública que muestra su nombre, avatar y descripción. Los nombres de los autores en las recetas y reseñas son enlaces directos a estos perfiles, fomentando la conexión dentro de la comunidad.

### Para Usuarios Registrados (`user`)

-   **Perfil Personalizado:** Cada usuario puede editar su perfil, incluyendo su nombre de usuario, y subir una **foto de avatar personalizada**, que se almacena y sirve a través de **Cloudinary**.
-   **Sistema de Reseñas y Calificaciones:** Los usuarios pueden dejar comentarios y una calificación por estrellas (de 1 a 5) en cualquier blog o página de información, contribuyendo a un sistema de rating comunitario.
-   **Solicitudes de Colaboración:** Si un usuario desea contribuir a un blog existente, puede enviar una "Solicitud de Edición" al autor, iniciando un flujo de trabajo colaborativo.
-   **Suscripción al Newsletter:** Los usuarios pueden suscribirse para recibir notificaciones por correo electrónico, gestionadas a través de la API de **SendGrid**.

### Para Moderadores (`moderator`)

-   **Permisos Ampliados:** Los moderadores heredan todos los permisos de un usuario regular.
-   **Creación de Contenido:** Tienen acceso a un menú desplegable "Crear" para generar nuevos **Blogs de Recetas** y **Páginas de Información**.
    -   **Formularios Dinámicos:** Utilizan formularios avanzados con StimulusJS para añadir y eliminar campos de **ingredientes, pasos y secciones** dinámicamente.
    -   **Subida de Imágenes Múltiples:** Pueden subir una **imagen de portada** para cada contenido, así como **imágenes individuales** para cada ingrediente, paso o sección.
-   **Gestión de Colaboración:** Tienen la capacidad de revisar y aceptar o rechazar las solicitudes de edición enviadas por los usuarios.
-   **Salas de Chat Colaborativas:** Acceden a salas de chat en tiempo real para coordinar la edición de contenido con los autores.

### Solo para Administradores (`admin`) - Control Total

Un administrador tiene todos los permisos de un moderador y, adicionalmente, cuenta con un **Panel de Administración** exclusivo con las siguientes capacidades:

-   **Gestión de Usuarios:**
    -   **Vista de Lista:** Pueden ver una lista completa de todos los usuarios registrados en la plataforma.
    -   **Cambio de Roles:** Tienen la capacidad de cambiar el rol de cualquier usuario (de `user` a `moderator` o viceversa) directamente desde el panel, a través de un formulario dedicado para cada uno.
    -   **Eliminación de Usuarios:** Pueden eliminar la cuenta de cualquier usuario (excepto la suya propia, como medida de seguridad).
-   **Gestión Global de Contenido:** Tienen la autoridad para **editar o eliminar** cualquier blog, página de información, o reseña en toda la plataforma.
-   **Protección de Cuenta:** Por seguridad, la opción "Cancelar mi cuenta" está deshabilitada en la página de perfil del propio administrador para prevenir la eliminación accidental de la cuenta con los privilegios más altos.

---

## Tecnologías y Servicios Clave

-   **Backend:** Ruby on Rails 7
-   **Frontend:** Hotwired (Turbo + StimulusJS)
-   **Estilos:** Tailwind CSS, compilado con `tailwindcss-rails`.
-   **Autenticación:** Devise.
-   **Almacenamiento de Archivos:** **Cloudinary**
-   **Envío de Correos:** **SendGrid**
-   **Deployment:** **Render**

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