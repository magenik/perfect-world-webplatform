$(document).ready(function(){
	$("form#main_input_box").submit(function(event){
		event.preventDefault();
		var deleteButton = " <a href='' class='tododelete redcolor'><span class='glyphicon glyphicon-trash'></span></a>";
		var striks =" | ";
		var editButton = "<a href='' class='todoedit'><span class='glyphicon glyphicon-pencil'></span></a>";
		var checkBox = "<p><input type='checkbox' class='striked ' autocomplete='off' /></p>";
		var twoButtons = "<div class='col-md-4 col-sm-4 col-xs-4  pull-right showbtns todoitembtns'>" + editButton + striks + deleteButton + "</div>";

		$(".list_of_items").append("<div class='todolist_list showactions list1'>  " + "<div class='col-md-8 col-sm-8 col-xs-8 nopadmar custom_textbox1'> <div class='todoitemcheck'>" + checkBox +"</div>" + "<div class='todotext todoitemjs'>" + $("#custom_textbox").val() + "</div> </div>" +  twoButtons );
		$("#custom_textbox").val('');
	});

});

$(document).on('click', '.tododelete', function (e) {
    e.preventDefault();
    $(this).closest('.todolist_list').remove();
});
$(document).on('click', '.striked', function (e) {
	$(this).closest('.todolist_list').find('.todotext').toggleClass('strikethrough');
	$(this).closest('.todolist_list').find('.showbtns').toggle();
});

$(document).on('click', '.todoedit', function (e) {
	e.preventDefault();
	if($(this).text() == " ")
	{
		$(this).closest('.todolist_list').find(".showbtns").toggleClass("opacityfull");
		var text1 = $(this).closest('.todolist_list').find("input[type='text'][name='text']").val();
		if(text1 === '') {
			alert('Come on! you can\'t create a todo without title');
			$(this).closest('.todolist_list').find("input[type='text'][name='text']").focus();
			
			return;
		}
		$(this).closest('.todolist_list').find('.todotext').html(text1);
		$(this).html("<span class='glyphicon glyphicon-pencil'></span> ");
		$(this).closest('.todolist_list').find(".showbtns").toggleClass("opacityfull");
		return;
	}
   
    var text = ''; 
	text = $(this).closest('.todolist_list').find('.todotext').text();
	text = "<input type='text' name='text' value='"+text+"' onkeypress='return event.keyCode != 13;' />";
	$(this).closest('.todolist_list').find('.todotext').html(text);
	$(this).html("<span class='glyphicon glyphicon-saved'></span> <span class='hidden-xs'></span>");
	text = '';
	return;
});
