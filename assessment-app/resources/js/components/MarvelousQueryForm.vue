<template>
    <div>
        <h2>Search For</h2>

        <!-- form @submit.prevent="submitForm" v-if="!formSubmitted">
            <span>Character Name</span> <input v-model="first_name" type="text" placeholder="first name" /><br/>

            <input class="submit" type="submit" value="Submit" />

        </form -->

        <span>Character Name</span> <input v-model="character_name" type="text" placeholder="character name" @input="search" /><br/>

        <div v-if="character_name">&nbsp; &nbsp; &nbsp; &nbsp; Searching for Character {{ character_name }} -- search-count {{ search_count }}</div><br /><br />
    </div>
</template>

<script>
    // import MarvelousRecord from './MarvelousRecord.vue'

    export default {
        // components: {
        //   NpiRecord
        // },
        data() {
          return {
            character_name : '',
            search_count   : 0,
          };
        },
        methods: {
            submitForm() {
                this.formSubmitted = true

                fetch('/api/marvel_query', {
                    method:  'POST',
                    headers:  {
                       'Content-Type': 'application/json',
                    },
                    body:  JSON.stringify({
                    }),
                }).then(response => response.json())
                  .then(data => {
                      this.query_results = data['results']
                  })
                  .catch(err => console.log(err))
            },
            search() {
                if (this.character_name.length > 3) {
                    this.search_count += 1
                } else {
                    this.search_count = 0
                }
            },
        }
    }
</script>

