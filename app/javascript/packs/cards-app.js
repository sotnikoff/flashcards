import Vue from 'vue'
import CardCheck from '../CardCheck'
import VueResource from 'vue-resource'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('answers')
  Vue.use(VueResource)
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  new Vue({
    el,
      render: h => h(CardCheck)
    })
})
