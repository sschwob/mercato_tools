import { Controller } from "@hotwired/stimulus";
import axios from "axios";

export default class extends Controller {
    static targets = ["allyCodeField", "verifyBtn", "submitBtn"];

    async verifyAllyCode() {
        const token = document.querySelector('[name=csrf-token]').content;
        axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
        const allyCode = this.allyCodeFieldTarget.value;

        if (allyCode.length != 9) {
            alert("La code allié doit comporter exactement 9 chiffres");
            return;
        }

        await axios.get(`/getPlayerInfos?ally_code=${allyCode}`, {
            responseType: "json",
        }).then((response) => {
            if (response.data.status == 200) {
                alert(`Code allié valide. Nom du compte SWGOH : ${response.data.name}. Assurez-vous qu'il s'agisse de votre compte SWGOH`);
                this.allyCodeFieldTarget.readOnly = true;
                this.verifyBtnTarget.classList.add('d-none');
                this.submitBtnTarget.classList.remove('d-none');
            } else {
                alert(`Le code allié ${allyCode} n'existe pas ou aucun profil créé sur le site swgoh.gg.`);
            }
        });
    }
}
