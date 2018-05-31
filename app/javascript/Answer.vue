<template>
    <div>
        <h1>{{ text }}</h1>
        <form class="col-lg-6" id="answers-form" action="/ru/answers" accept-charset="UTF-8" method="post">
            <div class="form-group">
                <input type="text" name="answer" id="answer" class="form-control" placeholder="Ваш ответ" required="required">
            </div>
            <div class="form-group">
                <input type="submit" name="commit" value="Ответить" class="btn btn-success" data-disable-with="Ответить">
            </div>
        </form>
    </div>
</template>

<script>
    export default {
        data: function () {
            return {
                text: 'Default card name'
            }
        }
    }
</script>
