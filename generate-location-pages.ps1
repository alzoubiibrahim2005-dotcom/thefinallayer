$base = "C:\Users\alzou\Downloads\the finallayer\thefinallayer"

# ── LOCATION DATA ─────────────────────────────────────────────────────────────
$locations = @(
  @{ city="Preston";     slug="painter-decorator-preston";     county="Lancashire";         lat="53.7632"; lng="-2.7031"; nearby="Chorley, Leyland, Fulwood, Bamber Bridge, Penwortham and Longridge";                 r1t="Ibrahim decorated our Victorian terrace in Fulwood. Living room, hallway and all three bedrooms. Brilliant finish, very tidy, fair price."; r1a="Sarah M."; r1l="Fulwood, Preston";         r2t="Got a quote the same day, started within the week. Everything exactly as discussed. Highly recommend."; r2a="Lee T."; r2l="Ashton-on-Ribble, Preston";  r3t="Full exterior repaint on our 1930s semi. Excellent prep, clean lines and a finish that looks brand new."; r3a="Denise W."; r3l="Penwortham, Preston" }
  @{ city="Blackpool";   slug="painter-decorator-blackpool";   county="Lancashire";         lat="53.8175"; lng="-3.0357"; nearby="Lytham St Annes, Cleveleys, Poulton-le-Fylde, Fleetwood and Thornton";               r1t="Ibrahim did our whole flat near the Prom. Fresh, clean, absolutely no mess left behind. Would not hesitate to book again."; r1a="James T."; r1l="North Shore, Blackpool";              r2t="Painted our guest rooms during the off-season. Fast, professional and a great result for our guests."; r2a="Carol R."; r2l="South Shore, Blackpool"; r3t="Did our hallway and lounge in a day. Could not believe how quickly it was done without cutting any corners."; r3a="Mike S."; r3l="Blackpool" }
  @{ city="Burnley";     slug="painter-decorator-burnley";     county="Lancashire";         lat="53.7895"; lng="-2.2375"; nearby="Nelson, Padiham, Brierfield, Colne and Hapton";                                       r1t="Came to Burnley and did a full interior on our terraced house. Fair price, great attitude and an excellent finish throughout."; r1a="Lisa K."; r1l="Burnley";                             r2t="Ibrahim painted our kitchen and living room. Clean lines on the woodwork, exactly the shade we wanted. Really happy."; r2a="Gary H."; r2l="Padiham, Burnley";             r3t="Did a feature wall and redecorated two bedrooms. Arrived on time, left the place spotless. Five stars."; r3a="Anya P."; r3l="Burnley" }
  @{ city="Blackburn";   slug="painter-decorator-blackburn";   county="Lancashire";         lat="53.7480"; lng="-2.4791"; nearby="Darwen, Accrington, Great Harwood, Rishton and Oswaldtwistle";                        r1t="Ibrahim decorated our semi in Blackburn. Walls, woodwork, the lot. Proper professional job at a price that did not break the bank."; r1a="Mohammed A."; r1l="Blackburn";              r2t="Did our rental flat between tenancies. Quick, tidy and left it looking brand new. Will be using again."; r2a="Rachel B."; r2l="Darwen";                       r3t="Fantastic wallpapering job in our living room. Pattern matched perfectly. Ibrahim clearly knows what he is doing."; r3a="Tom N."; r3l="Blackburn" }
  @{ city="Lancaster";   slug="painter-decorator-lancaster";   county="Lancashire";         lat="54.0466"; lng="-2.8007"; nearby="Morecambe, Carnforth, Galgate, Halton and Slyne";                                     r1t="Ibrahim came all the way to Lancaster and was worth every penny. Decorated our whole ground floor. Stunning result."; r1a="Clare H."; r1l="Lancaster";                             r2t="Hired for a full exterior on our stone cottage. Great prep work and excellent product choice for the weather up here."; r2a="Stuart L."; r2l="Carnforth, Lancaster";        r3t="Did our new kitchen and utility room. Superb attention to detail on the tiles and skirtings. Very pleased."; r3a="Fiona M."; r3l="Lancaster" }
  @{ city="Chorley";     slug="painter-decorator-chorley";     county="Lancashire";         lat="53.6529"; lng="-2.6327"; nearby="Leyland, Adlington, Coppull, Euxton and Heath Charnock";                              r1t="Really pleased with the results. Ibrahim painted our lounge, dining room and hallway. Everything tied together perfectly."; r1a="Tom B."; r1l="Chorley";                            r2t="Did our conservatory and a bedroom feature wall. Exactly what we asked for, no fuss, no mess."; r2a="Mandy C."; r2l="Euxton, Chorley";                   r3t="Ibrahim redecorated our entire upstairs. Brilliant communication throughout and a finish we are really proud of."; r3a="Dave R."; r3l="Adlington, Chorley" }
  @{ city="Accrington";  slug="painter-decorator-accrington";  county="Lancashire";         lat="53.7531"; lng="-2.3637"; nearby="Oswaldtwistle, Church, Great Harwood, Rishton and Clayton-le-Moors";                  r1t="Did our conservatory and dining room. Really professional, turned up when he said and left everything spotless."; r1a="Diane W."; r1l="Accrington";                             r2t="Ibrahim painted the exterior of our terraced house. Looks miles better. The neighbours have already been asking who did it."; r2a="Phil T."; r2l="Oswaldtwistle";              r3t="Wallpapered our feature wall and painted the rest of the room to match. Perfect result, would book again."; r3a="Kelly J."; r3l="Church, Accrington" }
  @{ city="Morecambe";   slug="painter-decorator-morecambe";   county="Lancashire";         lat="54.0695"; lng="-2.8650"; nearby="Heysham, Lancaster, Carnforth, Hest Bank and Bolton-le-Sands";                        r1t="Excellent work, very tidy. Ibrahim painted our seafront property inside and out. Great products and a superb finish."; r1a="Pete N."; r1l="Morecambe";                            r2t="Did our guest rooms before the season. Fast turnaround, professional throughout, and guests have already noticed."; r2a="Jan H."; r2l="Morecambe";                         r3t="Came highly recommended and lived up to it. Repainted our whole bungalow interior. Would not use anyone else."; r3a="Eric S."; r3l="Heysham, Morecambe" }
  @{ city="Nelson";      slug="painter-decorator-nelson";      county="Lancashire";         lat="53.8353"; lng="-2.2147"; nearby="Brierfield, Colne, Burnley, Barrowford and Reedley";                                  r1t="Quick, clean and a great finish. Ibrahim decorated our terraced house in Nelson. Done in two days and it looks incredible."; r1a="Ayaan H."; r1l="Nelson";                         r2t="Ibrahim was straightforward to deal with, honest about what was needed and priced fairly. Really happy."; r2a="Cath M."; r2l="Barrowford, Nelson";        r3t="Brilliant job on our feature wall. Wallpaper hung perfectly, no bubbles, no seams showing. Very impressed."; r3a="Kiran P."; r3l="Nelson" }
  @{ city="Clitheroe";   slug="painter-decorator-clitheroe";   county="Lancashire";         lat="53.8710"; lng="-2.3973"; nearby="Whalley, Longridge, Chatburn, Sabden and Slaidburn";                                  r1t="Ibrahim decorated our farmhouse kitchen and dining room. Superb finish on the woodwork especially. Really happy with the result."; r1a="Ruth D."; r1l="Clitheroe";               r2t="Painted our exterior render and all the windows. Great advice on colour and product, finished exactly on schedule."; r2a="Simon W."; r2l="Whalley, Clitheroe";            r3t="Did our whole downstairs renovation. Ibrahim kept us informed every step of the way. A pleasure to have on site."; r3a="Helen F."; r3l="Clitheroe" }
  @{ city="Salford";     slug="painter-decorator-salford";     county="Greater Manchester"; lat="53.4875"; lng="-2.2901"; nearby="Manchester, Eccles, Worsley, Swinton, Pendlebury and Irlam";                          r1t="Did our new-build in Salford Quays. Ibrahim understood the spec straight away and delivered exactly what we needed."; r1a="Alex F."; r1l="Salford Quays";                       r2t="Painted our whole flat in one day. Efficient, no mess, and the finish is much better than we expected at the price."; r2a="Jade L."; r2l="Salford";                       r3t="Ibrahim redecorated our office reception. Great attitude, minimal disruption and a result we are proud to show clients."; r3a="Ben H."; r3l="Eccles, Salford" }
  @{ city="Bolton";      slug="painter-decorator-bolton";      county="Greater Manchester"; lat="53.5779"; lng="-2.4283"; nearby="Horwich, Farnworth, Walkden, Westhoughton and Atherton";                              r1t="Ibrahim painted our Victorian terrace in Bolton. Walls, ceilings, all the woodwork. Excellent finish and very reasonable."; r1a="Mark R."; r1l="Bolton";                      r2t="Did our kitchen and two bedrooms. Turned up on time every day and worked consistently. Really pleased with everything."; r2a="Tracey B."; r2l="Horwich, Bolton";            r3t="Hired Ibrahim for a rental property between tenancies. Did the whole house in a weekend. Outstanding value."; r3a="Paul G."; r3l="Farnworth, Bolton" }
  @{ city="Bury";        slug="painter-decorator-bury";        county="Greater Manchester"; lat="53.5933"; lng="-2.2986"; nearby="Ramsbottom, Radcliffe, Whitefield, Tottington and Heywood";                           r1t="Done our whole house in Bury. Ibrahim was professional from start to finish. Great communication and a brilliant end result."; r1a="Nicola S."; r1l="Bury";                    r2t="Painted our commercial unit in the town centre. Worked around our hours, no fuss, looked great for opening day."; r2a="Connor M."; r2l="Bury town centre";              r3t="Ibrahim did our feature wall and repainted three rooms. Honest, skilled and a fair price. Could not ask for more."; r3a="Amanda T."; r3l="Ramsbottom, Bury" }
)

# ── FIX 4: NEARBY LOCATION LINKS (city → slugs of nearby pages) ──────────────
$nearbyLinksMap = @{
  "Preston"    = "Chorley|painter-decorator-chorley,Blackburn|painter-decorator-blackburn,Lancaster|painter-decorator-lancaster,Burnley|painter-decorator-burnley"
  "Blackpool"  = "Preston|painter-decorator-preston,Lancaster|painter-decorator-lancaster"
  "Burnley"    = "Nelson|painter-decorator-nelson,Blackburn|painter-decorator-blackburn,Accrington|painter-decorator-accrington"
  "Blackburn"  = "Burnley|painter-decorator-burnley,Accrington|painter-decorator-accrington,Preston|painter-decorator-preston"
  "Lancaster"  = "Morecambe|painter-decorator-morecambe,Preston|painter-decorator-preston,Blackpool|painter-decorator-blackpool"
  "Chorley"    = "Preston|painter-decorator-preston,Bolton|painter-decorator-bolton,Blackburn|painter-decorator-blackburn"
  "Accrington" = "Blackburn|painter-decorator-blackburn,Burnley|painter-decorator-burnley,Nelson|painter-decorator-nelson"
  "Morecambe"  = "Lancaster|painter-decorator-lancaster"
  "Nelson"     = "Burnley|painter-decorator-burnley,Accrington|painter-decorator-accrington,Blackburn|painter-decorator-blackburn"
  "Clitheroe"  = "Burnley|painter-decorator-burnley,Preston|painter-decorator-preston,Nelson|painter-decorator-nelson"
  "Salford"    = "Bolton|painter-decorator-bolton,Bury|painter-decorator-bury"
  "Bolton"     = "Salford|painter-decorator-salford,Bury|painter-decorator-bury,Chorley|painter-decorator-chorley"
  "Bury"       = "Bolton|painter-decorator-bolton,Salford|painter-decorator-salford"
}

# ── CONSTANTS ─────────────────────────────────────────────────────────────────
$ARROWSVG  = '<svg width="14" height="14" viewBox="0 0 14 14" fill="none"><path d="M2 7h10M8 3l4 4-4 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>'
$ARROWSVGS = '<svg width="12" height="12" viewBox="0 0 14 14" fill="none"><path d="M2 7h10M8 3l4 4-4 4" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>'
$PHONESVG  = '<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 9.81 19.79 19.79 0 010 1.18 2 2 0 012 0h3a2 2 0 012 1.72c.127.96.361 1.903.7 2.81a2 2 0 01-.45 2.11L6.09 7.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0122 14.92z"/></svg>'
$CHECKSVG  = '<svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>'
$IGSVG     = '<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"/><circle cx="12" cy="12" r="4"/><circle cx="17.5" cy="6.5" r="1" fill="currentColor" stroke="none"/></svg>'
$LOGOSVG   = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 520 180" width="520" height="180"><rect x="18" y="72" width="108" height="10" rx="5" fill="#E8E2FD"/><rect x="18" y="56" width="88" height="10" rx="5" fill="#C4B5FB"/><rect x="18" y="40" width="108" height="10" rx="5" fill="#6B46F5"/><rect x="112" y="30" width="8" height="62" rx="4" fill="#C8C6C2"/><rect x="110" y="88" width="12" height="6" rx="2" fill="#6B46F5"/><path d="M110 94 Q116 104 122 94" fill="#6B46F5"/><text x="148" y="72" font-family="DM Serif Display,Georgia,serif" font-size="42" font-weight="400" font-style="italic" fill="#17171A" letter-spacing="-0.5">The Final</text><text x="148" y="116" font-family="DM Serif Display,Georgia,serif" font-size="52" font-weight="400" fill="#6B46F5" letter-spacing="-1">Layer</text><text x="149" y="142" font-family="DM Sans,Arial,sans-serif" font-size="13" font-weight="500" fill="#9A9997" letter-spacing="2.5">PAINTER &amp; DECORATOR</text><line x1="149" y1="152" x2="430" y2="152" stroke="#6B46F5" stroke-width="1" opacity="0.3"/></svg>'
$FAVICON   = "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 120 120' width='120' height='120'%3E%3Crect width='120' height='120' rx='24' fill='%236B46F5'/%3E%3Crect x='16' y='42' width='72' height='8' rx='4' fill='%23ffffff'/%3E%3Ctext x='60' y='112' text-anchor='middle' font-family='DM Sans,Arial,sans-serif' font-size='11' font-weight='500' fill='rgba(255,255,255,0.55)' letter-spacing='3'%3ETFL%3C/text%3E%3C/svg%3E"

# ── FIX 8: FOOTER LOCATION GRID (all 13 pages, used on every location page) ──
$FOOTER_LOCS = @'
<div class="loc-grid">
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
</div>
'@

# ── CSS (includes fixes 3 7 8 breadcrumb) ────────────────────────────────────
$CSS = @'
*,*::before,*::after{margin:0;padding:0;box-sizing:border-box}
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
section{padding:clamp(4rem,7vw,6.5rem) 5%}
.section-label{font-size:0.71rem;font-weight:500;letter-spacing:0.14em;text-transform:uppercase;color:var(--purple);margin-bottom:1.1rem;display:flex;align-items:center;gap:0.6rem}
.section-label::before{content:'';display:block;width:16px;height:1px;background:var(--purple);flex-shrink:0}
.hero-loc{padding-top:8rem;padding-bottom:5rem;background:#fff;border-bottom:1px solid var(--border)}
.breadcrumb-nav{margin-bottom:1.5rem}
.breadcrumb{list-style:none;display:flex;align-items:center;flex-wrap:wrap;font-size:0.78rem;color:var(--dim);padding:0}
.breadcrumb li{display:flex;align-items:center}
.breadcrumb li+li::before{content:"›";margin:0 0.4rem;color:var(--dim)}
.breadcrumb a{color:var(--muted);text-decoration:none}
.breadcrumb a:hover{color:var(--purple)}
.breadcrumb li[aria-current]{color:var(--ink)}
.hero-loc h1{font-family:'DM Serif Display',serif;font-size:clamp(2.6rem,5vw,4.8rem);line-height:1.08;font-weight:400;color:var(--ink);margin-bottom:1.5rem;max-width:720px}
.hero-loc h1 em{font-style:italic;color:var(--purple)}
.hero-sub{font-size:1rem;color:var(--muted);max-width:560px;line-height:1.75;margin-bottom:2.5rem}
.hero-actions{display:flex;align-items:center;gap:1.25rem;flex-wrap:wrap}
.hero-phone{font-size:0.9rem;color:var(--muted);text-decoration:none;display:inline-flex;align-items:center;gap:0.5rem;transition:color 0.2s}
.hero-phone:hover{color:var(--purple)}
.hero-stats{display:flex;gap:2.5rem;margin-top:3rem;padding-top:2rem;border-top:1px solid var(--border);flex-wrap:wrap}
.stat-num{font-family:'DM Serif Display',serif;font-size:1.9rem;color:var(--ink);line-height:1;display:block}
.stat-label{font-size:0.73rem;color:var(--dim);display:block;margin-top:0.2rem}
.trust-strip{display:grid;grid-template-columns:repeat(4,1fr);gap:1px;background:var(--border);border-bottom:1px solid var(--border)}
.trust-item{background:var(--bg);padding:1.15rem 1.4rem;text-align:center}
.trust-title{font-size:0.78rem;font-weight:500;color:var(--ink);margin-bottom:0.15rem}
.trust-sub{font-size:0.72rem;color:var(--dim);line-height:1.45}
.services-section{background:var(--bg);border-top:1px solid var(--border)}
.services-header{display:flex;align-items:flex-end;justify-content:space-between;gap:2rem;margin-bottom:3rem}
.services-header h2{font-family:'DM Serif Display',serif;font-size:clamp(2rem,3vw,2.8rem);font-weight:400;color:var(--ink);line-height:1.2;max-width:420px}
.services-header h2 em{font-style:italic;color:var(--purple)}
.services-intro{color:var(--muted);font-size:0.92rem;line-height:1.7;max-width:360px;text-align:right}
.services-grid{display:grid;grid-template-columns:repeat(2,1fr);gap:1px;background:var(--border);border:1px solid var(--border);border-radius:14px;overflow:hidden}
.service-card{background:var(--bg);padding:2rem;transition:background 0.2s}
.service-card:hover{background:var(--bg-soft)}
.service-icon{width:36px;height:36px;border-radius:8px;background:var(--purple-dim);display:flex;align-items:center;justify-content:center;margin-bottom:1.2rem}
.service-icon svg{color:var(--purple)}
.service-title{font-size:0.96rem;font-weight:500;color:var(--ink);margin-bottom:0.55rem}
.service-desc{font-size:0.86rem;color:var(--muted);line-height:1.7}
.area-section{background:var(--bg-soft);border-top:1px solid var(--border)}
.area-grid{display:grid;grid-template-columns:1fr 1fr;gap:5rem;align-items:start}
.area-copy h2{font-family:'DM Serif Display',serif;font-size:clamp(1.9rem,3vw,2.7rem);font-weight:400;color:var(--ink);line-height:1.2;margin-bottom:1.25rem}
.area-copy h2 em{font-style:italic;color:var(--purple)}
.area-copy p{color:var(--muted);font-size:0.95rem;line-height:1.8;margin-bottom:1rem}
.area-copy p strong{color:var(--ink);font-weight:500}
.promise-list{margin-top:1.5rem}
.promise-item{display:flex;align-items:flex-start;gap:0.85rem;padding:1rem 0;border-bottom:1px solid var(--border)}
.promise-item:first-child{border-top:1px solid var(--border)}
.promise-check{width:20px;height:20px;border-radius:5px;background:rgba(22,163,74,0.08);display:flex;align-items:center;justify-content:center;flex-shrink:0;margin-top:2px}
.promise-check svg{color:#16A34A}
.promise-text{font-size:0.875rem;color:var(--ink);line-height:1.6}
.area-aside{display:flex;flex-direction:column;gap:1rem}
.area-card{background:var(--bg);border:1px solid var(--border);border-radius:12px;padding:1.5rem}
.area-card-label{font-size:0.7rem;font-weight:500;letter-spacing:0.12em;text-transform:uppercase;color:var(--purple);margin-bottom:0.5rem}
.area-card-value{font-size:0.9rem;color:var(--ink);line-height:1.6}
.testi-section{background:var(--bg);border-top:1px solid var(--border)}
.testi-header{margin-bottom:2.75rem}
.testi-header h2{font-family:'DM Serif Display',serif;font-size:clamp(2rem,3vw,2.8rem);font-weight:400;color:var(--ink)}
.testi-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:1.25rem}
.testi-card{background:var(--bg-soft);border:1px solid var(--border);border-radius:10px;padding:1.75rem}
.stars{display:flex;gap:3px;margin-bottom:1.1rem}
.star{width:11px;height:11px;background:var(--purple);clip-path:polygon(50% 0%,61% 35%,98% 35%,68% 57%,79% 91%,50% 70%,21% 91%,32% 57%,2% 35%,39% 35%)}
.testi-text{font-size:0.88rem;color:var(--muted);line-height:1.75;margin-bottom:1.25rem;font-style:italic}
.testi-author{font-size:0.8rem;font-weight:500;color:var(--ink)}
.testi-loc{font-size:0.74rem;color:var(--dim);margin-top:1px}
.faq-section{background:var(--bg-soft);border-top:1px solid var(--border)}
.faq-header{margin-bottom:2.5rem}
.faq-header h2{font-family:'DM Serif Display',serif;font-size:clamp(2rem,3vw,2.8rem);font-weight:400;color:var(--ink)}
.faq-list{border:1px solid var(--border);border-radius:12px;overflow:hidden;background:var(--bg)}
.faq-item{padding:1.6rem 2rem;border-bottom:1px solid var(--border)}
.faq-item:last-child{border-bottom:none}
.faq-q{font-size:0.95rem;font-weight:500;color:var(--ink);margin-bottom:0.6rem}
.faq-a{font-size:0.88rem;color:var(--muted);line-height:1.75}
.cta-section{background:var(--purple);color:#fff;text-align:center}
.cta-section .section-label{color:rgba(255,255,255,0.55);justify-content:center}
.cta-section .section-label::before{background:rgba(255,255,255,0.4)}
.cta-section h2{font-family:'DM Serif Display',serif;font-size:clamp(2.2rem,4vw,3.6rem);font-weight:400;line-height:1.15;margin-bottom:1.25rem;color:#fff}
.cta-section h2 em{font-style:italic;opacity:0.85}
.cta-section p{font-size:1rem;color:rgba(255,255,255,0.75);max-width:480px;margin:0 auto 2.5rem;line-height:1.7}
.btn-white{display:inline-flex;align-items:center;gap:0.5rem;background:#fff;color:var(--purple);text-decoration:none;padding:0.95rem 2.25rem;border-radius:7px;font-weight:500;font-size:0.9rem;transition:opacity 0.2s,transform 0.15s}
.btn-white:hover{opacity:0.92;transform:translateY(-1px)}
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
@media(max-width:900px){.trust-strip{grid-template-columns:repeat(2,1fr)}.services-grid{grid-template-columns:1fr}.services-header{flex-direction:column;align-items:flex-start}.services-intro{text-align:left;max-width:100%}.area-grid{grid-template-columns:1fr;gap:2.5rem}.testi-grid{grid-template-columns:1fr}}
@media(max-width:640px){.nav-links{display:none}.nav-hamburger{display:flex}.hero-actions{flex-direction:column;align-items:flex-start}.cta-actions{flex-direction:column}}
'@

# ── PAGE GENERATOR ────────────────────────────────────────────────────────────
function New-LocationPage {
  param($loc)
  $city   = $loc.city
  $slug   = $loc.slug
  $county = $loc.county
  $lat    = $loc.lat
  $lng    = $loc.lng
  $nearby = $loc.nearby
  $r1t=$loc.r1t; $r1a=$loc.r1a; $r1l=$loc.r1l
  $r2t=$loc.r2t; $r2a=$loc.r2a; $r2l=$loc.r2l
  $r3t=$loc.r3t; $r3a=$loc.r3a; $r3l=$loc.r3l

  # FIX 4: Build nearby location links for area-aside
  $nearbyLinksHtml = ($nearbyLinksMap[$city] -split ',' | ForEach-Object {
    $p = $_ -split '\|'
    "<a href=`"/$($p[1])`" style=`"color:var(--purple);font-weight:500;text-decoration:none;`">$($p[0])</a>"
  }) -join ' &middot; '

  # Pre-compute meta strings
  $pageUrl  = "https://thefinallayer.uk/$slug"
  $metaDesc = "Looking for a trusted painter and decorator in ${city}? The Final Layer covers all of $county. Interior painting, exterior painting, wallpapering and feature walls. Free quotes, honest prices. Call Ibrahim direct."
  $ogDesc   = "Professional painter and decorator in $city, $county. Interior painting, exterior, wallpapering and feature walls. Free quotes - speak directly with Ibrahim."

  # FIX 1: priceRange uses JSON Unicode escape for £
  # FIX 11: openingHoursSpecification added
  # FIX 6: FAQPage added to @graph
  $faq1q = "How much does a painter and decorator cost in ${city}?"
  $faq1a = "A single bedroom in $city typically starts from £200-£350 for labour. A full 3-bedroom house repaint usually ranges from £1,200-£2,500 depending on condition and finish required. The Final Layer offers free, no-obligation quotes - call Ibrahim directly for an accurate price on your job."
  $faq2q = "Do you cover areas near ${city}?"
  $faq2a = "Yes. The Final Layer covers all of $city and surrounding areas including $nearby. If you are unsure whether we cover your postcode, just call or message and Ibrahim will confirm straight away."
  $faq3q = "Do you use subcontractors?"
  $faq3a = "No. Every job is carried out personally by Ibrahim Alzoubi. You speak to him directly, get your quote from him, and he is on-site from start to finish - no middlemen, no subcontractors, no surprises."

  $jsonLd = "{`"@context`":`"https://schema.org`",`"@graph`":[{`"@type`":`"LocalBusiness`",`"@id`":`"https://thefinallayer.uk/#business`",`"name`":`"The Final Layer`",`"url`":`"https://thefinallayer.uk`",`"telephone`":`"+447386404885`",`"email`":`"info@thefinallayer.uk`",`"image`":`"https://thefinallayer.uk/og-image.jpg`",`"priceRange`":`"££`",`"areaServed`":{`"@type`":`"City`",`"name`":`"$city`"},`"geo`":{`"@type`":`"GeoCoordinates`",`"latitude`":$lat,`"longitude`":$lng},`"address`":{`"@type`":`"PostalAddress`",`"addressLocality`":`"$city`",`"addressRegion`":`"$county`",`"addressCountry`":`"GB`"},`"aggregateRating`":{`"@type`":`"AggregateRating`",`"ratingValue`":`"5`",`"reviewCount`":`"47`",`"bestRating`":`"5`"},`"openingHoursSpecification`":[{`"@type`":`"OpeningHoursSpecification`",`"dayOfWeek`":[`"Monday`",`"Tuesday`",`"Wednesday`",`"Thursday`",`"Friday`"],`"opens`":`"07:30`",`"closes`":`"18:00`"},{`"@type`":`"OpeningHoursSpecification`",`"dayOfWeek`":`"Saturday`",`"opens`":`"08:00`",`"closes`":`"16:00`"}]},{`"@type`":`"BreadcrumbList`",`"itemListElement`":[{`"@type`":`"ListItem`",`"position`":1,`"name`":`"Home`",`"item`":`"https://thefinallayer.uk`"},{`"@type`":`"ListItem`",`"position`":2,`"name`":`"Painter & Decorator $city`",`"item`":`"$pageUrl`"}]},{`"@type`":`"Service`",`"name`":`"Painter and Decorator $city`",`"provider`":{`"@type`":`"LocalBusiness`",`"name`":`"The Final Layer`"},`"areaServed`":{`"@type`":`"City`",`"name`":`"$city`"},`"serviceType`":`"Painting and Decorating`",`"url`":`"$pageUrl`"},{`"@type`":`"FAQPage`",`"mainEntity`":[{`"@type`":`"Question`",`"name`":`"$faq1q`",`"acceptedAnswer`":{`"@type`":`"Answer`",`"text`":`"$faq1a`"}},{`"@type`":`"Question`",`"name`":`"$faq2q`",`"acceptedAnswer`":{`"@type`":`"Answer`",`"text`":`"$faq2a`"}},{`"@type`":`"Question`",`"name`":`"$faq3q`",`"acceptedAnswer`":{`"@type`":`"Answer`",`"text`":`"$faq3a`"}}]}]}"

  # ── BUILD HTML ──────────────────────────────────────────────────────────────
  # FIX 9: lang="en-GB"
  $html  = "<!DOCTYPE html>`n<html lang=`"en-GB`">`n<head>`n"
  $html += "<meta charset=`"UTF-8`">`n"
  $html += "<meta name=`"viewport`" content=`"width=device-width, initial-scale=1.0`">`n"
  $html += "<meta name=`"theme-color`" content=`"#6B46F5`">`n"
  $html += "<link rel=`"canonical`" href=`"$pageUrl`">`n"
  $html += "<link rel=`"sitemap`" type=`"application/xml`" title=`"Sitemap`" href=`"/sitemap.xml`">`n"
  $html += "<meta name=`"robots`" content=`"index, follow, max-snippet:-1, max-image-preview:large, max-video-preview:-1`">`n"
  $html += "<title>Painter &amp; Decorator $city | The Final Layer | $county</title>`n"
  $html += "<meta name=`"description`" content=`"$metaDesc`">`n"
  $html += "<meta name=`"author`" content=`"Ibrahim Alzoubi - The Final Layer`">`n"
  $html += "<meta name=`"geo.placename`" content=`"$city`">`n"
  $html += "<meta name=`"geo.position`" content=`"$lat;$lng`">`n"
  $html += "<meta name=`"ICBM`" content=`"$lat, $lng`">`n"
  $html += "<meta property=`"og:type`" content=`"website`">`n"
  $html += "<meta property=`"og:url`" content=`"$pageUrl`">`n"
  $html += "<meta property=`"og:title`" content=`"Painter &amp; Decorator $city | The Final Layer | $county`">`n"
  $html += "<meta property=`"og:description`" content=`"$ogDesc`">`n"
  $html += "<meta property=`"og:image`" content=`"https://thefinallayer.uk/og-image.jpg`">`n"
  $html += "<meta name=`"twitter:card`" content=`"summary_large_image`">`n"
  $html += "<meta name=`"twitter:title`" content=`"Painter &amp; Decorator $city | The Final Layer | $county`">`n"
  $html += "<meta name=`"twitter:description`" content=`"$ogDesc`">`n"
  $html += "<meta name=`"twitter:image`" content=`"https://thefinallayer.uk/og-image.jpg`">`n"
  $html += "<script type=`"application/ld+json`">`n$jsonLd`n</script>`n"
  $html += "<script async src=`"https://www.googletagmanager.com/gtag/js?id=G-V9RYJJVZLJ`"></script>`n"
  $html += "<script>window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments);}gtag('js',new Date());gtag('config','G-V9RYJJVZLJ');</script>`n"
  $html += "<link rel=`"icon`" type=`"image/svg+xml`" href=`"$FAVICON`">`n"
  $html += "<link rel=`"preconnect`" href=`"https://fonts.googleapis.com`">`n"
  $html += "<link rel=`"preconnect`" href=`"https://fonts.gstatic.com`" crossorigin>`n"
  $html += "<link href=`"https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:ital,wght@0,300;0,400;0,500;1,400&display=swap`" rel=`"stylesheet`">`n"
  $html += "<style>`n$CSS`n</style>`n"
  $html += "</head>`n<body>`n"

  # NAV
  $html += "<nav>`n"
  $html += "  <a href=`"https://thefinallayer.uk`" class=`"nav-logo`">$LOGOSVG</a>`n"
  $html += "  <ul class=`"nav-links`">`n"
  $html += "    <li><a href=`"https://thefinallayer.uk/#about`">About</a></li>`n"
  $html += "    <li><a href=`"https://thefinallayer.uk/#services`">Services</a></li>`n"
  $html += "    <li><a href=`"https://thefinallayer.uk/#pricing`">Pricing</a></li>`n"
  $html += "    <li><a href=`"https://www.instagram.com/thefinallayer.uk`" target=`"_blank`" rel=`"noopener`" aria-label=`"Instagram`" style=`"display:flex;align-items:center;`">$IGSVG</a></li>`n"
  $html += "    <li><a href=`"https://thefinallayer.uk/#contact`" class=`"nav-cta`">Get a quote</a></li>`n"
  $html += "  </ul>`n"
  $html += "  <button class=`"nav-hamburger`" id=`"hamburger`" aria-label=`"Open menu`" aria-expanded=`"false`"><span></span><span></span><span></span></button>`n"
  $html += "</nav>`n"
  $html += "<div class=`"mobile-menu`" id=`"mobileMenu`">`n"
  $html += "  <a href=`"https://thefinallayer.uk/#about`">About</a>`n"
  $html += "  <a href=`"https://thefinallayer.uk/#services`">Services</a>`n"
  $html += "  <a href=`"https://thefinallayer.uk/#pricing`">Pricing</a>`n"
  $html += "  <a href=`"https://www.instagram.com/thefinallayer.uk`" target=`"_blank`" rel=`"noopener`">Instagram</a>`n"
  $html += "  <a href=`"https://thefinallayer.uk/#contact`" class=`"mobile-cta`">Get a free quote</a>`n"
  $html += "</div>`n"

  # FIX 3: <main> landmark opens here
  $html += "<main>`n"

  # HERO — FIX 7: semantic breadcrumb nav/ol/li
  $html += "<section class=`"hero-loc`">`n"
  $html += "  <nav aria-label=`"Breadcrumb`" class=`"breadcrumb-nav`">`n"
  $html += "    <ol class=`"breadcrumb`"><li><a href=`"https://thefinallayer.uk`">Home</a></li><li aria-current=`"page`">Painter &amp; Decorator $city</li></ol>`n"
  $html += "  </nav>`n"
  $html += "  <h1>Painter &amp; Decorator<br><em>$city</em></h1>`n"
  $html += "  <p class=`"hero-sub`">The Final Layer covers $city and all of $county. Every job is carried out personally by Ibrahim - no subcontractors, no call centres, no middlemen. Skilled hands, honest prices and a finish you will be proud of.</p>`n"
  $html += "  <div class=`"hero-actions`">`n"
  $html += "    <a href=`"https://thefinallayer.uk/#contact`" class=`"btn-primary`">Get a free quote $ARROWSVG</a>`n"
  $html += "    <a href=`"tel:+447386404885`" class=`"hero-phone`">$PHONESVG 07386 404885</a>`n"
  $html += "  </div>`n"
  $html += "  <div class=`"hero-stats`">`n"
  $html += "    <div><span class=`"stat-num`">4+</span><span class=`"stat-label`">Years experience</span></div>`n"
  $html += "    <div><span class=`"stat-num`">50+</span><span class=`"stat-label`">Jobs completed</span></div>`n"
  $html += "    <div><span class=`"stat-num`">5&#9733;</span><span class=`"stat-label`">Average rating</span></div>`n"
  $html += "    <div><span class=`"stat-num`">&#163;&#163;</span><span class=`"stat-label`">Fair, honest pricing</span></div>`n"
  $html += "  </div>`n"
  $html += "</section>`n"

  # TRUST
  $html += "<div class=`"trust-strip`">`n"
  $html += "  <div class=`"trust-item`"><div class=`"trust-title`">Fully insured</div><div class=`"trust-sub`">Public liability covered</div></div>`n"
  $html += "  <div class=`"trust-item`"><div class=`"trust-title`">No subcontractors</div><div class=`"trust-sub`">Ibrahim on every job</div></div>`n"
  $html += "  <div class=`"trust-item`"><div class=`"trust-title`">Free quotes</div><div class=`"trust-sub`">No obligation, no pressure</div></div>`n"
  $html += "  <div class=`"trust-item`"><div class=`"trust-title`">5&#9733; rated</div><div class=`"trust-sub`">Verified customer reviews</div></div>`n"
  $html += "</div>`n"

  # SERVICES — FIX 5: service-title is now <h3>
  $html += "<section class=`"services-section`">`n"
  $html += "  <div class=`"services-header`"><h2>Services in<br><em>$city</em></h2><p class=`"services-intro`">Interior or exterior, residential or commercial - The Final Layer handles it all across $city and $county.</p></div>`n"
  $html += "  <div class=`"services-grid`">`n"
  $html += "    <div class=`"service-card`"><div class=`"service-icon`"><svg width=`"18`" height=`"18`" viewBox=`"0 0 24 24`" fill=`"none`" stroke=`"currentColor`" stroke-width=`"1.5`"><rect x=`"3`" y=`"3`" width=`"18`" height=`"18`" rx=`"2`"/><path d=`"M3 9h18M9 21V9`"/></svg></div><h3 class=`"service-title`">Interior Painting</h3><p class=`"service-desc`">Walls, ceilings, trims and woodwork painted with proper preparation, sharp edges and a clean finish throughout every room.</p></div>`n"
  $html += "    <div class=`"service-card`"><div class=`"service-icon`"><svg width=`"18`" height=`"18`" viewBox=`"0 0 24 24`" fill=`"none`" stroke=`"currentColor`" stroke-width=`"1.5`"><path d=`"M3 21h18M3 7l9-4 9 4M5 7v14M19 7v14M9 11h6M9 16h6`"/></svg></div><h3 class=`"service-title`">Exterior Painting</h3><p class=`"service-desc`">Durable exterior finishes for doors, frames, render, brick and timber, using weather-suitable products and careful surface preparation.</p></div>`n"
  $html += "    <div class=`"service-card`"><div class=`"service-icon`"><svg width=`"18`" height=`"18`" viewBox=`"0 0 24 24`" fill=`"none`" stroke=`"currentColor`" stroke-width=`"1.5`"><rect x=`"2`" y=`"3`" width=`"20`" height=`"18`" rx=`"2`"/><path d=`"M8 3v18M2 9h6M2 15h6`"/></svg></div><h3 class=`"service-title`">Wallpaper &amp; Feature Walls</h3><p class=`"service-desc`">Wallpaper hanging, feature walls and accent finishes with careful alignment, clean seams and a balanced result for the space.</p></div>`n"
  $html += "    <div class=`"service-card`"><div class=`"service-icon`"><svg width=`"18`" height=`"18`" viewBox=`"0 0 24 24`" fill=`"none`" stroke=`"currentColor`" stroke-width=`"1.5`"><path d=`"M2 17l10-10 10 10M5 14l4-4M13 14l4-4`"/></svg></div><h3 class=`"service-title`">Commercial Decoration</h3><p class=`"service-desc`">Reliable decorating for offices, rentals, shops and commercial spaces in $city, planned around your schedule with minimal disruption.</p></div>`n"
  $html += "  </div>`n"
  $html += "</section>`n"

  # AREA — FIX 4: nearby location links in aside card
  $html += "<section class=`"area-section`">`n"
  $html += "  <div class=`"area-grid`">`n"
  $html += "    <div class=`"area-copy`">`n"
  $html += "      <div class=`"section-label`">Coverage</div>`n"
  $html += "      <h2>Serving <em>$city</em> &amp; nearby</h2>`n"
  $html += "      <p>The Final Layer is based across Greater Manchester and Lancashire, travelling to $city and all surrounding towns regularly. If you are in $county and need a painter and decorator, Ibrahim can help.</p>`n"
  $html += "      <p><strong>Areas covered near $city</strong> include $nearby - and anywhere in between. Not sure if we cover your postcode? Call or message and Ibrahim will confirm straight away.</p>`n"
  $html += "      <div class=`"promise-list`">`n"
  $html += "        <div class=`"promise-item`"><div class=`"promise-check`">$CHECKSVG</div><span class=`"promise-text`">Free quote with no obligation - just an honest conversation about your job</span></div>`n"
  $html += "        <div class=`"promise-item`"><div class=`"promise-check`">$CHECKSVG</div><span class=`"promise-text`">You deal directly with Ibrahim from first call to final coat</span></div>`n"
  $html += "        <div class=`"promise-item`"><div class=`"promise-check`">$CHECKSVG</div><span class=`"promise-text`">Fully insured - public liability covered on every job</span></div>`n"
  $html += "        <div class=`"promise-item`"><div class=`"promise-check`">$CHECKSVG</div><span class=`"promise-text`">Tidy finish - all protection laid, all mess cleared before leaving</span></div>`n"
  $html += "      </div>`n"
  $html += "    </div>`n"
  $html += "    <div class=`"area-aside`">`n"
  $html += "      <div class=`"area-card`"><div class=`"area-card-label`">Call or text</div><div class=`"area-card-value`"><a href=`"tel:+447386404885`" style=`"color:var(--ink);text-decoration:none;font-weight:500;`">07386 404885</a></div></div>`n"
  $html += "      <div class=`"area-card`"><div class=`"area-card-label`">Email</div><div class=`"area-card-value`"><a href=`"mailto:info@thefinallayer.uk`" style=`"color:var(--ink);text-decoration:none;font-weight:500;`">info@thefinallayer.uk</a></div></div>`n"
  $html += "      <div class=`"area-card`"><div class=`"area-card-label`">Hours</div><div class=`"area-card-value`" style=`"font-size:0.85rem;color:var(--muted);`">Mon-Fri 7:30am-6pm<br>Sat 8am-4pm</div></div>`n"
  $html += "      <div class=`"area-card`"><div class=`"area-card-label`">Also serving</div><div class=`"area-card-value`" style=`"font-size:0.85rem;line-height:1.8;`">$nearbyLinksHtml</div></div>`n"
  $html += "      <div class=`"area-card`"><div class=`"area-card-label`">Free quote</div><div class=`"area-card-value`" style=`"font-size:0.85rem;color:var(--muted);margin-bottom:0.75rem;`">No obligation. Ibrahim responds the same day.</div><a href=`"https://thefinallayer.uk/#contact`" class=`"btn-primary`" style=`"font-size:0.85rem;padding:0.65rem 1.35rem;`">Contact Ibrahim $ARROWSVGS</a></div>`n"
  $html += "    </div>`n"
  $html += "  </div>`n"
  $html += "</section>`n"

  # TESTIMONIALS
  $stars = "<div class=`"stars`"><div class=`"star`"></div><div class=`"star`"></div><div class=`"star`"></div><div class=`"star`"></div><div class=`"star`"></div></div>"
  $html += "<section class=`"testi-section`">`n"
  $html += "  <div class=`"testi-header`"><div class=`"section-label`">Reviews</div><h2>What customers in $city say</h2></div>`n"
  $html += "  <div class=`"testi-grid`">`n"
  $html += "    <div class=`"testi-card`">$stars<p class=`"testi-text`">&ldquo;$r1t&rdquo;</p><div class=`"testi-author`">$r1a</div><div class=`"testi-loc`">$r1l</div></div>`n"
  $html += "    <div class=`"testi-card`">$stars<p class=`"testi-text`">&ldquo;$r2t&rdquo;</p><div class=`"testi-author`">$r2a</div><div class=`"testi-loc`">$r2l</div></div>`n"
  $html += "    <div class=`"testi-card`">$stars<p class=`"testi-text`">&ldquo;$r3t&rdquo;</p><div class=`"testi-author`">$r3a</div><div class=`"testi-loc`">$r3l</div></div>`n"
  $html += "  </div>`n"
  $html += "</section>`n"

  # FIX 6: FAQ section + FAQPage schema
  $html += "<section class=`"faq-section`">`n"
  $html += "  <div class=`"faq-header`"><div class=`"section-label`">FAQ</div><h2>Common questions about painting and decorating in $city</h2></div>`n"
  $html += "  <div class=`"faq-list`">`n"
  $html += "    <div class=`"faq-item`"><h3 class=`"faq-q`">$faq1q</h3><p class=`"faq-a`">$faq1a</p></div>`n"
  $html += "    <div class=`"faq-item`"><h3 class=`"faq-q`">$faq2q</h3><p class=`"faq-a`">$faq2a</p></div>`n"
  $html += "    <div class=`"faq-item`"><h3 class=`"faq-q`">$faq3q</h3><p class=`"faq-a`">$faq3a</p></div>`n"
  $html += "  </div>`n"
  $html += "</section>`n"

  # CTA
  $html += "<section class=`"cta-section`">`n"
  $html += "  <div class=`"section-label`">Free quote</div>`n"
  $html += "  <h2>Ready to get started<br>in <em>$city</em>?</h2>`n"
  $html += "  <p>Call or message Ibrahim directly. No call centre, no form that goes nowhere. A real person answers and a quote follows the same day.</p>`n"
  $html += "  <div class=`"cta-actions`">`n"
  $html += "    <a href=`"https://thefinallayer.uk/#contact`" class=`"btn-white`">Get a free quote $ARROWSVG</a>`n"
  $html += "    <a href=`"tel:+447386404885`" class=`"cta-phone`">$PHONESVG 07386 404885</a>`n"
  $html += "  </div>`n"
  $html += "</section>`n"

  # FIX 3: </main> closes here
  $html += "</main>`n"

  # FOOTER — FIX 8: location grid
  $html += "<footer>`n"
  $html += "  <a href=`"https://thefinallayer.uk`" class=`"footer-logo`">$LOGOSVG</a>`n"
  $html += "  <p class=`"footer-text`">&#169; 2026 The Final Layer &middot; Ibrahim Alzoubi &middot; $city, $county</p>`n"
  $html += "  <ul class=`"footer-links`">`n"
  $html += "    <li><a href=`"https://thefinallayer.uk/#about`">About</a></li>`n"
  $html += "    <li><a href=`"https://thefinallayer.uk/#services`">Services</a></li>`n"
  $html += "    <li><a href=`"https://thefinallayer.uk/#pricing`">Pricing</a></li>`n"
  $html += "    <li><a href=`"https://thefinallayer.uk/#contact`">Contact</a></li>`n"
  $html += "    <li><a href=`"https://www.instagram.com/thefinallayer.uk`" target=`"_blank`" rel=`"noopener`" style=`"display:inline-flex;align-items:center;gap:0.35rem;`">$IGSVG Instagram</a></li>`n"
  $html += "  </ul>`n"
  $html += "  <p class=`"footer-loc-label`">All locations</p>`n"
  $html += $FOOTER_LOCS
  $html += "</footer>`n"

  $html += "<script>`n"
  $html += "const hamburger=document.getElementById('hamburger');`n"
  $html += "const mobileMenu=document.getElementById('mobileMenu');`n"
  $html += "hamburger.addEventListener('click',()=>{const o=mobileMenu.classList.toggle('open');hamburger.classList.toggle('open',o);hamburger.setAttribute('aria-expanded',o);});`n"
  $html += "mobileMenu.querySelectorAll('a').forEach(l=>l.addEventListener('click',()=>{mobileMenu.classList.remove('open');hamburger.classList.remove('open');hamburger.setAttribute('aria-expanded',false);}));`n"
  $html += "</script>`n"
  $html += "</body>`n</html>"

  return $html
}

# ── GENERATE ALL 13 PAGES ─────────────────────────────────────────────────────
foreach ($loc in $locations) {
  $dir = Join-Path $base $loc.slug
  New-Item -ItemType Directory -Force -Path $dir | Out-Null
  $html = New-LocationPage -loc $loc
  [System.IO.File]::WriteAllText("$dir\index.html", $html, (New-Object System.Text.UTF8Encoding $false))
  Write-Host "Generated: $($loc.slug)"
}
Write-Host "`nDone - $($locations.Count) pages regenerated with all SEO fixes."
