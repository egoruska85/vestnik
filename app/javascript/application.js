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


const track = document.querySelector('.carousel-container');

setInterval(() => {
  // Если долистали до конца — прыгаем в начало, иначе скроллим вниз
  if (track.scrollTop + track.clientHeight >= track.scrollHeight) {
    track.scrollTo({ top: 0, behavior: 'smooth' });
  } else {
    track.scrollBy({ top: 110, behavior: 'smooth' });
  }
}, 3000);
