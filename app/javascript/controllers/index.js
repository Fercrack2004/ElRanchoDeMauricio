// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

const application = Application.start()
const context = require.context("./", true, /\.js$/)
application.load(definitionsFromContext(context))
import TailwindFixController from "./tailwind_fix_controller"

application.register("tailwind-fix", TailwindFixController)
