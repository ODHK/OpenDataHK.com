 $(function(){
 	$projects = $('#projects .panel').clone()
	container = document.querySelector('#projects');
	pckry = new Packery( container, {
	    itemSelector: '.panel',
	    gutter: 25
	});

	// layout Packery after all images have loaded
	imagesLoaded( container, function() {
	  pckry.layout();
	});

 	$('nav.action-buttons').on('click', 'a', filter_projects)

 	inverted_staged = {
		'proposal' : 'shelved',
		'development' : 'inactive',
		'shelved' : 'proposal',
		'inactive' : 'development',
		'released' : null
 	}
	function filter_projects(){
		var $this = $(this);
		var stale = false;
		if ($this.hasClass('active')){
			var stage = inverted_staged[$this.data('stager')]
			stale = true;
		} else {
			var stage = $this.data('stager')
		}
		if (stage == null) {
			return
		}

		var $nav = $('nav.action-buttons');
    	
    	$nav.find('.active').removeClass('active stale')
    	if (stale){
    		$this.addClass('active stale')
    	} else {
    		$this.addClass('active')
    	}
    	
    	// console.log($("[data-stage='"+ stage+"']"))
    	// console.log( $projects.filter("[data-stage='"+ stage+"']"))
    	var panels = $projects.filter("[data-stage='"+ stage+"']")
		var fragment = document.createDocumentFragment();
    	panels.each(function(i, panel){
    		console.log(panel)
    		fragment.appendChild( panel );
    	})
    	pckry.remove( $('#projects .panel') );
    	container.appendChild( fragment )
    	pckry.appended( panels );
    	pckry.layout();
	}

	$('nav.action-buttons [data-stager="development"]').click()

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