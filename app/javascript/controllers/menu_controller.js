import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["menu"]

  expand(event) {
    this.menuTarget.classList.add("active")
    const homepage = document.getElementById("homepage")
    homepage.classList.add("homepage-active")
  }

  collapse(event) {
    this.menuTarget.classList.remove("active")
    homepage.classList.remove("homepage-active")
  }
}
