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

// Ejecutar en la carga inicial de la página
document.addEventListener('DOMContentLoaded', initializeFontObserver);

// Ejecutar después de cada navegación con Turbo
document.addEventListener('turbo:load', initializeFontObserver);