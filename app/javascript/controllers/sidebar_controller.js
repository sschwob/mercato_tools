import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    mediaPanelIsOpen: Boolean
  }

  static targets = ["mediaDropdownContainer", "dropdownBtn", "category"]

  toggleDropdown(event) {
    this.mediaDropdownContainerTarget.classList.toggle("d-none");
  }

  toggleCategory(event) {
    event.currentTarget.children[0].classList.toggle("d-none");
  }
}
