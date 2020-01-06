# css-animations

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Deploy

#### 发布原理

1. 创建一个`gh-pages`的分支
2. `github pages`服务会自动识别`gh-pages`分支作为发布分支
3. 将`vue`编译生成的`dist`目录提交到`gh-pages`分支
4. `pages`服务会默认找根目录的`readme.md`或`index.html`文件进行显示
5. `vue`默认认为项目会发布到域名根目录下，但`github pages`支持同一账号多个项目发布`pages`服务，以仓库名作为二级目录进行区分
6. 需要通过`vue.config.js`中的`publicPath`指定域名子路径

#### 参考资料

- [Deploy vue-cli 3 project to github pages](https://medium.com/@Roli_Dori/deploy-vue-cli-3-project-to-github-pages-ebeda0705fbd)
- [How I use Vue.js on GitHub Pages](https://dev.to/tiim/how-i-use-vue-js-on-github-pages-45np)
- [应该如何使用Github Pages?](https://developer.mozilla.org/zh-CN/docs/Learn/Common_questions/Using_Github_pages)
- [Deploying a subfolder to GitHub Pages](https://gist.github.com/cobyism/4730490)
- [vue publicPath](https://cli.vuejs.org/config/#publicpath)
