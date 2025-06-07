// app/javascript/application.js

import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"

// --- 1. Importamos SOLO los controladores de Stimulus que necesitamos ---
import NestedFormController from "./controllers/nested_form_controller.js"
import DropdownController from "./controllers/dropdown_controller.js"


// --- 2. Iniciamos Stimulus y lo registramos ---
window.Stimulus = Application.start()
Stimulus.register("nested-form", NestedFormController)
Stimulus.register("dropdown", DropdownController) // El dropdown ahora también será manejado por Stimulus


// =================================================================
// === TU CÓDIGO ORIGINAL PARA LAS FUENTES (SIN CAMBIOS) ===========
// =================================================================
/**
 * Detecta cuando las fuentes personalizadas se han cargado y agrega la clase 'fonts-loaded'
 * al elemento <html> para prevenir el "Flash of Unstyled Text" (FOUT).
 */
function initializeFontObserver() {
  if (document.documentElement.classList.contains('fonts-loaded')) {
    return;
  }
  if ('fonts' in document) {
    Promise.all([
      document.fonts.load('1em "Dancing Script"'),
      document.fonts.load('1em "Playfair Display"')
    ]).then(() => {
      document.documentElement.classList.add('fonts-loaded');
    });
  } else {
    setTimeout(() => {
      document.documentElement.classList.add('fonts-loaded');
    }, 500);
  }
}

document.addEventListener('DOMContentLoaded', initializeFontObserver);
document.addEventListener('turbo:load', initializeFontObserver);
// =================================================================
// === FIN DE TU CÓDIGO ORIGINAL PARA LAS FUENTES ==================
// =================================================================