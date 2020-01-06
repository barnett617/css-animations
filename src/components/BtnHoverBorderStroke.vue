<template>
  <div class="wrap">
    <!-- 所有在元素上以data-开头的属性为数据属性 -->
    <button
      data-text="Start"
      class="btn btn-primary btn-ghost btn-border-stroke  btn-text-float-up"
    >
      <div class="btn-borders">
        <div class="border-top"></div>
        <div class="border-right"></div>
        <div class="border-bottom"></div>
        <div class="border-left"></div>
      </div>
      <span class="btn-text">Start</span>
    </button>
  </div>
</template>
<script>
export default {
  name: 'BtnHoverBorderStroke'
}
</script>
<style lang="scss" scoped>
@import url(https://fonts.googleapis.com/css?family=Lato);

.wrap {
  display: flex;
  height: 100vh;
  justify-content: center;
  align-items: center;
  text-align: center;
  background: #222;
}

.btn {
  // CSS3语法：声明变量
  --hue: 190;
  --ease-in-duration: 0.25s;
  --ease-out-duration: 0.65s;
  --ease-out-delay: var(--ease-in-duration);
  position: relative;
  padding: 1rem 3rem;
  font-size: 1rem;
  line-height: 1.5;
  color: white;
  text-decoration: none;
  // hsl:使用HSL圆柱坐标（HSL cylindrical-coordinate）系统（以 hsl() 和 hsla() 函数表达式的形式）
  background-color: hsl(var(--hue), 100%, 41%);
  border: 1px solid hsl(var(--hue), 100%, 41%);
  // 在CSS3中，transparent被延伸到任何一个有color值的属性上。
  // IE8及以下，color属性值为transparent时，文本显示为黑色。
  outline: transparent;
  overflow: hidden;
  cursor: pointer;
  user-select: none;
  // CSS 属性是用来设置如何处理元素中的 空白
  // normal: 连续的空白符会被合并，换行符会被当作空白符来处理。
  // nowrap: 和 normal 一样，连续的空白符会被合并。但文本内的换行无效。
  // 连续的空白符会被保留。在遇到换行符或者<br>元素时才会换行
  white-space: nowrap;
  // CSS transitions 提供了一种在更改CSS属性时控制动画速度的方法
  // 其可以让属性变化成为一个持续一段时间的过程，而不是立即生效的
  transition: 0.25s;

  &:hover {
    background: hsl(var(--hue), 100%, 31%);
  }

  &-primary {
    --hue: 171;
  }

  &-ghost {
    color: hsl(var(--hue), 100%, 41%);
    background-color: transparent;
    border-color: hsl(var(--hue), 100%, 41%);
    
    &:hover {
      color: white;
    }
  }

  &-border-stroke {
    border-color: hsla(var(--hue), 100%, 41%, 0.35);

    .btn-borders {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;

      .border-top {
        position: absolute;
        top: 0;
        width: 100%;
        height: 1px;
        background: hsl(var(--hue), 100%, 41%);
        // The scale() CSS 函数可改变元素的大小。 
        // 它可以增大或减小元素的大小，并且缩放量由矢量定义，并且它可以使在一个方向上比另一个方向更多
        // 如果矢量的两个坐标相等，则缩放是均匀的或各向同性的，并且元素的形状被保留
        // 当超出 [-1, 1]范围外时，缩放将在坐标方向上放大元素；
        // 当在该范围内时，它在该方向收缩元素。当等于1时，它什么也不做，当它为负时，它执行点反射和大小修改。
        transform: scaleX(0);
        // CSS属性让你更改一个元素变形的原点
        transform-origin: left;
      }

      .border-right {
        position: absolute;
        right: 0;
        width: 1px;
        height: 100%;
        background: hsl(var(--hue), 100%, 41%);
        transform: scaleY(0);
        transform-origin: bottom;
      }

      .border-bottom {
        position: absolute;
        bottom: 0;
        width: 100%;
        height: 1px;
        background: hsl(var(--hue), 100%, 41%);
        transform: scaleX(0);
        transform-origin: left;
      }

      .border-left {
        position: absolute;
        left: 0;
        width: 1px;
        height: 100%;
        background: hsl(var(--hue), 100%, 41%);
        transform: scaleY(0);
        transform-origin: bottom;
      }

      // when unhover, ease-in top, right; ease-out bottom, left

      .border-left {
        // cubic-bezier() 定义了一条 立方贝塞尔曲线（cubic Bézier curve）。
        // 这些曲线是连续的，一般用于动画的平滑变换，也被称为缓动函数（easing functions）
        // 一条立方贝塞尔曲线需要四个点来定义，P0 、P1 、P2 和 P3。
        // P0 和 P3 是起点和终点，这两个点被作为比例固定在坐标系上，横轴为时间比例，纵轴为完成状态。
        // P0 是 (0, 0)，表示初始时间和初始状态。
        // P3 是 (1, 1) ，表示终止时间和终止状态。
        transition: var(--ease-out-duration) var(--ease-out-delay)
          cubic-bezier(0.2, 1, 0.2, 1);
      }
      .border-bottom {
        transition: var(--ease-out-duration) var(--ease-out-delay)
          cubic-bezier(0.2, 1, 0.2, 1);
      }

      .border-right {
        transition: var(--ease-in-duration) cubic-bezier(1, 0, 0.8, 0);
      }
      .border-top {
        transition: var(--ease-in-duration) cubic-bezier(1, 0, 0.8, 0);
      }
    }

    &:hover {
      color: hsl(var(--hue), 100%, 41%);
      background: transparent;

      .border-top,
      .border-bottom {
        transform: scaleX(1);
      }
      .border-left,
      .border-right {
        transform: scaleY(1);
      }

      // when hover, ease-in bottom, left; ease-out top, right

      .border-left {
        transition: var(--ease-in-duration) cubic-bezier(1, 0, 0.8, 0);
      }
      .border-bottom {
        transition: var(--ease-in-duration) cubic-bezier(1, 0, 0.8, 0);
      }

      .border-right {
        transition: var(--ease-out-duration) var(--ease-out-delay)
          cubic-bezier(0.2, 1, 0.2, 1);
      }
      .border-top {
        transition: var(--ease-out-duration) var(--ease-out-delay)
          cubic-bezier(0.2, 1, 0.2, 1);
      }
    }
  }

  &-text-float-up {
    &::after {
      position: absolute;
      // 将元素的X属性以字符串形式返回。
      // 如果该元素没有 X 属性，则返回一个空字符串。
      // 区分大小写的属性返回值依赖文挡的语言设定。
      content: attr(data-text);
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      opacity: 0;
      transform: translateY(35%);
      transition: 0.25s ease-out;
    }

    // when hover, ease-in top-text; ease-out bottom-text

    .btn-text {
      display: block;
      transition: 0.75s 0.1s cubic-bezier(0.2, 1, 0.2, 1);
    }

    &:hover {
      // when hover, ease-in bottom-text; ease-out top-text

      .btn-text {
        opacity: 0;
        transform: translateY(-25%);
        transition: 0.25s ease-out;
      }

      &::after {
        opacity: 1;
        transform: translateY(0);
        transition: 0.75s 0.1s cubic-bezier(0.2, 1, 0.2, 1);
      }
    }
  }
}

</style>