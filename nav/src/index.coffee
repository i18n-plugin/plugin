> ./route.js:@ > nowUrl
  @w5/split

export FUNC = new Map

export splitSlash = (url)=>
  split(url,'/')[0]

< (callback) =>
  notFound = =>

  route (url)=>
    args = FUNC.get splitSlash(url)
    if args
      callback url, ...args
      return
    notFound()
    return

  [
    # set route
    (url, args...)=>
      FUNC.set url, args
      if splitSlash(nowUrl()) == url
        callback url, ...args
        notFound = 0
      return

    # clear route
    =>
      FUNC.clear()
      notFound = 1
      return

    # set no found
    (func)=>
      if notFound
        func()
      notFound = func
      return
  ]
