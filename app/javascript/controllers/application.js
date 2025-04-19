import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
// pal turbo
import "@hotwired/turbo-rails"
Turbo.session.drive = false

export { application }
