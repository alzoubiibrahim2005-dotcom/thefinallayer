'use strict';

const Anthropic = require('@anthropic-ai/sdk');
const fs = require('fs');
const path = require('path');

const ROOT       = path.join(__dirname, '..');
const BLOG_DIR   = path.join(ROOT, 'blog');
const POSTS_FILE = path.join(BLOG_DIR, 'posts.json');
const SITEMAP    = path.join(ROOT, 'sitemap.xml');

// ── Topics: one generated per weekly run ──────────────────────────────────────
const TOPICS = [
  { slug: 'painter-decorator-cost-manchester',           title: 'How Much Does a Painter and Decorator Cost in Manchester? [2026 Guide]',        focus: 'painter decorator cost Manchester 2026' },
  { slug: 'how-to-prepare-walls-for-painting',           title: 'How to Prepare Walls for Painting: A Step-by-Step Guide',                        focus: 'how to prepare walls for painting UK' },
  { slug: 'best-paint-colours-victorian-terraces',       title: 'Best Paint Colours for Victorian Terraces in Lancashire and Manchester',          focus: 'paint colours Victorian terrace Lancashire' },
  { slug: 'exterior-painting-manchester-guide',          title: 'Exterior House Painting in Manchester: What You Need to Know',                    focus: 'exterior house painting Manchester guide' },
  { slug: 'wallpaper-hanging-costs-manchester',          title: 'Wallpaper Hanging in Manchester: Costs, Tips and What to Expect',                 focus: 'wallpaper hanging Manchester cost' },
  { slug: 'feature-wall-ideas-manchester-homes',         title: 'Feature Wall Ideas for Manchester and Lancashire Homes',                          focus: 'feature wall ideas Manchester Lancashire' },
  { slug: 'painter-decorator-cost-lancashire',           title: 'Painter and Decorator Costs in Lancashire [2026 Price Guide]',                    focus: 'painter decorator cost Lancashire 2026' },
  { slug: 'interior-painting-tips-professional-finish',  title: 'Interior Painting Tips: How to Get a Professional Finish',                        focus: 'interior painting tips professional finish' },
  { slug: 'matt-silk-eggshell-paint-finish-guide',       title: 'Matt, Silk or Eggshell? How to Choose the Right Paint Finish',                   focus: 'matt silk eggshell paint finish difference' },
  { slug: 'painter-decorator-vs-diy-2026',               title: 'Painter and Decorator vs DIY: Which is Worth It in 2026?',                        focus: 'painter decorator vs DIY worth it' },
  { slug: 'how-long-does-painting-a-house-take',         title: 'How Long Does It Take to Paint a House? Room-by-Room Guide',                      focus: 'how long does it take to paint a house' },
  { slug: 'best-time-year-paint-exterior-uk',            title: 'Best Time of Year to Paint the Exterior of Your House in the UK',                 focus: 'best time paint exterior house UK season' },
  { slug: 'dulux-vs-farrow-ball-comparison',             title: 'Dulux vs Farrow and Ball: Which Paint is Worth the Price?',                        focus: 'Dulux vs Farrow Ball paint comparison UK' },
  { slug: 'finding-painter-decorator-preston',           title: 'Finding a Painter and Decorator in Preston: What to Look For',                    focus: 'painter decorator Preston Lancashire tips' },
  { slug: 'painter-decorator-blackpool-guide',           title: 'Painter and Decorator in Blackpool: Costs and What to Expect',                    focus: 'painter decorator Blackpool cost guide' },
  { slug: 'painter-decorator-burnley-costs',             title: 'Painter and Decorator in Burnley: Local Prices and Services',                     focus: 'painter decorator Burnley costs services' },
  { slug: 'should-you-paint-before-selling',             title: 'Should You Paint Your House Before Selling? An Honest Guide',                     focus: 'paint house before selling add value' },
  { slug: 'eco-friendly-paints-guide',                   title: 'Eco-Friendly Paints: Are They Worth It for Your Home?',                           focus: 'eco friendly paints UK review guide' },
  { slug: 'damp-walls-painting-treatment',               title: 'Damp Walls and Painting: How to Treat and Paint Damp Surfaces',                   focus: 'painting damp walls treatment guide UK' },
  { slug: 'commercial-painting-manchester-businesses',   title: 'Commercial Painting in Manchester: A Guide for Businesses',                        focus: 'commercial painting Manchester offices shops' },
  { slug: 'staircase-painting-tips-decorator',           title: 'How to Paint a Staircase: Tips from a Professional Decorator',                    focus: 'how to paint staircase tips professional' },
  { slug: 'colour-consultation-decorating-guide',        title: 'Colour Consultation for Home Decorating: Do You Need One?',                       focus: 'colour consultation home decorating advice' },
  { slug: 'painter-decorator-salford-guide',             title: 'Painter and Decorator in Salford: Local Services and Prices',                     focus: 'painter decorator Salford Greater Manchester' },
  { slug: 'painting-rendered-walls-lancashire',          title: 'Painting Rendered Walls in Lancashire: Products, Costs and Tips',                  focus: 'painting rendered walls Lancashire guide' },
  { slug: 'how-to-hire-painter-decorator-checklist',     title: 'How to Hire a Painter and Decorator: Questions to Ask Before Booking',            focus: 'how to hire painter decorator checklist UK' },
  { slug: 'painter-decorator-bolton-guide',              title: 'Painter and Decorator in Bolton: Costs, Services and Local Tips',                  focus: 'painter decorator Bolton Greater Manchester' },
];

// ── SVG constants (match location pages exactly) ──────────────────────────────
const LOGO = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 520 180" width="520" height="180"><rect x="18" y="72" width="108" height="10" rx="5" fill="#E8E2FD"/><rect x="18" y="56" width="88" height="10" rx="5" fill="#C4B5FB"/><rect x="18" y="40" width="108" height="10" rx="5" fill="#6B46F5"/><rect x="112" y="30" width="8" height="62" rx="4" fill="#C8C6C2"/><rect x="110" y="88" width="12" height="6" rx="2" fill="#6B46F5"/><path d="M110 94 Q116 104 122 94" fill="#6B46F5"/><text x="148" y="72" font-family="DM Serif Display,Georgia,serif" font-size="42" font-weight="400" font-style="italic" fill="#17171A" letter-spacing="-0.5">The Final</text><text x="148" y="116" font-family="DM Serif Display,Georgia,serif" font-size="52" font-weight="400" fill="#6B46F5" letter-spacing="-1">Layer</text><text x="149" y="142" font-family="DM Sans,Arial,sans-serif" font-size="13" font-weight="500" fill="#9A9997" letter-spacing="2.5">PAINTER &amp; DECORATOR</text><line x1="149" y1="152" x2="430" y2="152" stroke="#6B46F5" stroke-width="1" opacity="0.3"/></svg>';
const FAVICON = "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 120 120' width='120' height='120'%3E%3Crect width='120' height='120' rx='24' fill='%236B46F5'/%3E%3Crect x='16' y='42' width='72' height='8' rx='4' fill='%23ffffff'/%3E%3Ctext x='60' y='112' text-anchor='middle' font-family='DM Sans,Arial,sans-serif' font-size='11' font-weight='500' fill='rgba(255,255,255,0.55)' letter-spacing='3'%3ETFL%3C/text%3E%3C/svg%3E";
const ARROW  = '<svg width="14" height="14" viewBox="0 0 14 14" fill="none"><path d="M2 7h10M8 3l4 4-4 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>';
const IG     = '<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"/><circle cx="12" cy="12" r="4"/><circle cx="17.5" cy="6.5" r="1" fill="currentColor" stroke="none"/></svg>';
const PHONE  = '<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 9.81 19.79 19.79 0 010 1.18 2 2 0 012 0h3a2 2 0 012 1.72c.127.96.361 1.903.7 2.81a2 2 0 01-.45 2.11L6.09 7.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0122 14.92z"/></svg>';

const FOOTER_LOCS = `<div class="loc-grid">
  <a href="/painter-decorator-preston">Preston</a>
  <a href="/painter-decorator-blackpool">Blackpool</a>
  <a href="/painter-decorator-burnley">Burnley</a>
  <a href="/painter-decorator-blackburn">Blackburn</a>
  <a href="/painter-decorator-lancaster">Lancaster</a>
  <a href="/painter-decorator-chorley">Chorley</a>
  <a href="/painter-decorator-accrington">Accrington</a>
  <a href="/painter-decorator-morecambe">Morecambe</a>
  <a href="/painter-decorator-nelson">Nelson</a>
  <a href="/painter-decorator-clitheroe">Clitheroe</a>
  <a href="/painter-decorator-salford">Salford</a>
  <a href="/painter-decorator-bolton">Bolton</a>
  <a href="/painter-decorator-bury">Bury</a>
</div>`;

// ── CSS ────────────────────────────────────────────────────────────────────────
const BASE_CSS = `*,*::before,*::after{margin:0;padding:0;box-sizing:border-box}
:root{--purple:#6B46F5;--purple-dim:rgba(107,70,245,0.07);--purple-border:rgba(107,70,245,0.18);--bg:#FFFFFF;--bg-soft:#F8F7F4;--border:rgba(0,0,0,0.07);--border-mid:rgba(0,0,0,0.11);--ink:#17171A;--muted:#6A6A69;--dim:#9A9997;--green:#16A34A}
html{scroll-behavior:smooth}
body{font-family:'DM Sans',sans-serif;background:var(--bg);color:var(--ink);font-size:16px;line-height:1.65;-webkit-font-smoothing:antialiased;overflow-x:hidden}
nav{position:fixed;top:0;left:0;right:0;z-index:100;display:flex;align-items:center;justify-content:space-between;padding:1.4rem 5%;backdrop-filter:blur(18px);background:rgba(255,255,255,0.92);border-bottom:1px solid var(--border)}
.nav-logo{text-decoration:none;display:flex;align-items:center}
.nav-logo svg{height:36px;width:auto;display:block}
.nav-links{display:flex;align-items:center;gap:2.5rem;list-style:none}
.nav-links a{text-decoration:none;color:var(--muted);font-size:0.875rem;transition:color 0.2s}
.nav-links a:hover{color:var(--ink)}
.nav-cta{background:var(--purple)!important;color:#fff!important;padding:0.5rem 1.2rem;border-radius:6px;font-weight:500!important}
.nav-hamburger{display:none;flex-direction:column;justify-content:center;gap:5px;background:none;border:none;cursor:pointer;padding:6px;border-radius:6px}
.nav-hamburger span{display:block;width:22px;height:2px;background:var(--ink);border-radius:2px;transition:transform 0.3s,opacity 0.3s}
.nav-hamburger.open span:nth-child(1){transform:translateY(7px) rotate(45deg)}
.nav-hamburger.open span:nth-child(2){opacity:0}
.nav-hamburger.open span:nth-child(3){transform:translateY(-7px) rotate(-45deg)}
.mobile-menu{display:none;position:fixed;top:69px;left:0;right:0;background:rgba(255,255,255,0.97);backdrop-filter:blur(18px);border-bottom:1px solid var(--border);padding:1.5rem 5% 2rem;z-index:99;flex-direction:column}
.mobile-menu.open{display:flex}
.mobile-menu a{text-decoration:none;color:var(--ink);font-size:1rem;padding:0.9rem 0;border-bottom:1px solid var(--border)}
.mobile-menu a:last-child{border-bottom:none}
.mobile-cta{margin-top:1rem;background:var(--purple);color:#fff!important;padding:0.75rem 1.5rem;border-radius:7px;text-align:center;font-weight:500;border-bottom:none!important}
.btn-primary{display:inline-flex;align-items:center;gap:0.5rem;background:var(--purple);color:#fff;text-decoration:none;padding:0.875rem 2rem;border-radius:7px;font-weight:500;font-size:0.9rem;transition:opacity 0.2s,transform 0.15s}
.btn-primary:hover{opacity:0.87;transform:translateY(-1px)}
.btn-white{display:inline-flex;align-items:center;gap:0.5rem;background:#fff;color:var(--purple);text-decoration:none;padding:0.95rem 2.25rem;border-radius:7px;font-weight:500;font-size:0.9rem;transition:opacity 0.2s,transform 0.15s}
.btn-white:hover{opacity:0.92;transform:translateY(-1px)}
.section-label{font-size:0.71rem;font-weight:500;letter-spacing:0.14em;text-transform:uppercase;color:var(--purple);margin-bottom:1.1rem;display:flex;align-items:center;gap:0.6rem}
.section-label::before{content:'';display:block;width:16px;height:1px;background:var(--purple);flex-shrink:0}
.breadcrumb-nav{margin-bottom:1.5rem}
.breadcrumb{list-style:none;display:flex;align-items:center;flex-wrap:wrap;font-size:0.78rem;color:var(--dim);padding:0}
.breadcrumb li{display:flex;align-items:center}
.breadcrumb li+li::before{content:"›";margin:0 0.4rem;color:var(--dim)}
.breadcrumb a{color:var(--muted);text-decoration:none}
.breadcrumb a:hover{color:var(--purple)}
.breadcrumb li[aria-current]{color:var(--ink)}
.cta-section{background:var(--purple);color:#fff;text-align:center;padding:clamp(4rem,7vw,6.5rem) 5%}
.cta-section .section-label{color:rgba(255,255,255,0.55);justify-content:center}
.cta-section .section-label::before{background:rgba(255,255,255,0.4)}
.cta-section h2{font-family:'DM Serif Display',serif;font-size:clamp(2.2rem,4vw,3.6rem);font-weight:400;line-height:1.15;margin-bottom:1.25rem;color:#fff}
.cta-section h2 em{font-style:italic;opacity:0.85}
.cta-section p{font-size:1rem;color:rgba(255,255,255,0.75);max-width:480px;margin:0 auto 2.5rem;line-height:1.7}
.cta-actions{display:flex;align-items:center;justify-content:center;gap:1.5rem;flex-wrap:wrap}
.cta-phone{color:rgba(255,255,255,0.7);text-decoration:none;font-size:0.9rem;display:inline-flex;align-items:center;gap:0.4rem;transition:color 0.2s}
.cta-phone:hover{color:#fff}
footer{background:var(--bg-soft);border-top:1px solid var(--border);padding:3rem 5%;display:flex;flex-direction:column;align-items:center;gap:1.5rem;text-align:center}
.footer-logo svg{height:40px;width:auto;display:block}
.footer-text{font-size:0.8rem;color:var(--dim)}
.footer-links{display:flex;flex-wrap:wrap;justify-content:center;gap:1.5rem;list-style:none}
.footer-links a{font-size:0.8rem;color:var(--muted);text-decoration:none;transition:color 0.2s}
.footer-links a:hover{color:var(--purple)}
.footer-loc-label{font-size:0.7rem;font-weight:500;letter-spacing:0.12em;text-transform:uppercase;color:var(--dim);margin-top:0.5rem}
.loc-grid{display:flex;flex-wrap:wrap;justify-content:center;gap:0.4rem;margin-top:0.5rem}
.loc-grid a{font-size:0.77rem;color:var(--muted);text-decoration:none;padding:0.2rem 0.65rem;border:1px solid var(--border);border-radius:4px;transition:color 0.2s,border-color 0.2s}
.loc-grid a:hover{color:var(--purple);border-color:var(--purple-border)}
@media(max-width:640px){.nav-links{display:none}.nav-hamburger{display:flex}.cta-actions{flex-direction:column}}`;

const BLOG_CSS = `.blog-hero{padding:8rem 5% 4rem;background:#fff;border-bottom:1px solid var(--border)}
.blog-hero h1{font-family:'DM Serif Display',serif;font-size:clamp(2rem,4vw,3.4rem);line-height:1.1;font-weight:400;color:var(--ink);margin-bottom:1.25rem;max-width:820px}
.blog-hero .hero-sub{font-size:1rem;color:var(--muted);max-width:700px;line-height:1.75}
.article-meta{display:flex;align-items:center;gap:1.25rem;font-size:0.78rem;color:var(--dim);margin-bottom:1.5rem;flex-wrap:wrap}
.article-grid{display:grid;grid-template-columns:1fr 320px;gap:4rem;align-items:start;padding:clamp(3rem,5vw,5rem) 5%}
.article-body h2{font-family:'DM Serif Display',serif;font-size:clamp(1.4rem,2.5vw,1.9rem);font-weight:400;color:var(--ink);margin:2.5rem 0 0.85rem;line-height:1.2}
.article-body h2:first-child{margin-top:0}
.article-body p{font-size:0.95rem;color:var(--muted);line-height:1.85;margin-bottom:1.1rem}
.article-body ul{margin:0.75rem 0 1.1rem 1.4rem}
.article-body li{font-size:0.95rem;color:var(--muted);line-height:1.75;margin-bottom:0.4rem}
.faq-list{display:flex;flex-direction:column;gap:0.75rem;margin-top:0.5rem}
.faq-item{padding:1.4rem 1.75rem;border:1px solid var(--border);border-radius:10px;background:var(--bg-soft)}
.faq-q{font-size:0.95rem;font-weight:500;color:var(--ink);margin-bottom:0.5rem}
.faq-a{font-size:0.88rem;color:var(--muted);line-height:1.75}
.article-sidebar{position:sticky;top:5.5rem;display:flex;flex-direction:column;gap:1rem}
.sidebar-card{background:var(--bg-soft);border:1px solid var(--border);border-radius:12px;padding:1.5rem}
.sidebar-label{font-size:0.7rem;font-weight:500;letter-spacing:0.12em;text-transform:uppercase;color:var(--purple);margin-bottom:0.65rem;display:block}
.sidebar-card h3{font-family:'DM Serif Display',serif;font-size:1.05rem;font-weight:400;color:var(--ink);margin-bottom:0.5rem;line-height:1.3}
.sidebar-card p{font-size:0.84rem;color:var(--muted);line-height:1.65;margin-bottom:0.85rem}
.sidebar-card .loc-grid{justify-content:flex-start}
.posts-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:1.25rem;margin-top:2.5rem}
.post-card{background:var(--bg);border:1px solid var(--border);border-radius:10px;padding:1.75rem;text-decoration:none;display:block;transition:border-color 0.2s,transform 0.15s}
.post-card:hover{border-color:var(--purple-border);transform:translateY(-2px)}
.post-card-date{font-size:0.72rem;color:var(--dim);margin-bottom:0.65rem}
.post-card-title{font-family:'DM Serif Display',serif;font-size:1.05rem;font-weight:400;color:var(--ink);line-height:1.35;margin-bottom:0.5rem}
.post-card-desc{font-size:0.82rem;color:var(--muted);line-height:1.65}
.post-card-read{font-size:0.78rem;color:var(--purple);margin-top:0.85rem;font-weight:500}
.blog-header h1{font-family:'DM Serif Display',serif;font-size:clamp(2rem,3vw,2.8rem);font-weight:400;color:var(--ink);margin-bottom:0.5rem}
.blog-intro{font-size:0.95rem;color:var(--muted);line-height:1.75;max-width:560px;margin-top:0.75rem}
@media(max-width:900px){.article-grid{grid-template-columns:1fr;gap:2.5rem}.article-sidebar{position:static}.posts-grid{grid-template-columns:repeat(2,1fr)}}
@media(max-width:640px){.posts-grid{grid-template-columns:1fr}}`;

// ── Helpers ────────────────────────────────────────────────────────────────────
function formatDate(iso) {
  return new Date(iso + 'T00:00:00Z').toLocaleDateString('en-GB', {
    day: 'numeric', month: 'long', year: 'numeric'
  });
}

function nav() {
  return `<nav>
  <a href="https://thefinallayer.uk" class="nav-logo">${LOGO}</a>
  <ul class="nav-links">
    <li><a href="https://thefinallayer.uk/#about">About</a></li>
    <li><a href="https://thefinallayer.uk/#services">Services</a></li>
    <li><a href="/blog">Blog</a></li>
    <li><a href="https://www.instagram.com/thefinallayer.uk" target="_blank" rel="noopener" aria-label="Instagram" style="display:flex;align-items:center;">${IG}</a></li>
    <li><a href="https://thefinallayer.uk/#contact" class="nav-cta">Get a quote</a></li>
  </ul>
  <button class="nav-hamburger" id="hamburger" aria-label="Open menu" aria-expanded="false"><span></span><span></span><span></span></button>
</nav>
<div class="mobile-menu" id="mobileMenu">
  <a href="https://thefinallayer.uk/#about">About</a>
  <a href="https://thefinallayer.uk/#services">Services</a>
  <a href="/blog">Blog</a>
  <a href="https://www.instagram.com/thefinallayer.uk" target="_blank" rel="noopener">Instagram</a>
  <a href="https://thefinallayer.uk/#contact" class="mobile-cta">Get a free quote</a>
</div>`;
}

function footer() {
  return `<footer>
  <a href="https://thefinallayer.uk" class="footer-logo">${LOGO}</a>
  <p class="footer-text">&copy; 2026 The Final Layer &middot; Ibrahim Alzoubi &middot; Manchester &amp; Lancashire</p>
  <ul class="footer-links">
    <li><a href="https://thefinallayer.uk/#about">About</a></li>
    <li><a href="https://thefinallayer.uk/#services">Services</a></li>
    <li><a href="/blog">Blog</a></li>
    <li><a href="https://thefinallayer.uk/#contact">Contact</a></li>
    <li><a href="https://www.instagram.com/thefinallayer.uk" target="_blank" rel="noopener" style="display:inline-flex;align-items:center;gap:0.35rem;">${IG} Instagram</a></li>
  </ul>
  <p class="footer-loc-label">All locations</p>
  ${FOOTER_LOCS}
</footer>`;
}

function script() {
  return `<script>
const hamburger=document.getElementById('hamburger');
const mobileMenu=document.getElementById('mobileMenu');
hamburger.addEventListener('click',()=>{const o=mobileMenu.classList.toggle('open');hamburger.classList.toggle('open',o);hamburger.setAttribute('aria-expanded',o);});
mobileMenu.querySelectorAll('a').forEach(l=>l.addEventListener('click',()=>{mobileMenu.classList.remove('open');hamburger.classList.remove('open');hamburger.setAttribute('aria-expanded',false);}));
</script>`;
}

function head({ title, description, url, css }) {
  return `<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="theme-color" content="#6B46F5">
<link rel="canonical" href="${url}">
<link rel="sitemap" type="application/xml" title="Sitemap" href="/sitemap.xml">
<meta name="robots" content="index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1">
<title>${title}</title>
<meta name="description" content="${description}">
<meta name="author" content="Ibrahim Alzoubi - The Final Layer">
<meta property="og:type" content="article">
<meta property="og:url" content="${url}">
<meta property="og:title" content="${title}">
<meta property="og:description" content="${description}">
<meta property="og:image" content="https://thefinallayer.uk/og-image.jpg">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="${title}">
<meta name="twitter:description" content="${description}">
<meta name="twitter:image" content="https://thefinallayer.uk/og-image.jpg">
<script type="application/ld+json">
${css.jsonLd}
</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=G-V9RYJJVZLJ"></script>
<script>window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments);}gtag('js',new Date());gtag('config','G-V9RYJJVZLJ');</script>
<link rel="icon" type="image/svg+xml" href="${FAVICON}">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:ital,wght@0,300;0,400;0,500;1,400&display=swap" rel="stylesheet">
<style>
${BASE_CSS}
${BLOG_CSS}
</style>
</head>`;
}

// ── Article builder ────────────────────────────────────────────────────────────
function buildArticleHTML(data, topic, dateStr) {
  const url = `https://thefinallayer.uk/blog/${topic.slug}`;
  const pageTitle = `${data.title} | The Final Layer`;

  const jsonLd = JSON.stringify({
    '@context': 'https://schema.org',
    '@graph': [
      {
        '@type': 'Article',
        headline: data.title,
        description: data.meta_description,
        datePublished: dateStr,
        dateModified: dateStr,
        url,
        author: { '@type': 'Person', name: 'Ibrahim Alzoubi' },
        publisher: { '@type': 'Organization', name: 'The Final Layer', url: 'https://thefinallayer.uk' },
        mainEntityOfPage: { '@type': 'WebPage', '@id': url }
      },
      {
        '@type': 'BreadcrumbList',
        itemListElement: [
          { '@type': 'ListItem', position: 1, name: 'Home', item: 'https://thefinallayer.uk' },
          { '@type': 'ListItem', position: 2, name: 'Blog', item: 'https://thefinallayer.uk/blog' },
          { '@type': 'ListItem', position: 3, name: data.title, item: url }
        ]
      },
      {
        '@type': 'FAQPage',
        mainEntity: data.faqs.map(faq => ({
          '@type': 'Question',
          name: faq.question,
          acceptedAnswer: { '@type': 'Answer', text: faq.answer }
        }))
      }
    ]
  }, null, 2);

  const sectionsHTML = data.sections.map(s => {
    const paras = s.content.split('\n\n').map(p => `<p>${p}</p>`).join('\n    ');
    return `<h2>${s.heading}</h2>\n    ${paras}`;
  }).join('\n\n    ');

  const faqsHTML = data.faqs.map(faq => `
    <div class="faq-item">
      <h3 class="faq-q">${faq.question}</h3>
      <p class="faq-a">${faq.answer}</p>
    </div>`).join('');

  const headHtml = head({
    title: pageTitle,
    description: data.meta_description,
    url,
    css: { jsonLd }
  });

  return `<!DOCTYPE html>
<html lang="en-GB">
${headHtml}
<body>
${nav()}
<main>
<div class="blog-hero">
  <nav aria-label="Breadcrumb" class="breadcrumb-nav">
    <ol class="breadcrumb">
      <li><a href="https://thefinallayer.uk">Home</a></li>
      <li><a href="/blog">Blog</a></li>
      <li aria-current="page">${data.title}</li>
    </ol>
  </nav>
  <div class="article-meta">
    <span>${formatDate(dateStr)}</span>
    <span>${data.reading_time || 5} min read</span>
    <span>Ibrahim Alzoubi</span>
  </div>
  <h1>${data.title}</h1>
  <p class="hero-sub">${data.intro}</p>
</div>
<div class="article-grid">
  <article class="article-body">
    ${sectionsHTML}

    <h2>Frequently Asked Questions</h2>
    <div class="faq-list">${faqsHTML}
    </div>
  </article>
  <aside class="article-sidebar">
    <div class="sidebar-card">
      <span class="sidebar-label">Free quote</span>
      <h3>Get an accurate price for your job</h3>
      <p>Ibrahim at The Final Layer covers Manchester and Lancashire. Call or message for a free, no-obligation quote &mdash; same day response.</p>
      <a href="https://thefinallayer.uk/#contact" class="btn-primary" style="font-size:0.875rem;padding:0.75rem 1.5rem;width:100%;justify-content:center;margin-bottom:0.75rem;">Get a free quote ${ARROW}</a>
      <a href="tel:+447386404885" style="display:flex;align-items:center;justify-content:center;gap:0.4rem;font-size:0.85rem;color:var(--muted);text-decoration:none;">${PHONE} 07386 404885</a>
    </div>
    <div class="sidebar-card">
      <span class="sidebar-label">About Ibrahim</span>
      <h3>The Final Layer</h3>
      <p>Ibrahim Alzoubi is a painter and decorator based in Manchester and Lancashire. Every job done personally &mdash; no subcontractors, 5&#9733; rated.</p>
      <a href="https://thefinallayer.uk" style="font-size:0.84rem;color:var(--purple);text-decoration:none;font-weight:500;">thefinallayer.uk ${ARROW}</a>
    </div>
    <div class="sidebar-card">
      <span class="sidebar-label">Locations</span>
      ${FOOTER_LOCS}
    </div>
  </aside>
</div>
<section class="cta-section">
  <div class="section-label">Free quote</div>
  <h2>Ready to get started?<br><em>Call Ibrahim today</em></h2>
  <p>No call centre, no form that goes nowhere. A real person answers and a quote follows the same day.</p>
  <div class="cta-actions">
    <a href="https://thefinallayer.uk/#contact" class="btn-white">Get a free quote ${ARROW}</a>
    <a href="tel:+447386404885" class="cta-phone">${PHONE} 07386 404885</a>
  </div>
</section>
</main>
${footer()}
${script()}
</body>
</html>`;
}

// ── Blog index builder ─────────────────────────────────────────────────────────
function buildBlogIndex(posts) {
  const postsHTML = [...posts].reverse().map(post => `
    <a href="/blog/${post.slug}" class="post-card">
      <div class="post-card-date">${formatDate(post.date)}</div>
      <div class="post-card-title">${post.title}</div>
      <div class="post-card-desc">${post.meta_description}</div>
      <div class="post-card-read">${post.reading_time || 5} min read &rsaquo;</div>
    </a>`).join('');

  const jsonLd = JSON.stringify({
    '@context': 'https://schema.org',
    '@type': 'Blog',
    name: 'The Final Layer Blog',
    description: 'Painting and decorating advice, cost guides and tips for Manchester and Lancashire homeowners.',
    url: 'https://thefinallayer.uk/blog',
    publisher: { '@type': 'Organization', name: 'The Final Layer', url: 'https://thefinallayer.uk' }
  });

  const headHtml = head({
    title: 'Painting &amp; Decorating Blog | The Final Layer | Manchester &amp; Lancashire',
    description: 'Painting and decorating advice, cost guides and tips for Manchester and Lancashire homeowners. Written by Ibrahim Alzoubi, The Final Layer.',
    url: 'https://thefinallayer.uk/blog',
    css: { jsonLd }
  });

  return `<!DOCTYPE html>
<html lang="en-GB">
${headHtml}
<body>
${nav()}
<main>
<div style="padding:8rem 5% 3.5rem;background:#fff;border-bottom:1px solid var(--border)">
  <nav aria-label="Breadcrumb" class="breadcrumb-nav">
    <ol class="breadcrumb">
      <li><a href="https://thefinallayer.uk">Home</a></li>
      <li aria-current="page">Blog</li>
    </ol>
  </nav>
  <div class="blog-header">
    <div class="section-label">Blog</div>
    <h1>Painting &amp; Decorating<br><em style="font-style:italic;color:var(--purple)">Advice &amp; Guides</em></h1>
    <p class="blog-intro">Cost guides, tips and advice for homeowners in Manchester and Lancashire. Written by Ibrahim Alzoubi, The Final Layer.</p>
  </div>
</div>
<div style="padding:clamp(3rem,5vw,5rem) 5%;background:var(--bg-soft)">
  <div class="posts-grid">${postsHTML}
  </div>
</div>
<section class="cta-section">
  <div class="section-label">Free quote</div>
  <h2>Need a painter and decorator<br>in <em>Manchester or Lancashire?</em></h2>
  <p>Call or message Ibrahim directly for a free, no-obligation quote. Same day response, honest prices.</p>
  <div class="cta-actions">
    <a href="https://thefinallayer.uk/#contact" class="btn-white">Get a free quote ${ARROW}</a>
    <a href="tel:+447386404885" class="cta-phone">${PHONE} 07386 404885</a>
  </div>
</section>
</main>
${footer()}
${script()}
</body>
</html>`;
}

// ── Sitemap updater ────────────────────────────────────────────────────────────
function addToSitemap(slug, dateStr) {
  let sitemap = fs.readFileSync(SITEMAP, 'utf8');
  if (sitemap.includes(`/blog/${slug}`)) return;
  const entry = `  <url>\n    <loc>https://thefinallayer.uk/blog/${slug}</loc>\n    <lastmod>${dateStr}</lastmod>\n    <changefreq>monthly</changefreq>\n    <priority>0.6</priority>\n  </url>`;
  sitemap = sitemap.replace('</urlset>', `${entry}\n</urlset>`);
  fs.writeFileSync(SITEMAP, sitemap, 'utf8');
}

// ── Main ───────────────────────────────────────────────────────────────────────
async function main() {
  const posts = JSON.parse(fs.readFileSync(POSTS_FILE, 'utf8'));
  const used  = new Set(posts.map(p => p.slug));
  const topic = TOPICS.find(t => !used.has(t.slug));

  if (!topic) {
    console.log('All topics exhausted — nothing to generate.');
    return;
  }

  const client  = new Anthropic();
  const dateStr = new Date().toISOString().split('T')[0];
  console.log(`Generating: ${topic.slug}`);

  const msg = await client.messages.create({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 2048,
    messages: [{
      role: 'user',
      content: `Write an SEO blog article for "The Final Layer", a painter and decorator serving Manchester and Lancashire (owner: Ibrahim Alzoubi, tel: 07386 404885, website: thefinallayer.uk).

Topic: "${topic.title}"
Target keyword: "${topic.focus}"

Return ONLY valid JSON — no text before or after the JSON block:
{
  "title": "article title",
  "meta_description": "150-160 character SEO meta description",
  "intro": "2-3 sentence introduction (plain text, no markdown)",
  "sections": [
    {"heading": "section heading", "content": "2-3 paragraphs separated by \\n\\n (plain text, no markdown, no bullet symbols)"}
  ],
  "faqs": [
    {"question": "FAQ question", "answer": "1-3 sentence answer (plain text)"}
  ],
  "reading_time": 5
}

Requirements:
- 4-5 sections with substantive content (2-3 paragraphs each)
- Exactly 4 FAQs
- Target Manchester and Lancashire audiences
- Mention The Final Layer or Ibrahim naturally in 1-2 sections only
- Include specific price estimates where relevant (write as GBP200 or similar — no pound sign)
- UK English, honest and helpful tone
- Plain text only in all content fields`
    }]
  });

  let data;
  try {
    const raw   = msg.content[0].text.trim();
    const start = raw.indexOf('{');
    const end   = raw.lastIndexOf('}') + 1;
    data = JSON.parse(raw.slice(start, end));
  } catch (err) {
    console.error('JSON parse failed:', err.message);
    console.error(msg.content[0].text);
    process.exit(1);
  }

  // Write article
  const dir = path.join(BLOG_DIR, topic.slug);
  fs.mkdirSync(dir, { recursive: true });
  fs.writeFileSync(path.join(dir, 'index.html'), buildArticleHTML(data, topic, dateStr), 'utf8');

  // Update metadata
  posts.push({ slug: topic.slug, title: data.title, meta_description: data.meta_description, date: dateStr, reading_time: data.reading_time || 5 });
  fs.writeFileSync(POSTS_FILE, JSON.stringify(posts, null, 2), 'utf8');

  // Rebuild index
  fs.writeFileSync(path.join(BLOG_DIR, 'index.html'), buildBlogIndex(posts), 'utf8');

  // Update sitemap
  addToSitemap(topic.slug, dateStr);

  console.log(`Done: /blog/${topic.slug}`);
}

main().catch(err => { console.error(err); process.exit(1); });
