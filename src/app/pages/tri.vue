<script setup lang="ts">
import NewBackGround from '~/components/new/NewBackGround.vue'
import NewDropdown from '~/components/new/NewDropdown.vue'
import NewGrid from '~/components/new/NewGrid.vue'
import NewLine from '~/components/new/NewLine.vue'
import NewPixiJS7mod from '~/components/new/NewPixiJS7mod.vue'
import NewPixiJS7modAnimation from '~/components/new/NewPixiJS7modAnimation.vue'
import type { User } from '~/types'

const defaultColumns = [{
  key: 'id',
  label: '#'
}, {
  key: 'name',
  label: 'Name',
  sortable: true
}, {
  key: 'email',
  label: 'Email',
  sortable: true
}, {
  key: 'location',
  label: 'Location'
}, {
  key: 'status',
  label: 'Status'
}]

const q = ref('')
const selected = ref<User[]>([])
const selectedColumns = ref(defaultColumns)
const selectedStatuses = ref([])
const selectedLocations = ref([])
const sort = ref({ column: 'id', direction: 'asc' as const })
const input = ref<{ input: HTMLInputElement }>()
const isNewUserModalOpen = ref(false)

const columns = computed(() => defaultColumns.filter(column => selectedColumns.value.includes(column)))

const query = computed(() => ({ q: q.value, statuses: selectedStatuses.value, locations: selectedLocations.value, sort: sort.value.column, order: sort.value.direction }))

const { data: users, pending } = await useFetch<User[]>('/api/users', { query, default: () => [] })

const defaultLocations = users.value.reduce((acc, user) => {
  if (!acc.includes(user.location)) {
    acc.push(user.location)
  }
  return acc
}, [] as string[])

const defaultStatuses = users.value.reduce((acc, user) => {
  if (!acc.includes(user.status)) {
    acc.push(user.status)
  }
  return acc
}, [] as string[])

function onSelect(row: User) {
  const index = selected.value.findIndex(item => item.id === row.id)
  if (index === -1) {
    selected.value.push(row)
  } else {
    selected.value.splice(index, 1)
  }
}

defineShortcuts({
  '/': () => {
    input.value?.input?.focus()
  }
})
</script>

<template>
  <UDashboardPage class="h-screen flex">
    <UDashboardPanel grow class="h-full overflow-y-auto p-4">

      <NewRequest />
      <NewLine />
      <NewGrid />
      <NewLine />
      <NewDropdown />
      <NewLine />
      <NewBackGround />
      <NewLine />
      <!-- <NewPixiJS6 /> -->
      <!-- <NewLine /> -->
      <!-- <NewPixiJS6_2 /> -->
      <!-- <NewPixiJS7 /> -->
      <NewPixiJS7mod />
      <NewLine />
      <NewPixiJS7modAnimation />
      <!-- <NewPixiJS8 /> -->
      <NewLine />
      <NewCanvas />
      <NewLine />
      <NewCanvasAnimation />
      <NewLine />
      <NewCanvasReactive />
    </UDashboardPanel>
  </UDashboardPage>
</template>
