import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dropdownBtn", "category"]

  toggleDropdown(event) {
    event.currentTarget.nextElementSibling.classList.toggle("d-none");
  }

  toggleCategory(event) {
    event.currentTarget.children[0].classList.toggle("d-none");
  }
}
