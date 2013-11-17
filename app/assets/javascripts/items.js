jQuery.fn.submitOnCheck = function() {
  this.find('input[type=submit]').click(function() {
    $(this).parent('form').submit();
    $(this).remove();
  });
  return this;
}

$(function() {
   $('.edit_item').submitOnCheck();
});
