<template>
  <div class="wrap">
    <header>
      <h1 class="title">I'm alphardex.</h1>
      <p class="subtitle">A CSS Wizard</p>
    </header>
  </div>
</template>
<script>
export default {
  name: 'HeaderWithSlideBar'
}
</script>
<style lang="scss" scoped>
// palette: https://www.materialpalette.com/light-blue/pink

@import url("https://fonts.googleapis.com/css?family=Lato");
@import url("https://fonts.googleapis.com/css?family=Lora:400,400i,700");

.wrap {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: #222;
}

header {
  .title,
  .subtitle {
    position: relative;
    width: 250px;
    height: 30px;
    color: transparent;
    animation: fadeIn 2s 1.6s forwards;

    &::before {
      position: absolute;
      content: "";
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      transform: scaleX(0);
      transform-origin: left;
      animation: slideRight 2s cubic-bezier(0.75, 0, 0, 1) forwards;
    }
  }

  .title {
    margin: 0;
    font-family: Lora, serif;
    font-size: 32px;
    line-height: 30px;

    &::before {
      background: #FF4081;
    }
  }

  .subtitle {
    margin: 10px 0 0 0;
    font-family: Lato, sans-serif;
    font-size: 12px;
    line-height: 30px;
    letter-spacing: 5px;
    // text-transform CSS属性指定如何将元素的文本大写。
    // 它可以用于使文本显示为全大写或全小写，也可单独对每一个单词进行操作
    text-transform: uppercase;
    animation-delay: 3.2s;

    &::before {
      background: #03A9F4;
      animation-delay: 2s;
    }
  }
}

// @keyframes 规则通过在动画序列中定义关键帧（或waypoints）的样式来控制CSS动画序列中的中间步骤。
// 这比转换更能控制动画序列的中间步骤
@keyframes fadeIn {
  to {
    color: white;
  }
}

@keyframes slideRight {
  50% {
    transform: scaleX(1);
    transform-origin: left;
  }

  50.1% {
    transform-origin: right;
  }

  to {
    transform-origin: right;
  }
}

</style>