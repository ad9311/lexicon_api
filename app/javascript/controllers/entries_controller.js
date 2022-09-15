import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [];
  static selectedInput = document.createElement('input');

  selectInput(e) {
    this.selectedInput = e.target;
  }

  appendChar(e) {
    this.selectedInput.value += e.target.innerHTML;
    this.selectedInput.focus();
  }
}
