#!/usr/bin/env coffee

+ lang

_hook = new Set

< =>
  lang

< set = (l)=>
  document.documentElement.lang = lang = l
  Promise.allSettled [..._hook].map (f)=>
    f l

< onSet = (f)=>
  _hook.add f
  if lang
    f lang
  =>
    _hook.delete f
    return

