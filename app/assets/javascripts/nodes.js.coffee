$ ->
	$("#tree").treetable
	  expandable: true
	  onNodeCollapse: ->
	    node = this
	    $("#tree").treetable "unloadBranch", node

	  onNodeExpand: ->
	    node = this
	    
	    # Render loader/spinner while loading
	    # Must be false, otherwise loadBranch happens after showChildren?
	    $.ajax(
	      async: false
	      url: "/nodes/" + node.id + "/children"
	    ).done (html) ->
	      rows = $(html).filter("tr")
	      $("#tree").treetable "loadBranch", node, rows
