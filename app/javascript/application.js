// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener("turbo:load", () => {
  // 画面内に .top-slider があるときだけ実行する
  if (document.querySelector(".top-slider")) {
    
    const swiper = new Swiper('.top-slider', {
      loop: true, // ★これだけで完全な無限ループが完成！
      
      // 4秒ごとに自動スライド（シューッと動く）
      autoplay: {
        delay: 4000,
        disableOnInteraction: false, // ユーザーがぽちぽち触っても自動スライドを止めない
      },

      // ぽちぽち（ページネーション）の設定
      pagination: {
        el: '.swiper-pagination',
        clickable: true, // ぽちぽちをクリックしたらその画像に飛べる
      },
      
      // スライドが切り替わるスピード（500ミリ秒 = 0.5秒かけてシューッと動く）
      speed: 500, 
    });

  }
});