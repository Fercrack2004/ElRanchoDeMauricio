import { Controller } from "@hotwired/stimulus"

// Este es un controlador de prueba muy simple.
export default class extends Controller {
  connect() {
    // Si este controlador se conecta, lo veremos en la consola.
    console.log("¡El controlador 'hello' se ha conectado con éxito!")
    
    // Y cambiaremos el texto del elemento al que se conectó.
    this.element.textContent = "✅ ¡Stimulus está funcionando!"
    this.element.style.backgroundColor = '#dcfce7' // Verde claro
    this.element.style.color = '#166534' // Verde oscuro
  }
}