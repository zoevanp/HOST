import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat-bubble"
export default class extends Controller {
  connect() {
    console.log("Does this work?")

  }
  open() {
    console.log(event);
  }
}
