import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Forza refresco visual cuando cambia la vista con Turbo
    document.documentElement.classList.remove("turbo-loading")
    document.dispatchEvent(new Event("tailwind:load"))
  }
}
