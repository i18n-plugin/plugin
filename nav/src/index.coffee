> ./route.js

export FUNC = new Map

< (callback) =>
  (url, func, args)=>
    FUNC.set url, [ func, args ]
    return

  route (url)=>
    fa = FUNC.get url
    if fa
      [func, args] = fa
      callback func, args, url
    return
  return
