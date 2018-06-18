import Vue from 'vue'
import Answer from '../Answer.vue'
import VueResource from 'vue-resource'

document.addEventListener('DOMContentLoaded', () => {
    const el = document.getElementById('answers')
    Vue.use(VueResource)
    Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    new Vue({
        el,
        render: h => h(Answer)
    })
})
