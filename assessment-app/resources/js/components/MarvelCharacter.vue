<template>
    <div v-if="character">
        <div v-if="character.thumbnail"><img :src="character.thumbnail.path+'.'+character.thumbnail.extension" :alt="'Image of '+character.name" style="width:50px;"/></div>
        <div>ID:  {{ character.id }}</div>
        <div>Name:  {{ character.name }}</div>
        <div v-if="character.description">Description:  <div style="display:inline;" v-html="character.description"/></div>

        <div v-if="character.comics">
            <div v-for="comic in character.comics.items">
                <a :href="comic.resourceURI">{{ comic.name }}</a>
            </div>
        </div>

        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
</template>

<script>
    export default {
        props: {
            character: {},
        },
    };
</script>
