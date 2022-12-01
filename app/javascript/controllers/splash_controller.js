import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="splash"

export default class extends Controller {

  static targets = ["enterHostContainer", "whiteContainer", "button", "loginForm", "registerForm"]

  slide() {
    this.enterHostContainerTarget.classList.add("left-container")
    this.whiteContainerTarget.classList.add("right-container")
    this.whiteContainerTarget.classList.remove("d-none")
    this.buttonTarget.classList.add("color: orange")
  }

  showLoginForm(event) {
    event.preventDefault()
    this.whiteContainerTarget.classList.add("d-none")
    this.loginFormTarget.classList.remove("d-none")
  }

  showSignUpForm(event) {
    event.preventDefault()
    this.whiteContainerTarget.classList.add("d-none")
    this.registerFormTarget.classList.remove("d-none")

  }
}
