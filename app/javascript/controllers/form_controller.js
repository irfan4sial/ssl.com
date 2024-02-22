import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = [ 'form', "input", "output" ]
  static values = { showIf: String }
  connect() {
    console.log("Good Form", this.element.classList)
    this.toggle()
  }

  toggle() {
    if (this.inputTarget.value != this.showIfValue) {
      this.outputTarget.hidden = true
    } else if (this.inputTarget.value = this.showIfValue) {
      this.outputTarget.hidden = false
    }
  }

  formSubmit(event) {
    debugger
    let isValid = this.validateForm(this.formTarget)
    debugger
    if(!isValid) {
      event.preventDefault();
    }
  }

  validateForm() {
    let isValid = true;
    debugger
    let requiredFieldSelectors = 'input:required';
    let requiredFields = this.formTarget.querySelectorAll(requiredFieldSelectors);

    requiredFields.forEach((field) => {
      if (!field.disabled && !field.value.trim()) {
        field.focus();

        isValid = false;
      }
    })

    return isValid;
  }

  deleteRow(e) {
    // e.preventDefault(); // 4
    // console.log("action cclicck: ", e, this)
    // $(e).prev('input[type=hidden]').val('1')
    // $(e).closest('fieldset').hide()
    // e.preventDefault()
    // e.target.closest("fieldset").style = "display: none;";
    e.target.closest("fieldset").style = "display: none;"



    e.preventDefault();
    // let hiddenInput = e.previousElementSibling;
    // hiddenInput = hiddenInput.previousElementSibling
    // hiddenInput.value = '1';
    // console.log("Hidden elemement:", hiddenInput, this.element)
    // hiddenInput.closest('fieldset').style.display = 'none';

  }
}
