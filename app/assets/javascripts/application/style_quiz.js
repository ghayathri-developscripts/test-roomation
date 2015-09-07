$.namespace("$.style_quiz");

$.style_quiz.showQuizModal = function() {
  $('#quizModal').modal('show');
}

$.style_quiz.initQuiz = function(groups_count, selected_group) {
  $('#quiz-questions').flexslider({
    animation: 'fade',
    directionNav: false,
    slideshow: false
  });
  $('#quiz-questions').flexslider(parseInt(selected_group));
  var updateSelectedCount = function(element) {
    var count = $('#quiz-questions input:checked').length;
    if(count < groups_count) {
      $('#quiz-questions').flexslider("next");
    } else if($('#completeMessage').length !== 0) {
      $('#quiz').fadeToggle(400, function(){
        $('#completeMessage').removeClass('hide');
      });
    } else {
      $("#quizModal").spin();
      $(element).closest('form').submit();
    }
  };
  $('.decorator').click(function(e) {
    e.preventDefault();
    var checkbox = $(this).find('input');
    checkbox.attr('checked', 'checked');
    updateSelectedCount(this);
  });
  $('#quiz a').click(function() {
    return false;
  });
}

$.style_quiz.initQuizReveal = function() {
  $('.quiz-show-modal').click(function(e) {
    e.preventDefault();
    $("#quizModal").modal('hide');
    $($(this).attr('href')).modal('show');
  });
}

$.style_quiz.initQuizPrompt = function() {
  $('#start_quiz').click(function(e) {
    e.preventDefault();
    $("#quizModal").spin();
    $.get("/style_polls/new");
  });
}

$.style_quiz.updateQuizContent = function(title, bodyContent, classToAdd) {
  var modal = $("#quizModal");
  modal.addClass(classToAdd);
  modal.spin(false);
  modal.find('#quiz-title').html(title);
  modal.find('.modal-body').html(bodyContent);
}

$(document).ready(function(){
  $("#free_plan").on("click", function(e){
    e.preventDefault();
    $('#show_me').removeClass('pboxact');
    $('#guide_me').removeClass('pboxact');
    $('#free_plan').addClass('pboxact');
    plan_name = $("#free_plan").data( "plan-name" );
    free_plan_content = $('#free_plan_content').html();
    selection_content = $('#free_me_div').html();
    $('#free_plan_content').html(selection_content);
  });

  $("#guide_me_plan").on("click", function(e){
    e.preventDefault();
    $('#free_plan').removeClass('pboxact');
    $('#show_me').removeClass('pboxact');
    $('#guide_me').addClass('pboxact');
    plan_name = $("#guide_me_plan").data( "plan-name" )
    guide_me_content = $('#guide_me_content').html();
    selection_content = $('#guide_me_div').html();
    $('#guide_me_content').html(selection_content);
  });

  $("#show_me_plan").on("click", function(e){
    e.preventDefault();
    $('#free_plan').removeClass('pboxact');
    $('#guide_me').removeClass('pboxact');
    $('#show_me').addClass('pboxact');
    plan_name = $("#show_me_plan").data( "plan-name" )
     show_me_content = $('#show_me_content').html();
    selection_content = $('#show_me_div').html();
    $('#show_me_content').html(selection_content);
  });

});