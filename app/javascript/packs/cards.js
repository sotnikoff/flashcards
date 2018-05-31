import Vue from 'vue'
import Answer from '../Answer.vue'

document.addEventListener('DOMContentLoaded', () => {
    const el = document.getElementById('answers')
    const app = new Vue({
        el,
        render: h => h(Answer)
    })

    console.log(app)
})
