<template>
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
    backgroundColor: 0x1099bb, // 修正：background.color ではなく backgroundColor
  })

  if (pixiContainer.value) {
    console.log("✅ Pixi コンテナに canvas を追加")
    pixiContainer.value.appendChild(app.view) // 修正: app.view を使う
  } else {
    console.error("❌ Pixi コンテナが見つかりません")
    return
  }

  // 🎨 四角形を描画
  const rectangle = new Graphics()
  rectangle.beginFill(0xff0000) // 赤色
  rectangle.drawRect(100, 100, 200, 150) // x, y, width, height
  rectangle.endFill()
  app.stage.addChild(rectangle)

  console.log("✅ 四角形が追加されました")

  // 🎨 円を描画
  const circle = new Graphics()
  circle.beginFill(0x00ff00) // 緑色
  circle.drawCircle(500, 300, 80) // x, y, radius
  circle.endFill()
  app.stage.addChild(circle)

  console.log("✅ 円が追加されました")

  // 画像のロード状況を監視（PixiJS 7 では非同期読み込みが推奨）
  try {
    const texture = await Assets.load('/images/image.png')
    if (!texture) {
      throw new Error("画像のロードに失敗しました（テクスチャが null）")
    }

    console.log("✅ 画像が正常にロードされました")

    const sprite = new Sprite(texture)
    sprite.anchor.set(0.5)
    sprite.x = app.screen.width / 2
    sprite.y = app.screen.height / 2
    app.stage.addChild(sprite)

    console.log("✅ スプライトがステージに追加されました:", sprite)
  } catch (error) {
    console.error("❌ 画像のロードに失敗しました。パスを確認してください:", '/images/image.png', error)
  }
})
</script>

<style>
.pixi-container {
  width: 800px;
  height: 600px;
  background-color: black;
}
</style>
