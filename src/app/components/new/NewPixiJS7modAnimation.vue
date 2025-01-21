<template>
  <h1 class="text-2xl font-bold mb-4">PixiJS 7 Animation</h1>
  <div ref="pixiContainer" class="pixi-container"></div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { Application, Graphics, Sprite, Assets } from 'pixi.js'

const pixiContainer = ref(null)

onMounted(async () => {
  console.log("✅ PixiJS を手動でインポート")

  // PixiJS アプリケーションの作成
  const app = new Application({
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

  // 🎨 四角形（左右移動）
  const rectangle = new Graphics()
  rectangle.beginFill(0xff0000)
  rectangle.drawRect(0, 0, 200, 150) // x, y, width, height
  rectangle.endFill()
  rectangle.x = 100
  rectangle.y = 200
  app.stage.addChild(rectangle)

  let rectSpeedX = 2

  // 🎨 円（上下バウンド）
  const circle = new Graphics()
  circle.beginFill(0x00ff00)
  circle.drawCircle(0, 0, 80)
  circle.endFill()
  circle.x = 500
  circle.y = 300
  app.stage.addChild(circle)

  let circleSpeedY = 3

  // 🎭 スプライト（画像・回転）
  let sprite = null
  try {
    const texture = await Assets.load('/images/image.png')
    sprite = new Sprite(texture)
    sprite.anchor.set(0.5)
    sprite.x = app.screen.width / 2
    sprite.y = app.screen.height / 2
    sprite.scale.set(0.5)
    app.stage.addChild(sprite)

    console.log("✅ スプライトがステージに追加されました:", sprite)
  } catch (error) {
    console.error("❌ 画像のロードに失敗しました。パスを確認してください:", '/images/image.png', error)
  }

  // 🎬 アニメーションループ
  app.ticker.add(() => {
    // 四角形を左右に移動
    rectangle.x += rectSpeedX
    if (rectangle.x <= 0 || rectangle.x + 200 >= app.screen.width) {
      rectSpeedX *= -1 // 端で反転
    }

    // 円を上下にバウンド
    circle.y += circleSpeedY
    if (circle.y - 80 <= 0 || circle.y + 80 >= app.screen.height) {
      circleSpeedY *= -1 // 端で反転
    }

    // スプライトを回転
    if (sprite) {
      sprite.rotation += 0.03
    }
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
