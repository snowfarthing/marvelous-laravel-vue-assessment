<script>
import MarvelousQueryForm from './MarvelousQueryForm.vue'

export default {
    components: {
        MarvelousQueryForm
    },
    setup: () => ({
        title: 'A Marvelous Little App - Alpheus Madsen'
    })
}
</script>

<template>
    <h1>{{ title }}</h1>

    <MarvelousQueryForm />
</template>
