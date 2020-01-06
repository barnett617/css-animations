<template>
  <div class="wrap">
    <div v-for="each of items" :key="each" class="snow"></div>
  </div>
</template>
<script>
export default {
  name: 'Snow',
  data () {
    return {
      items: []
    }
  },
  created() {
    let list = []
    for (let i = 0; i < 100; i++) {
      list.push(i);
    }
    this.items = list;
  }
}
</script>
<style lang="scss" scoped>
.wrap {
  height: 100vh;
  // radial-gradient() 函数创建了一个图片，其由一个从原点辐射开的在两个或者多个颜色之前的渐变组成。
  // 这个方法得到的是一个CSS<gradient>数据类型的对象，其是 <image> 的一种
  background: radial-gradient(ellipse at bottom, #1b2735 0%, #090a0f 100%);
  overflow: hidden;
  // filter：CSS属性将模糊或颜色偏移等图形效果应用于元素。滤镜通常用于调整图像，背景和边框的渲染
  // drop-shadow：给图像设置一个阴影效果。阴影是合成在图像下面，可以有模糊度的，可以以特定颜色画出的遮罩图的偏移版本
  // <offset-x> 必须
  // <offset-y> 必须
  // <blur-radius> 可选 值越大，越模糊，则阴影会变得更大更淡.不允许负值 若未设定，默认是0 (则阴影的边界很锐利)
  // <spread-radius> 正值会使阴影扩张和变大，负值会是阴影缩小.若未设定，默认是0 (阴影会与元素一样大小)
  // <color>
  filter: drop-shadow(0 0 10px white);
}

@function random_range($min, $max) {
  $rand: random();
  $random_range: $min + floor($rand * (($max - $min) + 1));
  @return $random_range;
}

.snow {
  // scss语法：声明变量
  $total: 200;
  position: absolute;
  width: 10px;
  height: 10px;
  background: white;
  border-radius: 50%;

  @for $i from 1 through $total {
    $random-x: random(1000000) * 0.0001vw;
    $random-offset: random_range(-100000, 100000) * 0.0001vw;
    $random-x-end: $random-x + $random-offset;
    $random-x-end-yoyo: $random-x + ($random-offset / 2);
    $random-yoyo-time: random_range(30000, 80000) / 100000;
    $random-yoyo-y: $random-yoyo-time * 100vh;
    $random-scale: random(10000) * 0.0001;
    $fall-duration: random_range(10, 30) * 1s;
    $fall-delay: random(30) * -1s;

    &:nth-child(#{$i}) {
      opacity: random(10000) * 0.0001;
      transform: translate($random-x, -10px) scale($random-scale);
      animation: fall-#{$i} $fall-duration $fall-delay linear infinite;
    }

    @keyframes fall-#{$i} {
      #{percentage($random-yoyo-time)} {
        transform: translate($random-x-end, $random-yoyo-y) scale($random-scale);
      }
      
      to {
        transform: translate($random-x-end-yoyo, 100vh) scale($random-scale);
      }
    }
  }
}

</style>


