import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
    console.log("Hello! ", this.element)
  }

  // addTask(event) {
  //   event.preventDefault();
  //   const association = this.element.dataset.association;
  //   const content = this.element.dataset.content.replace(/new_template/g, new Date().getTime());
  //   document.getElementById(association).insertAdjacentHTML('beforeend', content);
  // }
  //
  // removeTask(event) {
  //   event.preventDefault();
  //   const wrapper = event.target.closest('.nested-fields');
  //   if (wrapper) {
  //     wrapper.querySelector('input[type="hidden"]').value = '1';
  //     wrapper.style.display = 'none';
  //   }
  // }
}
