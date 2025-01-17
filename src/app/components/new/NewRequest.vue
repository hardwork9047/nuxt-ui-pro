<script setup lang="ts">
import { ref } from 'vue'

// ✅ ローディング状態
const isLoading = ref(false)

// ✅ エラーメッセージ
const errorMessage = ref<string | null>(null)

// ✅ データを送信する関数
async function sendRequest() {
  errorMessage.value = null // エラーをリセット
  isLoading.value = true    // ローディング開始

  try {
    const response = await fetch('/api/save', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ message: 'Hello from Vue!' })
    })

    if (!response.ok) {
      throw new Error('Failed to save data.')
    }

    console.log('✅ Success:', await response.json())
  } catch (error) {
    console.error('❌ Error:', error)
    errorMessage.value = (error as Error).message
  } finally {
    isLoading.value = false // ローディング終了
  }
}
</script>

<template>
  <div class="flex justify-start gap-10">
    <UButton
      label="Cancel"
      color="black"
    />
    <UButton
      label="Save"
      color="black"
      :loading="isLoading"
      @click="sendRequest"
    />
  </div>

  <!-- エラー表示 -->
  <p v-if="errorMessage" class="text-red-500 mt-2">{{ errorMessage }}</p>
</template>
