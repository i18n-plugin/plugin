<script lang="coffee">
> ./index.js > set
  ./langLi.js
  ./_.js:onI18n
  @w5/fall
  @8n/on:On
  @8p/title > setHostSlogan

LI = []
W = 'w'

+ LANG, e, d, lang

onMount =>
  [LANG, LI] = await langLi()
  e.classList.remove W
  + unbind
  fall(
    do onI18n (o)=>
      {lang} = o
      setHostSlogan o.host, o.slogan
      return
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
        return
    )
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
    b
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
  flex-direction row-reverse
  font-size 14px
  justify-content space-between
  padding 14px 21px 7px
  position absolute
  right -18px
  top 30px
  width 715px

  &>a
    border-bottom 1px dashed #ccc
    color #666
    margin 0 7px 7px 0
    user-select none

    &.n
      border-bottom 2px solid #000
      color #000
      font-weight 600

    &:hover
      border-color #f40
      color #f40
</style>

