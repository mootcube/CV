// NOTICE!! DO NOT USE ANY OF THIS JAVASCRIPT
// IT'S ALL JUST JUNK FOR OUR DOCS!
// ++++++++++++++++++++++++++++++++++++++++++

!function ($) {

    $(function(){

	var $window = $(window)

	// Disable certain links in docs
	$('section [href^=#]').click(function (e) {
	    e.preventDefault()
	})

	// side bar
	$('.bs-docs-sidenav').affix({
	    offset: {
		top: function () { return $window.width() <= 980 ? 140 : 210 }
		, bottom: 0
	    }
	})

	// make code pretty
	window.prettyPrint && prettyPrint()

	// add-ons
	$('.add-on :checkbox').on('click', function () {
	    var $this = $(this)
            , method = $this.attr('checked') ? 'addClass' : 'removeClass'
	    $(this).parents('.add-on')[method]('active')
	})

	// add tipsies to grid for scaffolding
	if ($('#gridSystem').length) {
	    $('#gridSystem').tooltip({
		selector: '.show-grid > div'
		, title: function () { return $(this).width() + 'px' }
	    })
	}
    })
}(window.jQuery)

