import {createApp} from 'vue'
import { createPinia } from 'pinia'
import client from "@/pocketbase";

import  App from './App.vue'
import { pocketBaseSymbol } from "@/symbols/injectionSymbols"
import router from './router'

import './assets/grids.css';
import './assets/main.css';
import './assets/font/stylesheet.css';
// import './assets/test.css'`

const app = createApp(App)

app.use(createPinia())
app.use(router)

app.provide(pocketBaseSymbol, client) 

app.mount('#app')
