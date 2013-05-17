 $(function(){
    $('#join-project').click(function(event){
      event.preventDefault();
      var $this = $(this);
      $this.html("joining...");
      $.post(
        '/project_roles.json', { 
        	'project_role' : {
	          'user_id': role_user,
	          'project_id': role_project }
        }, function (event) {
          // $('#notice').append("Joined Project").fadeOut(2000);
          $this.html("Joined").off();
          // $this.attr('disabled', 'enabled').attr('id', 'leave-project').html("Leave");
        }
      );
    });

    $('#leave-project').click(function(event){
      event.preventDefault();
      var $this = $(this);
      $this.html("Leaving...");
      $.ajax({
        url : '/project_roles/' + role_id +'.json', 
        type : 'DELETE',
        data : { 
          'project_role' : {
		      'user_id': role_user,
		      'id': role_id,
		      'project_id': role_project
		  }
        }
      }).done(function (msg) {
          // $('#notice').append("Left Project").fadeOut(2000);
          $this.html("Left").off();
      	  // $this.attr('disabled', 'enabled').attr('id', 'join-project').html("Join");
        }
      );
    });
})