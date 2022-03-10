import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["menu", "navbar"]

connect() {
  const homepage = document.getElementById("homepage")
  homepage.addEventListener("click", (event) => {
    this.collapse(event)
  })
}

  expand(event) {
    this.menuTarget.classList.add("active-tweaks")
    this.menuTarget.classList.add("active")
    this.navbarTarget.style.height = "100%"
    const homepage = document.getElementById("homepage")
    homepage.classList.add("homepage-active")
  }

  collapse(event) {
    this.menuTarget.classList.remove("active")
    setTimeout(() => this.navbarTarget.style.height = "10%", 500)
    setTimeout(() => this.menuTarget.classList.remove("active-tweaks"), 500)
    homepage.classList.remove("homepage-active")
  }
}
