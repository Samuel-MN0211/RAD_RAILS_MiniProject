import { Controller } from "@hotwired/stimulus"


export default class extends Controller {

  static targets = ["alunoFields", "empresaFields", "coordenadorFields"]


  connect() {
    this.toggleFields();
  }


  toggleFields() {
    const selectedRole = this.element.querySelector("#user_role").value;


    const allFieldTargets = [this.alunoFieldsTarget, this.empresaFieldsTarget, this.coordenadorFieldsTarget];

    allFieldTargets.forEach(target => {

      const isVisible = target.dataset.registrationFormTarget.startsWith(selectedRole);


      target.classList.toggle('d-none', !isVisible);


      target.querySelectorAll('input, select, textarea').forEach(input => {
        input.disabled = !isVisible;
      });
    });
  }
}