<template>
  <div id="app">
    <Loading />
    <StaggeredLandinText />
    <Reveal />
    <Snow />
    <BtnHoverBorderStroke />
    <HeaderWithSlideBar />
  </div>
</template>

<script>
import Loading from './components/Loading.vue';
import StaggeredLandinText from './components/StaggeredLandinText.vue';
import Reveal from './components/Reveal.vue';
import Snow from './components/Snow.vue';
import BtnHoverBorderStroke from './components/BtnHoverBorderStroke.vue';
import HeaderWithSlideBar from './components/HeaderWithSlideBar.vue';

export default {
  name: 'app',
  components: {
    Loading,
    StaggeredLandinText,
    Reveal,
    Snow,
    BtnHoverBorderStroke,
    HeaderWithSlideBar,
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  padding: 20px;
}
#app > div {
  padding: 30px;
  margin: 20px 0;
}
</style>
