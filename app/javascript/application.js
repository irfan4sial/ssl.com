// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', () => {
    // Add task dynamically
    $(document).on('click', '.add_fields', function(e) {
        // debugger
        // e.preventDefault();
        // const association = $(this).data('association');
        // const content = $(this).data('content');
        // $(`#${association}`).append(content);

        const time = new Date().getTime()
        const regexp = new RegExp($(this).data('id'), 'g')
        $(this).before($(this).data('fields').replace(regexp, time))
        e.preventDefault()
    });

    // Remove task dynamically
    $(document).on('click', '.remove_fields', function(e) {
        console.log("class Clikc:", e)
        // e.preventDefault();
        // $(this).prev('input[type=hidden]').val('1');
        // $(this).closest('.nested-fields').hide();
        $(this).prev('input[type=hidden]').val('1')
        $(this).closest('fieldset').hide()
        e.preventDefault()
    });
});