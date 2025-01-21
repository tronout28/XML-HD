const sections = document.querySelectorAll('section');
const navItems = document.querySelectorAll('nav ul li a');

function onScroll() {
    let current = '';
    
    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.clientHeight;
        if (scrollY >= (sectionTop - sectionHeight / 3)) {
            current = section.getAttribute('id');
        }
    });

    if (window.scrollY === 0) {
        navItems.forEach(item => {
            if (item.getAttribute('href') === '#') {
                item.classList.add('active');
            } else {
                item.classList.remove('active');
            }
        });
        return;
    }

    navItems.forEach(item => {
        item.classList.remove('active');
        if (item.getAttribute('href') === `#${current}`) {
            item.classList.add('active');
        }
    });
}

window.addEventListener('scroll', onScroll);