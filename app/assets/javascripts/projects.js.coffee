# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$('#users-autocomplete').typeahead({
    source: function (query, process) {
        names = [];
	    map = {};
	 
	    var data = typeaheaddata
	 
	    $.each(data, function (i, user) {
	        map[user.name] = user;
	        names.push(user.name);
	    });
	 
	    process(names);
	},
    updater: function (item) {
	    member = map[item].id;
		return item;
    },
    matcher: function (item) {
       if (item.toLowerCase().indexOf(this.query.trim().toLowerCase()) != -1) {
	        return true;
	    }
    }
});

