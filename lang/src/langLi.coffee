#!/usr/bin/env coffee

> @w5/pair
  ~/lib/fBinMd.js
  @w5/utf8/utf8d.js
  ./index.js > set

< =>
  LI = []
  bin = await fBinMd 'lang'
  pre = 0
  for i, pos in bin
    if i == 0
      LI.push utf8d bin.slice(pre,pos)
      pre = pos+1
  LI.push utf8d bin.slice(pre)
  LI = pair LI
  s = new Set
  for [code] from LI
    s.add code

  {LANG} = localStorage
  if not s.has LANG
    for i from navigator.languages
      if s.has i
        LANG = i
        break
      l = i.slice(0,i.indexOf('-'))
      if s.has l
        LANG = l
        break
    if not LANG
      LANG = 'en'
  set LANG
  return [LANG, LI]
