// app/javascript/controllers/nested_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // Añadimos los targets para las secciones
  static targets = [
    "ingredientsContainer", "ingredientTemplate",
    "stepsContainer",       "stepTemplate",
    "sectionsContainer",    "sectionTemplate" // <-- NUEVOS TARGETS
  ]

  addIngredient(event) {
    event.preventDefault()
    let content = this.ingredientTemplateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.ingredientsContainerTarget.insertAdjacentHTML('beforeend', content)
  }

  addStep(event) {
    event.preventDefault()
    let content = this.stepTemplateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.stepsContainerTarget.insertAdjacentHTML('beforeend', content)
  }

  // ¡NUEVA FUNCIÓN!
  addSection(event) {
    event.preventDefault()
    let content = this.sectionTemplateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.sectionsContainerTarget.insertAdjacentHTML('beforeend', content)
  }

  remove(event) {
    event.preventDefault()
    let wrapper = event.target.closest(".nested-fields")
    
    if (wrapper.dataset.newRecord === "true") {
      wrapper.remove()
    } else {
      wrapper.style.display = 'none'
      wrapper.querySelector("input[name*='_destroy']").value = '1'
    }
  }
}