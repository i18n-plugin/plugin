#!/usr/bin/env coffee

> @konghayao/cn-font-split > fontSplit
  path > join
  zx/globals:
  @w5/uridir
  @w5/read
  @w5/write
  @w5/walk > walkRel
  fs > existsSync

fsplit = (FontPath, destFold)=>
  fontSplit {
    FontPath
    destFold
    targetType: 'woff2'
    chunkSize: 1024*512
    testHTML: true
    reporter: true
    threads: {}
  }

ROOT = uridir(import.meta)

cd ROOT

OTF = join ROOT, 'otf'
WOFF2 = join ROOT, 'woff2'

rename = (dst, from_name, to_name, weight=400)=>
  css_fp = join dst,'result.css'
  css = read css_fp
  css = css.replaceAll(
    'font-weight: 400;',"font-weight: #{weight};"
  ).replaceAll(
    '"'+from_name+'"'
    to_name
  ).replaceAll('local('+to_name+'),','')
  write(
    css_fp
    css
  )
  return

await do =>
  # await fsplit(
  #   join OTF,'TungstenCompressed-Light.ttf'
  #   join WOFF2,'v'
  # )

  dst = join WOFF2, 'h'

  await fsplit(
    join OTF,'AlimamaFangYuanTiVF-Thin.ttf'
    dst
  )

  rename dst, 'Alimama FangYuanTi VF', 'h', 700
  return

sinter = join OTF, 'sinter'

DIST = join WOFF2, 's'

await $"mkdir -p #{DIST}"

WEIGHT = {
  ExtraLight: 200
  Light: 300
  Regular: 400
  Normal: 400
  Medium: 500
  Bold: 700
  Heavy: 800
}

for await rfp from walkRel sinter
  if not rfp.endsWith '.otf'
    continue
  name = rfp.slice(0,-4)
  if name == 'Normal'
    # https://github.com/chiron-fonts/chiron-sans-hk/issues/13
    continue
  fp = join sinter, name+'.ttf'
  if not existsSync fp
    await $"otf2ttf #{join sinter,rfp}"

  weight_name = name.split('-').pop()
  weight = WEIGHT[weight_name]+''

  dst = join(DIST, weight)
  await fsplit fp, dst
  rename dst, 'Sinter '+weight_name, 's', weight

process.exit()
