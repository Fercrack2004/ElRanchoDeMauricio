// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
document.addEventListener("turbo:load", () => {
    // Por ejemplo, inicializar tooltips si usas Flowbite
    if (window.initTooltips) {
      initTooltips();
    }
  });
  import "controllers"
