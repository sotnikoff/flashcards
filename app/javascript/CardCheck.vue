<template>
  <div v-if="card">
    <h1>{{ card.original_text }}</h1>
      <form class="col-lg-6" id="answers-form" accept-charset="UTF-8" method="post" v-on:submit.prevent="postAnswer">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Ваш ответ" v-model="answer" required="required">
        </div>
        <div class="form-group">
          <input type="submit" value="Ответить" class="btn btn-success" >
        </div>
      </form>
  </div>
</template>

<script>
  export default {
    data: function () {

      return {
        answer: null,
        card: null
      }
    },
    created: function () {
      this.getRandomCard()
    },
    methods: {
      postAnswer: function () {
        this.$http.post('/ru/answers', { answer: this.answer, id: this.card.id }).then(function () {
          this.getRandomCard()
            this.answer = null
        }, function () {
          console.log('error sending data')
        })
      },
      getRandomCard: function () {
        this.$http.get('/ru/cards/random_card').then(function (response) {
          this.card = response.body
        }, function () {
          console.log('error')
        })
      }
    }
  }
</script>
