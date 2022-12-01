import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="splash"

export default class extends Controller {

  static targets = ["enterHostContainer", "whiteContainer", "button", "loginForm"]

  slide() {
    this.enterHostContainerTarget.classList.add("left-container")
    this.whiteContainerTarget.classList.add("right-container")
    this.whiteContainerTarget.classList.remove("d-none")
    this.buttonTarget.classList.add("d-none")
  }

  showForm(event) {
    event.preventDefault()
    this.whiteContainerTarget.classList.add("d-none")
    this.loginFormTarget.classList.remove("d-none")
  }
}
