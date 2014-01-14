$( document ).ready(function() {

  $(function() {
    $('#flash_notice, flash_warning').delay(500).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
    });
  });

  $('.delete_entry').bind('ajax:success', function() {
    $(this).closest('ul').fadeOut();
  });

  $('input:checkbox').click(function(e){
    $(this).closest('form').submit();
  });
});




