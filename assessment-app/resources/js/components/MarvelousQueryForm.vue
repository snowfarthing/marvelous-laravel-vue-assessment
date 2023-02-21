<template>
    <div>
        <h2>Search For</h2>

        <!-- form @submit.prevent="submitForm" v-if="!formSubmitted">
            <span>Character Name</span> <input v-model="first_name" type="text" placeholder="first name" /><br/>

            <input class="submit" type="submit" value="Submit" />

        </form -->

        <span>Character Name</span> <input v-model="character_name" type="text" placeholder="character name" @input="search" /><br/>

        <div v-if="character_name">&nbsp; &nbsp; &nbsp; &nbsp; Searching for Character {{ character_name }} -- search-count {{ search_count }}</div><br /><br />

        <!-- div v-if="query_results">Query Results:  {{ query_results }}</div -->

        <div v-if="query_results">
            <ul>
                <li v-for="character in query_results" :key="character.id">
                    <input type="checkbox" @input="toggleFavorite(character.id)"/>
                    <MarvelCharacter :character="character"/>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
    import MarvelCharacter from './MarvelCharacter.vue'

    export default {
        components: {
            MarvelCharacter,
        },
        data() {
          return {
            character_name : '',
            search_count   : 0,
            query_results  : '',
          };
        },
        methods: {
            search() {
                if (this.character_name.length > 3) {
                    this.search_count += 1

                    fetch('/api/marvel_query', {
                        method:  'POST',
                        headers:  {
                           'Content-Type': 'application/json',
                        },
                        body:  JSON.stringify({
                            'character_name' : this.character_name,
                        }),
                    }).then(response => response.json())
                      .then(data => {
                          this.query_results = data['results']
                      })
                      .catch(err => console.log(err))
                } else {
                    this.search_count = 0
                }
            },
        }
    }
</script>

