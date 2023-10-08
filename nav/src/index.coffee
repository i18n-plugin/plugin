> ./route.js:@ > nowUrl
  @w5/split

export FUNC = new Map

< (callback) =>
  route (url)=>
    args = FUNC.get split(url,'/')[0]
    if args
      callback url, ...args
      return
    return

  (url, args...)=>
    FUNC.set url, args
    if nowUrl() == url
      callback url, ...args
    return
