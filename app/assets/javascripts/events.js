$(function() {
  $('#events_search input').keyup(function() {
    $.get($("#events_search").action, $("#events_search").serialize(), function(data, status) {
      $('#events').html(data);
    }, "html");
    return false;
  });
})