> ./route.js:@ > nowUrl

export FUNC = new Map

< (callback) =>
  route (url)=>
    args = FUNC.get url
    if args
      callback url, ...args
      return 1
    return

  (url, args...)=>
    FUNC.set url, args
    if nowUrl() == url
      callback url, ...args
    return
