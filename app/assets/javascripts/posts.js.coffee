animation = ->
	$('#masonry-container').masonry({ 
	  isAnimated: true,
  	     
  animationOptions: {
    duration: 75,
    easing: 'linear',
    queue: true
  }

	});

jQuery ->
	if $('#infinite-scroll').size() > 0

		$(window).on 'scroll', ->
			more_posts_url = $('.pagination .next_page').attr('href')
			
			if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height()-50

				$.getScript more_posts_url
				$('.pagination').text("Fethcing more posts")