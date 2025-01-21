<template>
  <h1 class="text-2xl font-bold mb-4">Canvas Reactive</h1>
  <div>
    <!-- <button @click="drawCircle">円を描く</button> -->
    <UButton
      label="Drow a circle"
      color="black"
      :loading="isLoading"
      @click="drawCircle"
    />
    <canvas ref="myCanvas" width="400" height="300"></canvas>
  </div>
</template>

<script setup>
import { onMounted, ref } from "vue";

const myCanvas = ref(null);
const ctx = ref(null);

onMounted(() => {
  if (myCanvas.value) {
    ctx.value = myCanvas.value.getContext("2d");
  }
});

const drawCircle = () => {
  if (!ctx.value) return;

  // クリア
  ctx.value.clearRect(0, 0, 400, 300);

  // 青い円を描画
  ctx.value.beginPath();
  ctx.value.arc(200, 150, 50, 0, Math.PI * 2);
  ctx.value.fillStyle = "blue";
  ctx.value.fill();
};
</script>

<style scoped>
canvas {
  border: 1px solid black;
}
</style>
