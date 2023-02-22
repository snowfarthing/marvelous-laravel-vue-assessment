<template>
    <div>
        <h2>Search For</h2>

        <span>Character Name</span> <input v-model="character_name" type="text" placeholder="character name" @input="search" /><br/>

        <div v-if="character_name">&nbsp; &nbsp; &nbsp; &nbsp; Searching for Character {{ character_name }}</div><br/><br/>

        <div>
            <ul>
                <li v-for="character in query_results" :key="character.id">
                    <input type="checkbox" @input="toggleFavorite(character)"/> Favorite
                    <MarvelCharacter :character="character"/>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
    import MarvelCharacter from './MarvelCharacter.vue'

    let favorites = {}

    export default {
        components: {
            MarvelCharacter,
        },
        data() {
          return {
            character_name : '',
            query_results  : '',
          };
        },
        methods: {
            search() {
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
            },
            toggleFavorite(elm) {
                if (elm.id in favorites) {
                    delete favorites[elm.id]
                } else {
                    favorites[elm.id] = elm
                }
            },
        }
    }
</script>

