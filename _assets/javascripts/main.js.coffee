((i, s, o, g, r, a, m) ->
  i['GoogleAnalyticsObject'] = r
  i[r] = i[r] or ->
    (i[r].q = i[r].q or []).push arguments
    return

  i[r].l = 1 * new Date
  a = s.createElement(o)
  m = s.getElementsByTagName(o)[0]
  a.async = 1
  a.src = g
  m.parentNode.insertBefore a, m
  return
) window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga'
ga 'create', 'UA-22476943-5', 'auto'
ga 'send', 'pageview'

##

((e, b) ->
  if !b.__SV
    a = undefined
    f = undefined
    i = undefined
    g = undefined
    window.mixpanel = b
    b._i = []

    b.init = (a, e, d) ->
      `var f`
      c = b

      f = (b, h) ->
        `var a`
        a = h.split('.')
        2 == a.length and b = b[a[0]]
        h = a[1]

        b[h] = ->
          b.push [ h ].concat(Array::slice.call(arguments, 0))
          return

        return

      if 'undefined' != typeof d then (c = b[d] = []) else (d = 'mixpanel')
      c.people = c.people or []

      c.toString = (b) ->
        `var a`
        a = 'mixpanel'
        'mixpanel' != d and (a += '.' + d)
        b or (a += ' (stub)')
        a

      c.people.toString = ->
        c.toString(1) + '.people (stub)'

      i = 'disable time_event track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config people.set people.set_once people.increment people.append people.union people.track_charge people.clear_charges people.delete_user'.split(' ')
      while g < i.length
        f c, i[g]
        g++
      b._i.push [
        a
        e
        d
      ]
      return

    b.__SV = 1.2
    a = e.createElement('script')
    a.type = 'text/javascript'
    a.async = !0
    a.src = if 'undefined' != typeof MIXPANEL_CUSTOM_LIB_URL then MIXPANEL_CUSTOM_LIB_URL else if 'file:' == e.location.protocol and '//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js'.match(/^\/\//) then 'https://cdn.mxpnl.com/libs/mixpanel-2-latest.min.js' else '//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js'
    f = e.getElementsByTagName('script')[0]
    f.parentNode.insertBefore a, f
  return
) document, window.mixpanel or []
mixpanel.init '85eac66e9651a2cd1440230c30615da0'

$ ->

  $(".timer").typed({
    strings: ["Second", "Minute", "Hour", "Day"]
    startDelay: 1200
    typeSpeed: 100
    backSpeed: 30
    backDelay: 700
        })
