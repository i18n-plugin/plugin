<template lang="pug">
b.scroll(@&b)
  div
    .bar(@&bar)
      slot
  aside(@&aside @pointerdown=click class:s=turn)
    i(@&si @pointerdown=down)
</template>


<script lang="coffee">
> lodash-es/debounce
  @8n/on:On
  svelte > tick

+ b, aside, bar, si, turn, pointerunbind, timer

SCROLL_CLS = "scroll"

click = ({clientY})=>
  {
    top
    height
  } = aside.getBoundingClientRect()
  {clientHeight} = si
  b.scrollTop = Math.round(
    b.scrollHeight *
    Math.max(
      Math.min(
        (clientY - top - clientHeight/2) / (height - clientHeight)
        1
      )
      0
    )
  ) - height
  return

down = (e)=>
  if pointerunbind
    return
  {body} = document
  body.setPointerCapture(e.pointerId)
  for i from [body, aside]
    i.classList.add(SCROLL_CLS)

  + unbind
  pointerunbind = =>
    for i from [body, aside]
      i.classList.remove(SCROLL_CLS)
    unbind()
    pointerunbind = undefined
    return

  unbind = On body, {
    lostpointercapture: pointerunbind
    pointerup: pointerunbind
    pointermove: click
  }
  return
#       mv = b.value
#       sv = si.value
#       _diff = 0
#       Y = e.screenY
#       _pointerunbind = _on HTML,{
#         lostpointercapture:pointerunbind
#         pointerup:pointerunbind
#         pointermove:({screenY})=>
#           {clientHeight,scrollHeight} = mv
#           diff = screenY - Y
#
#           mv.scrollTop += diff/clientHeight*scrollHeight
#           Y = screenY
#
#           return
#       }
  return

retop = (height)=>
  if not turn
    return
  av.style.opacity = 1
  ch = b.clientHeight
  si.style.top = (3 + Math.round( (ch - (height or si.offsetHeight) - 6) * b.scrollTop  / (bar.scrollHeight - ch) )) + 'px'
  clearTimeout timer
  timer = setTimeout(
    =>
      aside.style.opacity = 0
    1000
  )
  return

onMount =>
  ob = new ResizeObserver(
    debounce(
      (entry)=>
        {clientHeight:ch} = b
        {scrollHeight:sh} = bar
        turn = ch < sh
        if turn
          await tick()
          height = Math.max(16,Math.round(ch*ch/sh))
          si.style.height = height + 'px'
          retop(height) # 因为有 transition 的延时，高度不会立刻改变，所以这里传入
        return
      100
    )
  )
  [
    b
    bar
    aside # 顶部条下滑的时候，只有这个会改变尺寸
  ].forEach (i)=>ob.observe i

  unbind = On(
    b
    scroll:=>
      retop()
      return
  )

  =>
    unbind()
    pointerunbind?()
    ob.disconnect()
    return

# import $on from '~/lib/on.coffee'
# import _on from '~/lib/_on.coffee'
#
# Scroll = (elem) =>
#   runing = 0
#   {requestAnimationFrame, cancelAnimationFrame} = window
#   (to, duration=300)=>
#     cancelAnimationFrame runing
#     scrollCount = 0
#     cosParameter = (elem.scrollTop - to) / 2
#     toCos = to+cosParameter
#     oldTimestamp = 0
#     step = (newTimestamp) ->
#       if oldTimestamp
#         # if duration is 0 scrollCount will be Infinity
#         scrollCount += Math.PI * (newTimestamp - oldTimestamp) / duration
#         if scrollCount >= Math.PI
#           elem.scrollTop = to
#           return
#         elem.scrollTop = toCos + cosParameter * Math.cos(scrollCount)
#       oldTimestamp = newTimestamp
#       runing = requestAnimationFrame step
#       return
#
#     if elem.scrollTop == to
#       return
#     runing = requestAnimationFrame step
#     return
#
# SCROLL_CLS = "scroll"
# HTML = document.documentElement
# export default {
# setup:=>
#   b = shallowRef()
#   bar = shallowRef()
#   si = shallowRef()
#   aside = shallowRef()
#   scrollTo = undefined
#   turn = ref 0
#
#   _pointerunbind = undefined
#   pointerunbind = =>
#     for i from [HTML, aside.value]
#       i?.classList.remove(SCROLL_CLS)
#     _pointerunbind?()
#     _pointerunbind = undefined
#     return
#
#   timer = undefined
#
#   onUnmounted pointerunbind
#
#   onMounted =>
#     mv = b.value
#     wv = bar.value
#     scrollTo = Scroll mv
#     scroll = =>
#       if not turn.value
#         return
#       {clientHeight,scrollHeight,scrollTop} = mv
#       height = Math.max(parseInt(clientHeight*clientHeight/scrollHeight)-4,48)
#       iv = si.value
#       av = aside.value
#       av.style.opacity = 1
#       top = parseInt(scrollTop/(scrollHeight-clientHeight)*(clientHeight-4-height))
#
#       Object.assign(
#         iv.style
#         {
#           height : height+"px"
#           top:top+"px"
#         }
#       )
#       clearTimeout timer
#       timer = setTimeout(
#         =>
#           av.style.opacity = 0
#         1000
#       )
#       return
#     resize = =>
#       {clientHeight,scrollHeight} = mv
#       if scrollHeight <= clientHeight
#         turn.value = 0
#       else
#         turn.value = 1
#       nextTick scroll
#     ro = new ResizeObserver resize
#     ro.observe wv
#     $on(
#       mv
#       {
#         scroll
#       }
#     )
#     $on(
#       window
#       {
#         resize
#       }
#     )
#     onUnmounted =>
#       ro.disconnect()
#       pointerunbind()
#     return
#
#   {
#     turn
#     b
#     si
#     aside
#     bar
#     click:(e)=>
#       mv = b.value
#       {clientHeight,scrollHeight} = mv
#       scrollTo parseInt(e.offsetY/clientHeight * (scrollHeight-clientHeight))
#       return
#     down:(e)=>
#       HTML.setPointerCapture(e.pointerId)
#       for i from [HTML, aside.value]
#         i?.classList.add(SCROLL_CLS)
#       mv = b.value
#       sv = si.value
#       _diff = 0
#       Y = e.screenY
#       _pointerunbind = _on HTML,{
#         lostpointercapture:pointerunbind
#         pointerup:pointerunbind
#         pointermove:({screenY})=>
#           {clientHeight,scrollHeight} = mv
#           diff = screenY - Y
#
#           mv.scrollTop += diff/clientHeight*scrollHeight
#           Y = screenY
#
#           return
#       }
#   }
# }
</script>

<style lang="stylus">
// html.scroll
// cursor url(':/cursor/grab.svg'), grab
b
  display flex
  overflow auto
  scrollbar-width none
  -ms-overflow-style none

b::-webkit-scrollbar
  width 0

b>div
  height 100%
  margin auto
  position absolute

b>div>div
  align-items center
  display flex
  flex-direction column
  min-height 100%
  width 100%

b>aside
  bottom 0
  display none
  height 100%
  left 100%
  position sticky
  top 0
  user-select none
  width 13px
  z-index 999

  &.s
    display block

  &, &>i
    transition all 0.2s, opacity 1s, box-shadow 1s

  &>i
    background rgba(125, 125, 125, 0.6)
    border-radius 3px
    display block
    position absolute
    right 3px
    width 7px

b
  &>div
    width 100%

  &>aside:hover, &>:global(.scroll)
    background rgba(0, 0, 0, 0.05)
    box-shadow inset 3px 0 3px -3px rgba(0, 0, 0, 0.3), inset -3px 0 3px -3px rgba(0, 0, 0, 0.05)
    opacity 1 !important

  &>aside:hover
    width 21px

    &>i
      background rgba(125, 125, 125, 0.8)
      right 6px
      width 9px

:global(body.scroll)
  cursor var(--svgGrab) 8 7, pointer
</style>
