<template>
  <div class="wrap">
    <p class="landIn">Ano hi watashitachi mada shiranai no Fushigi no monogatari desu.</p>
  </div>
</template>
<script>
export default {
  name: 'StaggeredLandinText',
  mounted() {
    // querySelectorAll：返回与指定的选择器组匹配的文档中的元素列表 (使用深度优先的先序遍历文档的节点)。
    // 返回的对象是 NodeList
    let landInTexts = document.querySelectorAll(".landIn");
    landInTexts.forEach(landInText => {
      let letters = landInText.textContent.split("");
      landInText.textContent = "";
      letters.forEach((letter, i) => {
        // 在一个 HTML 文档中， Document.createElement() 方法创建由tagName 指定的HTML元素，
        // 或一个HTMLUnknownElement，如果tagName不被识别
        let span = document.createElement("span");
        span.textContent = letter;
        span.style.animationDelay = `${i * 0.05}s`;
        //  ParentNode.append 方法在 ParentNode的最后一个子节点之后插入一组 Node 对象或 DOMString 对象。
        // 被插入的 DOMString 对象等价为 Text 节点
        landInText.append(span);
      });
    });
  }
}
</script>
<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css?family=Lora:400,400i,700");

.wrap {
  display: flex;
  flex-direction: column;
  height: 100vh;
  justify-content: center;
  align-items: center;
  background-image: linear-gradient(rgba(16, 16, 16, 0.8),
      rgba(16, 16, 16, 0.8)),
    url(https://i.loli.net/2019/10/18/buDT4YS6zUMfHst.jpg);
  background-size: cover;
  p {
    // margin: 0 9em;
    font-size: 2em;
    font-weight: 600;
  }

  .landIn {
    display: flex;
    flex-wrap: wrap;
    line-height: 1.8;
    color: white;
    font-family: Lora, serif;
    white-space: pre;

    span {
      animation: landIn 0.8s ease-out both;
    }
  }

  @keyframes landIn {
    from {
      opacity: 0;
      transform: translateY(-20%);
    }

    to {
      opacity: 1;
      transform: translateY(0);
    }
  }
}

</style>

