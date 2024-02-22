import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="projects"
export default class extends Controller {
  static targets = [ "name", "email" ]

  connect() {
    console.log("project connected", this.targets)
  }

  greet() {
    const element = this.nameTarget
    const element2 = this.emailTarget
    const name = element.value
    const email = element2.value
    console.log(`Project Hello, ${name}!, ${email}`)
  }
}
