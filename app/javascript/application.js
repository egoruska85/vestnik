// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "popper"
import "bootstrap"


const preview = document.getElementById('previewImage');
const thumbs = document.querySelectorAll('.thumb');

thumbs.forEach(thumb => {
  thumb.addEventListener('click', () => {
    // меняем картинку
    preview.src = thumb.src;

    // убираем active у всех
    thumbs.forEach(t => t.classList.remove('active'));

    // добавляем active выбранной
    thumb.classList.add('active');
  });
});
