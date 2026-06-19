// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", function() {
  const dropdown = document.getElementById("langDropdown");
  if (!dropdown) return;

  const btn = dropdown.querySelector(".lang-btn");
  const menu = dropdown.querySelector(".lang-menu");
  let isClicked = false; // 💡 クリックされて固定モードになっているかの旗

  // 1. マウスが乗ったとき
  dropdown.addEventListener("mouseenter", function() {
    menu.style.display = "block";
  });

  // 2. マウスが離れたとき
  dropdown.addEventListener("mouseleave", function() {
    // 💡 クリック固定モードでなければ、マウスが離れたら閉じる
    if (!isClicked) {
      menu.style.display = "none";
    }
  });

  // 3. ボタンをクリックしたとき
  btn.addEventListener("click", function(e) {
    e.stopPropagation(); // 💡 他のクリックイベントとバッティングするのを防ぐお守り
    isClicked = !isClicked; // 💡 クリック状態を反転（ON/OFF）

    if (isClicked) {
      menu.style.display = "block";
      dropdown.classList.add("is-active"); // 矢印を上向きに固定する用
    } else {
      menu.style.display = "none";
      dropdown.classList.remove("is-active");
    }
  });

  // 4. メニューの外側の画面のどこかをクリックしたら閉じる親切設計
  document.addEventListener("click", function() {
    isClicked = false;
    menu.style.display = "none";
    dropdown.classList.remove("is-active");
  });
});