<script lang="coffee">
> ./index.js > set
  ./langLi.js
  @8n/on:On
  @8n/minw
  svelte > tick

LI = []
W = 'w'

+ LANG, e, d, lang, b

onI18n (o)=>
  {lang} = o
  return

onMount =>
  [LANG, LI] = await langLi()
  e.classList.remove W
  + unbind
  On(
    e
    click:=>
      unbind?()
      setTimeout(
        =>
          unbind = On(
            document.body
            click: =>
              d = 0
              unbind()
              return
          )
          return
      )
      d = !d
      if d
        await tick()
        maxHeight = document.body.clientHeight * 0.7 - 23
        rect =  b.getBoundingClientRect()
        if rect.height > maxHeight
          sum = 0
          n = 0
          ali = b.getElementsByTagName('a')
          for i from ali
            sum += i.clientWidth
            ++n
          area = (sum + 7*(n-1)) * (7+ali[0].clientHeight)
          w =  Math.min(
            rect.right
            Math.round Math.max(
              Math.sqrt(area) + 70
              area / maxHeight
            )
          )
          b.style="width:#{w}px;flex-wrap:wrap;flex-direction:row-reverse"
          b.style.width = minw(b) + 2 +'px'
      return
  )

c = (l)=>
  e.classList.add W
  localStorage.LANG = LANG = l
  await set l
  e.classList.remove W
  return
</script>

<template lang="pug">
i
  m-c.w(title:lang @&e)
  +if d
    b(@&b)
      +each LI as i
        a(@click={c(i[0])} class:n={i[0]==LANG}) {i[1]}
</template>

<style lang="stylus">
m-c
  background-image var(--svgLang)

  &.w
    background-image var(--svgWait)
    background-size 30px

i
  font-style normal
  max-width 600px
  position relative

b
  background #fff
  border 1px solid #eee
  box-sizing border-box
  flex-direction column
  font-size 14px
  justify-content space-between
  padding 14px 14px 7px 21px
  position absolute
  right -18px
  top 30px

  &>a
    border-bottom 1px dashed #ccc
    color #666
    margin 0 7px 7px 0
    user-select none
    white-space nowrap

    &.n
      border-bottom 2px solid #000
      color #000
      font-weight 600

    &:hover
      border-color #f40
      color #f40
</style>

