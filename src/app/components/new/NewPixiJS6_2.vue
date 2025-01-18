<template>
  <div ref="pixiContainer" class="pixi-container"></div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import * as PIXI from 'pixi.js'

const pixiContainer = ref(null)

onMounted(() => {
  console.log("✅ PixiJS を手動でインポート:", PIXI)

  // PixiJS アプリケーションの作成
  const app = new PIXI.Application({
    width: 800,
    height: 600,
    backgroundColor: 0x1099bb,
  })

  if (pixiContainer.value) {
    console.log("✅ Pixi コンテナに canvas を追加")
    pixiContainer.value.appendChild(app.view)
  } else {
    console.error("❌ Pixi コンテナが見つかりません")
    return
  }

  // 🎨 四角形を描画
  const rectangle = new PIXI.Graphics()
  rectangle.beginFill(0xff0000) // 赤色
  rectangle.drawRect(100, 100, 200, 150) // x, y, width, height
  rectangle.endFill()
  app.stage.addChild(rectangle)

  console.log("✅ 四角形が追加されました")

  // 🎨 円を描画
  const circle = new PIXI.Graphics()
  circle.beginFill(0x00ff00) // 緑色
  circle.drawCircle(500, 300, 80) // x, y, radius
  circle.endFill()
  app.stage.addChild(circle)

  console.log("✅ 円が追加されました")

  // 画像のロード状況を監視
  const texture = PIXI.Texture.from('/images/image.png')
  texture.baseTexture.on('loaded', () => {
    console.log("✅ 画像が正常にロードされました")

    const sprite = new PIXI.Sprite(texture)
    sprite.anchor.set(0.5)
    sprite.x = app.screen.width / 2
    sprite.y = app.screen.height / 2
    app.stage.addChild(sprite)

    console.log("✅ スプライトがステージに追加されました:", sprite)
  })

  texture.baseTexture.on('error', () => {
    console.error("❌ 画像のロードに失敗しました。パスを確認してください:", '/images/image.png')
  })
})
</script>

<style>
.pixi-container {
  width: 800px;
  height: 600px;
  background-color: black;
}
</style>
