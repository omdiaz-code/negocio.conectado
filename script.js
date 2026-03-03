/* ─────────────────────────────────────────────────────────────
   NEGOCIO CONECTADO - JAVASCRIPT
   Interactions & Animations
   ───────────────────────────────────────────────────────────── */

document.addEventListener('DOMContentLoaded', () => {
    const navbar = document.getElementById('navbar');
    const reveals = document.querySelectorAll('.reveal');

    // Navbar Scroll Effect
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });

    // Reveal Animations on Scroll
    const revealOnScroll = () => {
        const triggerBottom = window.innerHeight * 0.85;

        reveals.forEach(reveal => {
            const revealTop = reveal.getBoundingClientRect().top;

            if (revealTop < triggerBottom) {
                reveal.classList.add('active');
            }
        });
    };

    // Initial check and event listener
    window.addEventListener('scroll', revealOnScroll);
    revealOnScroll(); // Trigger once on load

    // Smooth Scroll for local links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });
});
