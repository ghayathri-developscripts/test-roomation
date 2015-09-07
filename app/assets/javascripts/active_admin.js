//= require active_admin/base
//= require_tree ./common
//= require application/helpers
//= require jquery_nested_form

var sendSortRequestOfModel;

sendSortRequestOfModel = function(model_name) {
  var formData;
  formData = $('#' + model_name + ' tbody').sortable('serialize');
  formData += "&" + $('meta[name=csrf-param]').attr("content") + "=" + encodeURIComponent($('meta[name=csrf-token]').attr("content"));
  return $.ajax({
    type: 'post',
    data: formData,
    dataType: 'script',
    url: '/admin/' + model_name + '/sort'
  });
};

jQuery(function($) {
  if ($('body.admin_galleries.index').length) {
    $("#galleries tbody").disableSelection();
    return $("#galleries tbody").sortable({
      axis: 'y',
      cursor: 'move',
      update: function(event, ui) {
        return sendSortRequestOfModel("galleries");
      }
    });
  }
});