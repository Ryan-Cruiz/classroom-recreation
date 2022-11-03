// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require bootstrap
//= require trix
//= require actiontext
//= require popper
//= require jquery3
//= require jquery_ujs
//= require_tree .
//= require_self


$(document).ready(function(){

    $(document).on('ajax:success','[data-js-subject-form]', function(event, data, status, xhr){
        $('#subjects').html(xhr.responseText);
      });
    $(document).on('ajax:success','[data-js-user-form]', function(event, data, status, xhr){
        $('#users').html(xhr.responseText);
      });
    (function () {
    'use strict'
    
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
            })
    })()
});
