> ./index.js > onSet
  ~/lib/fBinMd.js
  @w5/msgpack > unpack

_hook = new Set

< (uri)=>
  onSet (lang)=>
    o = unpack await fBinMd(lang+'/'+uri)
    _hook.forEach (f)=>
      f.call o[0], lang, ...o.slice(1)
      return
    return
  (f)=>
    =>
      _hook.add f
      =>
        _hook.delete f
        return

