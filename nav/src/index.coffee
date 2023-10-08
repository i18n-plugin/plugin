> ./route.js:@ > nowUrl
  @w5/split

export FUNC = new Map

< (callback, http404) =>
  route (url)=>
    args = FUNC.get split(url,'/')[0]
    if args
      callback url, ...args
      return
    http404()
    return

  [
    (url, args...)=>
      FUNC.set url, args
      if nowUrl() == url
        callback url, ...args
      return
    =>
      FUNC.clear()
      return
  ]
