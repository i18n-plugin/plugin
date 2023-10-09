> ./index.js > onSet
  ~/lib/fBinMd.js
  @w5/msgpack > unpack

_hook = new Set

< (uri)=>
  + pre
  onSet (lang)=>
    o = unpack await fBinMd(lang+'/'+uri)
    _hook.forEach (f)=>
      f.apply lang, o
      return
    pre = [lang,o]
    return
  (f)=>
    =>
      _hook.add f
      if pre
        f.apply ...pre
      =>
        _hook.delete f
        return

