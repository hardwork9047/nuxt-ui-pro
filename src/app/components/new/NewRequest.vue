<script setup lang="ts">
import { ref } from 'vue'

// ✅ ローディング状態
const isLoading = ref(false)

// ✅ エラーメッセージ
const errorMessage = ref<string | null>(null)

// ✅ 取得したレスポンスデータ
const responseData = ref<any | null>(null)

// ✅ データを送信する関数
async function sendRequestServerApiMock() {
  errorMessage.value = null // エラーをリセット
  responseData.value = null // レスポンスをリセット
  isLoading.value = true    // ローディング開始

  try {
    const response = await fetch('/api/mock', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ message: 'Hello from Vue!' })
    })

    if (!response.ok) {
      throw new Error('Failed to save data.')
    }

    responseData.value = await response.json() // ✅ レスポンスを state に保存
    console.log('✅ Success:', responseData.value)
  } catch (error) {
    console.error('❌ Error:', error)
    errorMessage.value = (error as Error).message
  } finally {
    isLoading.value = false // ローディング終了
  }
}
</script>

<template>
  <div class="p-4">
    <h1 class="text-2xl font-bold mb-4">リクエストを送るボタン</h1>

    <div class="flex justify-start gap-10 p-4">
      <UButton
        label="POST server/api/mock"
        color="black"
        :loading="isLoading"
        @click="sendRequestServerApiMock"
      />
      <UButton
        label="POST ext-api"
        color="black"
        :loading="isLoading"
        @click="sendRequestServerApiMock"
      />
      <UButton
        label="POST server/api/ext-api by requesting to ext-api"
        color="black"
      />

    </div>

    <!-- エラー表示 -->
    <div class="p-4">
      <p v-if="errorMessage" class="text-red-500 mt-2">{{ errorMessage }}</p>

      <!-- レスポンスデータ表示 -->
      <div v-if="responseData" class="mt-4 p-4 border border-gray-300 rounded">
        <h2 class="text-lg font-bold">Response Data:</h2>
        <pre class="text-sm text-white-700">{{ responseData }}</pre>
      </div>
    </div>
  </div>
</template>
