import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["menu", "navbar"]

  expand(event) {
    this.menuTarget.classList.add("active")
    this.navbarTarget.style.height = "100%"
    const homepage = document.getElementById("homepage")
    homepage.classList.add("homepage-active")
  }

  collapse(event) {
    this.menuTarget.classList.remove("active")
    setTimeout(() => this.navbarTarget.style.height = "10%", 500)
    homepage.classList.remove("homepage-active")
  }
}
