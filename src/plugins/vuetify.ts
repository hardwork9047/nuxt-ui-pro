// plugins/vuetify.ts
import { createVuetify } from 'vuetify'
import 'vuetify/styles'

export default defineNuxtPlugin((nuxtApp) => {
  const vuetify = createVuetify({
    components: {}, // ← これを追加
    defaults: {
      VExpansionPanels: {
        variant: 'accordion'
      }
    }
  })
  nuxtApp.vueApp.use(vuetify)
})
