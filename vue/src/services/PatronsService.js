import axios from "axios";

export default {

    getAllPatrons() {
        return axios.get('/patrons');
    },

    getPatronByPatronId(patronId){
        return axios.get(`/patrons/${patronId}`);
    },

    getPatronIdByUserId(userId){
        return axios.get(`/patrons/user/${userId}`);
    },

    getPatronByPhoneNumber(phoneNumber){
        return axios.get(`/patrons/phone/${phoneNumber}`);
    },

    createNewPatron(newPatron) {
        return axios.post('/patrons', newPatron);
    },

    updatePatron(patronId) {
        return axios.put(`/patrons/${patronId}`);

    },

}