// app/javascript/application.js

// Carga Turbo para la navegación rápida de la página
import "@hotwired/turbo-rails"

// Carga Stimulus. Este comando buscará y ejecutará el archivo controllers/index.js
import "./controllers"

// Contenido para agregar al final de app/javascript/application.js

/**
 * Detecta cuando las fuentes personalizadas se han cargado y agrega la clase 'fonts-loaded'
 * al elemento <html> para prevenir el "Flash of Unstyled Text" (FOUT).
 */
function initializeFontObserver() {
  // Si las fuentes ya están cargadas, no hacer nada.
  if (document.documentElement.classList.contains('fonts-loaded')) {
    return;
  }

  // Comprueba si el navegador soporta la API de Font Loading
  if ('fonts' in document) {
    // Espera a que estas dos fuentes específicas estén listas
    Promise.all([
      document.fonts.load('1em "Dancing Script"'),
      document.fonts.load('1em "Playfair Display"')
    ]).then(() => {
      document.documentElement.classList.add('fonts-loaded');
      console.log("Fuentes personalizadas cargadas y aplicadas.");
    });
  } else {
    // Si el navegador es antiguo y no soporta la API, aplica la clase después de un breve tiempo.
    setTimeout(() => {
      document.documentElement.classList.add('fonts-loaded');
    }, 500);
  }
}
// Contenido para agregar al final de app/javascript/application.js

/**
 * Lógica para inicializar todos los componentes interactivos de la UI,
 * como los menús desplegables.
 */
function initializeUIComponents() {
  // Lógica para el dropdown "Crear"
  const crearBtn = document.getElementById('crearBtn');
  const crearMenu = document.getElementById('crearMenu');

  if (crearBtn && crearMenu) {
    // Abrir/cerrar el menú al hacer clic en el botón
    crearBtn.addEventListener('click', (event) => {
      event.stopPropagation(); // Evita que el clic se propague al documento
      crearMenu.classList.toggle('hidden');
    });
  }
  
  // Lógica para cerrar menús al hacer clic fuera
  document.addEventListener('click', (event) => {
    // Cierra el menú "Crear" si está abierto y se hace clic fuera
    if (crearMenu && !crearMenu.classList.contains('hidden') && !crearBtn.contains(event.target)) {
      crearMenu.classList.add('hidden');
    }

    // Aquí puedes añadir la lógica para cerrar otros menús si los tuvieras
  });
}

// Ejecutar en la carga inicial de la página y después de cada navegación con Turbo
document.addEventListener('turbo:load', initializeUIComponents);

// Una llamada extra para la primera carga en caso de que turbo:load no se dispare
document.addEventListener('DOMContentLoaded', initializeUIComponents);

// Ejecutar en la carga inicial de la página
document.addEventListener('DOMContentLoaded', initializeFontObserver);

// Ejecutar después de cada navegación con Turbo
document.addEventListener('turbo:load', initializeFontObserver);