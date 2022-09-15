import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [];
  static selectedInput = document.createElement('input');

  selectInput(e) {
    this.selectedInput = e.target;
  }

  appendChar(e) {
    if (this.selectedInput.id !== undefined) {
      this.selectedInput.value += e.target.innerHTML;
      this.selectedInput.focus();
    }
  }
}
