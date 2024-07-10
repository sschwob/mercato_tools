import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  toggleDropdown(event) {
    event.currentTarget.nextElementSibling.classList.toggle("d-none");
  }
}
