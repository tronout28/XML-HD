document.addEventListener('DOMContentLoaded', function() {
    let slideIndex = 0;
    let slideshowInterval;
    const slides = document.querySelectorAll('.slide');
    
    createSlideshowControls();
    
    startSlideshow();
    
    function createSlideshowControls() {
        const nav = document.createElement('div');
        nav.className = 'slideshow-nav';
        nav.innerHTML = 
            `<button class="prev-btn">❮</button>
            <button class="next-btn">❯</button>`;
        
        const dotsContainer = document.createElement('div');
        dotsContainer.className = 'dots-container';
        
        for (let i = 0; i < slides.length; i++) {
            const dot = document.createElement('div');
            dot.className = 'dot';
            if (i === 0) dot.classList.add('active');
            dot.onclick = () => {
                stopSlideshow();
                showSlide(i);
                startSlideshow();
            };
            dotsContainer.appendChild(dot);
        }
        
        const slideshow = document.getElementById('slideshow');
        slideshow.appendChild(nav);
        slideshow.appendChild(dotsContainer);
        
        document.querySelector('.prev-btn').onclick = () => {
            stopSlideshow();
            showSlide(slideIndex - 1);
            startSlideshow();
        };
        
        document.querySelector('.next-btn').onclick = () => {
            stopSlideshow();
            showSlide(slideIndex + 1);
            startSlideshow();
        };
    }
    
    function showSlide(n) {
        if (n >= slides.length) slideIndex = 0;
        else if (n < 0) slideIndex = slides.length - 1;
        else slideIndex = n;
        
        slides.forEach(slide => {
            slide.classList.remove('active');
            slide.style.display = 'none';
        });
        
        const dots = document.querySelectorAll('.dot');
        dots.forEach(dot => {
            dot.classList.remove('active');
        });
        
        slides[slideIndex].classList.add('active');
        slides[slideIndex].style.display = 'block';
        dots[slideIndex].classList.add('active');
    }
    
    function startSlideshow() {
        slideshowInterval = setInterval(() => {
            showSlide(slideIndex + 1);
        }, 3000); 
    }
    
    function stopSlideshow() {
        clearInterval(slideshowInterval);
    }
    
    const slideshowContainer = document.getElementById('slideshow');
    slideshowContainer.addEventListener('mouseenter', stopSlideshow);
    slideshowContainer.addEventListener('mouseleave', startSlideshow);

    
});
