import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  static values = {
    strings: Array,
    typeSpeed: { type: Number, default: 100 }
  }

  connect() {
    this.typed = new Typed(this.element, {
      strings: this.stringsValue,
      typeSpeed: this.typeSpeedValue,
      loop: true
    })
  }

  disconnect() {
    // prevents leftover instances/errors when Turbo replaces this element
    this.typed?.destroy()
  }
}
