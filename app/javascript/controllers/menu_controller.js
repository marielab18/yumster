import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["menu"]

  expand(event) {
    this.menuTarget.classList.add("active")
  }

  collapse(event) {
    this.menuTarget.classList.remove("active")
  }
}
