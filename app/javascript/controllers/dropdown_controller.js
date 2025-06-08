// app/javascript/controllers/dropdown_controller.js
import { Controller } from "@hotwired/stimulus"

// Se conecta a un div con data-controller="dropdown"
export default class extends Controller {
  // Define un "objetivo" llamado "menu" que podemos controlar
  static targets = [ "menu" ]

  // Este método se ejecuta cuando el controlador se conecta al HTML
  connect() {
    // Necesario para la lógica de "clic fuera"
    this.boundCloseOnClickOutside = this.closeOnClickOutside.bind(this)
    document.addEventListener("click", this.boundCloseOnClickOutside)
  }

  // Se ejecuta cuando el controlador se desconecta (ej. al navegar a otra página con Turbo)
  disconnect() {
    document.removeEventListener("click", this.boundCloseOnClickOutside)
  }

  // Esta acción se ejecuta cuando se hace clic en el botón del dropdown
  toggle() {
    this.menuTarget.classList.toggle("hidden")
  }

  // Cierra el menú si se hace clic fuera del elemento principal del dropdown
  closeOnClickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add("hidden")
    }
  }
}