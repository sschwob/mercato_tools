import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    toggleDisplayNextElem(event) {
        event.currentTarget.nextElementSibling.classList.toggle("d-none");
        event.currentTarget.classList.toggle("fa-eye-slash");
        event.currentTarget.classList.toggle("fa-eye");
    }
}
