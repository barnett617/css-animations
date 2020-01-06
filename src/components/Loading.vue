<template>
  <div class="wrap">
    <div class="loading">
      <div class="dot"></div>
      <div class="dot"></div>
      <div class="dot"></div>
      <div class="dot"></div>
      <div class="dot"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Loading',
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.wrap {
  display: flex;
  height: 100vh;
  justify-content: center;
  align-items: center;
  text-align: center;
  background: #222;
}
.loading {
  // 声明颜色变量
  $colors: #7ef9ff, #89cff0, #4682b4, #0f52ba, #000080;
  display: flex;
  // 动画从何时开始，即从动画应用在元素上到动画开始的这段时间的长度
  animation-delay: 1s;

  .dot {
    position: relative;
    // 相对于父元素的字体的大小，区别于rem相对于根元素字体大小
    // Relative to the font-size of the element (2em means 2 times the size of the current font)
    width: 2em;
    height: 2em;
    margin: 0.8em;
    border-radius: 50%;

    // 伪元素，区别于伪类，比如":hover :active"等
    &::before {
      position: absolute;
      content: "";
      width: 100%;
      height: 100%;
      background: inherit;
      border-radius: inherit;
      /* 
        动画 属性顺序为：
        name(none) duration(0s) time-function(ease) delay(0s) 
        iteration-count(1) direction(normal) fill-mode(none) play-state(running)
      */
      animation: wave 2s ease-out infinite;
    }

    // scss语法
    @for $i from 1 through 5 {
      &:nth-child(#{$i}) {
        background: nth($colors, $i);

        &::before {
          animation-delay: $i * 0.2s;
        }
      }
    }
  }
}

@keyframes wave {
  50%,
  75% {
    // transform属性允许你旋转，缩放，倾斜或平移给定元素。这是通过修改CSS视觉格式化模型的坐标空间来实现的
    // scale()函数用于修改元素的大小。可以通过向量形式定义的缩放值来放大或缩小元素，同时可以在不同的方向设置不同的缩放值
    transform: scale(2.5);
  }

  80%,
  100% {
    opacity: 0;
  }
}
</style>
