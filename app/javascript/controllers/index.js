// Contenido para: app/javascript/controllers/index.js

import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

// Con esta configuración, si en el futuro añades un controlador como
// `hello_controller.js`, tendrías que registrarlo aquí manualmente:
//
// import HelloController from "./hello_controller.js"
// application.register("hello", HelloController)
//
// Por ahora, solo necesitamos iniciar Stimulus.