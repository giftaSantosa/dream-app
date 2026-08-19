import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-up"
export default class extends Controller {
  connect() {
    this.element.scrollIntoView()
  }
}
