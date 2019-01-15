var currentSlide=0;
var slides = [];
var slideInterval;
document.addEventListener('DOMContentLoaded', loaded);

function loaded(){
    // add 'click' events for next and previous buttons
    document.getElementById('next').addEventListener('click', nextPicture);
    document.getElementById('previous').addEventListener('click', previousPicture);
    // Fet the list of all the slides
    slides = document.getElementsByClassName('slide');
    // Set timing for nextSlide function
    slideInterval = setInterval(nextSlide,3000);
}

function nextSlide() {
    // Change to the next slide
    slides[currentSlide].id = '';
    currentSlide = (currentSlide+1)%slides.length;
    slides[currentSlide].id = 'showing';
}

function nextPicture() {
    // Reset timing for nextSlide
    clearInterval(slideInterval);
    // Change to next slide
    slides[currentSlide].id = '';
    currentSlide = (currentSlide+1)%slides.length;
    slides[currentSlide].id = 'showing';
    // Start timing for nextSlide again
    slideInterval = setInterval(nextSlide,3000);
}

function previousPicture() {
    // Reset timing for nextSlide
    clearInterval(slideInterval);
    // Change to previous slide
    slides[currentSlide].id = '';
    if (currentSlide == 0) {
        currentSlide = slides.length - 1;
    } else {
        currentSlide = (currentSlide-1)%slides.length;
    }
    slides[currentSlide].id = 'showing';
    // Start timing for nextSlide again
    slideInterval = setInterval(nextSlide,3000);
}
