animation = ->
	$('#masonry-container').masonry({ 
	  isAnimated: true,
  	   
  animationOptions: {
    duration: 75,
    easing: 'linear',
    queue: true
  }

	});
$(document).ready(animation);
jQuery ->
	if $('#infinite-scrolling').size() > 0
		$(window).on 'scroll', ->
			more_posts_url = $('.pagination .next_page a').attr('href')
			if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height()-60
            	$.getScript more_posts_url
		return
return