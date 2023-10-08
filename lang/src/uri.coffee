> ./index.js > onSet
  ~/lib/fBinMd.js
  @w5/msgpack > unpack

_hook = new Set

< (uri)=>
  onSet (lang)=>
    o = unpack await fBinMd(lang+'/'+uri)
    _hook.forEach (f)=>
      f o, lang
      return
    return
  (f)=>
    =>
      _hook.add f
      =>
        _hook.delete f
        return

