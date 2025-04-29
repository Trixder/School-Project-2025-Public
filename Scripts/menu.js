document.addEventListener("DOMContentLoaded", function() {
    const openMenu = document.getElementById("hamburger-menu");
    const closeMenu = document.getElementById("hamburger-menu-close");
    const menu = document.getElementById("menu");

    function toggleMenu() {
        const isActive = menu.classList.toggle("active");

        // Show/Hide elements based on menu state
        closeMenu.style.display = isActive ? "block" : "none";
        openMenu.style.display = isActive ? "none" : "block"; // Hide the first hamburger when active
    }

    // Open menu
    openMenu.addEventListener("click", function(e) {
        e.preventDefault();
        toggleMenu();
    });

    // Close menu
    closeMenu.addEventListener("click", function(e) {
        e.preventDefault();
        toggleMenu();
    });

    // Close menu when clicking outside
    document.addEventListener("click", function(e) {
        const isClickInsideMenu = menu.contains(e.target);
        const isClickOnMenuButton = e.target.closest("#hamburger-menu") || e.target.closest("#hamburger-menu-close");

        if (!isClickInsideMenu && !isClickOnMenuButton && menu.classList.contains("active")) {
            toggleMenu();
        }
    });
});
