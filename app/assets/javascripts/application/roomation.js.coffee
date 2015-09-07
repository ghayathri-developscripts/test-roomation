
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('a.fancybox').fancybox type: 'ajax'

  $('#share-box').dcSocialShare
    location: 'top',
    offsetLocation: 0,
    offsetAlign: 0,
    width: 70,
    speedContent: 600,
    speedFloat: 1600,
    disableFloat: true,
    loadOpen:false,
    tabText: "<a href='#'>Tell a friend</a>",
    buttons: 'facebook,twitter,digg,buzz,stumbleupon,pinit,linkedin'

#  authentication = new Authentication()
#  authentication.check()


  # expandable blocks on Get Started page
  $('.expand-area').each (key, item) ->
    if ($(item).data('initial') != 'expanded')
      $("#" + $(item).data('target')).hide()

  $('.expand-area').click (event) ->
    event.preventDefault()
    $("#" + $(this).data('target')).toggle("fast")
    $(this).toggleClass('expanded')

  # Annotations to product on Home page
  if $('.b-project-sample').length != 0
    $('.b-project-sample').addAnnotations(
      (annotation) ->
        $(document.createElement('a'))
          .attr({'id': annotation.image.title, href: annotation.image.href, target: '_blank'})
          .data({'image-src': annotation.image.src})
          .append($('<span class="' + (annotation.span_class || "orange-circle-note") + '"></span>'))
          .append($('<span id="' + annotation.image.title  + '-image" class="image" style="position: absolute; display: none; z-index: 100; width: ' + (annotation.width || '291') + 'px; top: ' + annotation.image.top  + 'px; left: ' + annotation.image.left + 'px;"><img src="' + annotation.image.src + '"></span>'))
          .mouseover ->
            $('#'+$(this).attr('id')+'-image').show()
          .mouseout ->
            $('#'+$(this).attr('id')+'-image').hide()
      [{
        x: 0.040983606557377046,
        y: 0.7982954545454546,
        image:
          src: 'assets/homepage/products/verona-bar.png',
          href: 'http://www.worldmarket.com/product/index.jsp?productId=3910254&green=11b7a4e3-5107-4293-88fa-62223b966e7a&clickid=mybuys_prod_cs', 
          top: -94,
          left: 22,
          title: 'buffet-table'},
       {
        x: 0.21106557377049182,
        y: 0.84375,
        image:
          src: 'assets/homepage/products/side-table.png',
          href: 'http://www.target.com/p/Manhattan-Side-Table/-/A-11114421',
          top: -187,
          left: -128,
          title: 'side-table'},
       {
        x: 0.4661885245901639,
        y: 0.8068181818181818,
        image:
          src: 'assets/homepage/products/console-table.png',
          href: 'http://www.target.com/p/Manhattan-Console-Table/-/A-11111208',
          top: -187,
          left: -128,
          title: 'console-table'},
       {
        x: 0.42827868852459017,
        y: 0.5397727272727273,
        image:
          src: 'assets/homepage/products/table-map.png',
          href: 'http://www.pier1.com/Catalog/HomeAccentsD%C3%A9cor/tabid/979/CategoryId/133/ProductId/871/ProductName/Iron-Rings-Lamps/language/en-US/Default.aspx',
          top: -94,
          left: 22,
          title: 'table-lamp'},
       {
        x: 0.3411885245901639,
        y: 0.4119318181818182,
        image:
          src: 'assets/homepage/products/chaise.png',
          href: 'http://www.target.com/p/Button-Tufted-Chaise-Settee-Peacock/-/A-10482471',
          top: -92,
          left: -280,
          title: 'chaise-couch'},
       {
        x: 0.5276639344262295,
        y: 0.12215909090909091,
        image:
          src: 'assets/homepage/products/tv.png',
          href: 'http://www.bestbuy.com/site/Sony+-+40%22+Class+-+LCD+-+1080p+-+60Hz+-+HDTV/4758352.p?id=1218523196571&skuId=4758352',
          top: 10,
          left: -135,
          title: 'tv'},
       {
        x: 0.6188524590163934,
        y: 0.45738636363636365,
        image:
          src: 'assets/homepage/products/dining-table.png',
          href: 'http://www.target.com/p/Carlyle-Counter-Height-Dining-Table-with-Butterfly-Leaf/-/A-10331307',
          top: -72,
          left: -265,
          title: 'dinning-table'},
       {
        x: 0.6506147540983607,
        y: 0.3181818181818182,
        image:
          src: 'assets/homepage/products/floor-lamp.png',
          href: 'http://www.pier1.com/Catalog/HomeAccentsD%C3%A9cor/tabid/979/CategoryId/133/ProductId/871/ProductName/Iron-Rings-Lamps/language/en-US/Default.aspx',
          top: -92,
          left: -280,
          title: 'floor-lamp'},
       {
        x: 0.8401639344262295,
        y: 0.13352272727272727,
        image:
          src: 'assets/homepage/products/art.png',
          href: 'http://www.bedbathandbeyond.com/product.asp?SKU=17458078',
          top: 10,
          left: -135,
          title: 'artwork'},
       {
        x: 0.9151639344262295,
        y: 0.83352272727272727,
        width: 300
        span_class: 'minimized-icon'
        image:
          src: 'assets/homepage/photo_of_before_home.jpg',
          href: '#',
          top: -117,
          left: -157,
          title: 'minimized-icon'}
      ]
    )

  $('.project_forward_link').click (event) ->
    event.preventDefault()
    $('.design_request').submit()

  $('.project_backward_link, .project_custom_step_link').click (event) ->
    event.preventDefault()
    window.location.href = $(this).attr('href')

  $('.contact-submit').click (event) ->
    event.preventDefault()
    $("#contact-us-form").spin('large', 'black')
    $.ajax({
      type: "POST",
      url: "/contact-us",
      data: $("#contact-us-form").serialize(),
      success: (data) ->
        $("#contact-us-form")[0].reset()
      complete: (data) ->
        $('#contact-us-result h3').html(data.responseText)
        $('#contact-us-result').modal('show')
        $("#contact-us-form").spin(false)
    })
  
  $('.contact-reset').click (event) ->
    event.preventDefault()
    $("#contact-us-form")[0].reset()
  
  $('.terms-window').click (event) ->
    event.preventDefault()
    link = $(this).attr('href')
    if link == undefined
      link = $(this).find('a').attr('href')
    return window.open(link, link.text, "menubar=no,toolbar=no,status=no")
    
  $('.room_continued_pics .img-block img').click (event) ->
    event.preventDefault()
    input = $(this).closest('.img-block').find('input')
    $(input).prop("checked", !$(input).attr("checked"))

  $('#get_started .shop-input span').click (event) ->
    event.preventDefault()
    input = $(this).prev()
    $(input).prop("checked", !$(input).attr("checked"))
