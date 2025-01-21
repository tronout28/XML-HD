// Fungsi untuk mendapatkan semua sections dan menu items
const sections = document.querySelectorAll('section');
const navItems = document.querySelectorAll('nav ul li a');

// Fungsi untuk mengecek posisi scroll dan mengupdate active state
function onScroll() {
    let current = '';
    
    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.clientHeight;
        if (scrollY >= (sectionTop - sectionHeight / 3)) {
            current = section.getAttribute('id');
        }
    });

    // Khusus untuk "Home" saat di paling atas
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

// Event listener untuk scroll
window.addEventListener('scroll', onScroll);