
"     'title': {
"       'de': u'hans',
"       'en': u'john'
"     },
" in
"     'title': _(u'hans', 'frontend'),
" umwandeln
/'\(title\|desc\|longdesc\)':


"     'desc': u'hans',
" in 
"     'desc': {
"       'de': u'hans',
"       'en': u''
"     },
" umwandeln
/\('desc'\|'longdesc'\):


" Wrap visual selection with gettext call and mako tag 
xi${_(u'pa', 'frontend')}

"
"     'images': ['hans', '' ,''
"                '', ''],
" in 
"     'image': 'hans',
/'images':

" wrap tag content with mako i18n
diti${_(u'pa', 'vanda')}

" wrap visual selection with mako i18n
di${_(u'pa', 'vanda')}
di${_(pa, 'vanda')}
di_(pa, 'vanda')