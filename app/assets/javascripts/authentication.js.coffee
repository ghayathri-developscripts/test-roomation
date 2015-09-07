class window.Authentication

  constructor: ->
    window.fbAsyncInit = () ->
      FB.init {
        appId   : '105481119581204', # temporary kludge
        status  : true,
        cookie  : true,
        logging : true,
        oauth   : true
      }

  process: ( redirect_to ) ->
    authResponse = FB.getAuthResponse({ scope: 'email, offline_access' })
    if authResponse then this.sendRequest redirect_to else this.login redirect_to, true

  login: (redirect_to, should_do_auth_request) ->
    should_do_auth_request = should_do_auth_request || false

    FB.login (response) =>
      if response.authResponse
        if should_do_auth_request
          this.sendRequest()
        window.location.href = redirect_to

    , { scope : 'email, offline_access' }


  sendRequest: (redirect_to) ->
    redirect_to = redirect_to || false
    $.ajax {
      url: '/',
      dataType: 'json',
      data: {},
      async: false,
      success: (data) =>
        if redirect_to
          window.location.href = redirect_to
        return data
      ,
    }

  check: ->
    $(document).on 'click', '#fb-sign-in', (event) =>
      this.process '/', () =>
        this.login '/', false
