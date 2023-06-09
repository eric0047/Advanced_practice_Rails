import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="hello"
export default class extends Controller {
  static targets = ["name", "output"];

  greet() {
    this.outputTarget.textContent = `Hello, ${this.nameTarget.value}!`;
  }
}
