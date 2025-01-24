document.addEventListener('DOMContentLoaded', function() {
    const menuItems = document.querySelectorAll('#sidebarMenu li');
    
    menuItems.forEach(item => {
        item.addEventListener('click', function() {
            // Remove active class from all items
            menuItems.forEach(el => el.classList.remove('active'));
            
            // Add active class to clicked item
            this.classList.add('active');
        });
    });

    // Set first item as active by default
    if (menuItems.length > 0) {
        menuItems[0].classList.add('active');
    }
});
