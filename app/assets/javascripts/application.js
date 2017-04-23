// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", function() {
    tinymce.remove();
    tinymce.init({
        height: '450',
        selector:'textarea#post_body',
        plugins: "codesample image media link code",
        toolbar: "undo redo | styleselect | bold italic link | codesample image media | code"
    });
})


!function ($) {

    // Le left-menu sign
    /* for older jquery version
     $('#left ul.nav li.parent > a > span.sign').click(function () {
     $(this).find('i:first').toggleClass("icon-minus");
     }); */

    $(document).on("click","#left ul.nav li.parent > a > span.sign", function(){
        $(this).find('i:first').toggleClass("icon-minus");
    });

    // Open Le current menu
    $("#left ul.nav li.parent.active > a > span.sign").find('i:first').addClass("icon-minus");
    $("#left ul.nav li.current").parents('ul.children').addClass("in");

}(window.jQuery);