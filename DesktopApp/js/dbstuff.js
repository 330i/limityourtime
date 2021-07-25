require('dotenv').config();
var firebase = require("firebase/app");
require("firebase/firestore");

var firebaseConfig = {
    apiKey: "AIzaSyDSayECG_y9xdMpRe5zskPAOMDsqATXBn8",
    authDomain: "limit-your-time-app.firebaseapp.com",
    projectId: "limit-your-time-app",
    storageBucket: "limit-your-time-app.appspot.com",
    messagingSenderId: "929738053785",
    appId: "1:929738053785:web:de8aa07c0da6cd977e0008",
    measurementId: "G-7VPY9D8XMP"
};
firebase.initializeApp(firebaseConfig);
firebase.analytics();

function loginUser() {
    firebase.auth().tenantId = 'limit-your-time-app';
    firebase.auth().signInWithEmailAndPassword(email, password)
    .then(function(result) {
        
    });
}