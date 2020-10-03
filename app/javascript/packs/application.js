// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("css/application.scss")

document.addEventListener("turbolinks:load", function(event) {
    document.getElementsByClassName('language_selector')[0].addEventListener('change', (event)=>{
        console.log(event.target.value);
        if (document.location.search.length !== 0) { // If there is already a querystring
            console.log("new: " + document.location.search.replace(/locale=[a-z]+/, 'locale=' + event.target.value));
            document.location.search = document.location.search.replace(/locale=[a-z]+/, 'locale=' + event.target.value);
        } else {
            console.log("new: " + '?locale=' + event.target.value);
            document.location.search = '?locale=' + event.target.value;
        }
    });
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
