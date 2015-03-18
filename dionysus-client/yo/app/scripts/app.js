Dionysus.addRegions({
  headerRegion: 'header',
  mainRegion: 'main',
  footerRegion: 'footer'
});

var articles = new Dionysus.ArticleCollection();
var pages = new Dionysus.PageCollection();
pages.fetch();

Dionysus.addInitializer(function() {
  var header = new Dionysus.HeaderView(),
      main   = new Dionysus.MainView(),
      footer = new Dionysus.FooterView();
  Dionysus.headerRegion.show(header);
  Dionysus.mainRegion.show(main);
  Dionysus.footerRegion.show(footer);
  $(document).ready(function(){
    $('.slider').slider({full_width: true});
  });
});

Dionysus.start();