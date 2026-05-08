<style>

  @font-face {
    font-family: 'Maple Mono NF CN';
    src: url('static/fonts/MapleMono-NF-CN-Light.woff2') format('woff2');
    font-weight: 300;
    font-style: normal;
    font-display: swap;
  }
  @font-face {
    font-family: 'Maple Mono NF CN';
    src: url('static/fonts/MapleMono-NF-CN-LightItalic.woff2') format('woff2');
    font-weight: 300;
    font-style: italic;
    font-display: swap;
  }
  @font-face {
    font-family: 'Maple Mono NF CN';
    src: url('static/fonts/MapleMono-NF-CN-SemiBold.woff2') format('woff2');
    font-weight: 600;
    font-style: normal;
    font-display: swap;
  }
  @font-face {
    font-family: 'Maple Mono NF CN';
    src: url('static/fonts/MapleMono-NF-CN-SemiBoldItalic.woff2') format('woff2');
    font-weight: 600;
    font-style: italic;
    font-display: swap;
  }

  body, code, pre {
    font-family: 'Maple Mono NF CN', monospace;
    font-weight: 300;
  }

  /* ── Custom primary palette: misty rain cyan ── */
  :root {
    --color-primary-50:  #dff0ed;
    --color-primary-100: #c8e6e2;
    --color-primary-200: #a8d6d1;
    --color-primary-300: #82c0ba;
    --color-primary-400: #5ea49e;
    --color-primary-500: #458a84;
    --color-primary-600: #38706b;
    --color-primary-700: #2f5a57;
    --color-primary-800: #274947;
    --color-primary-900: #213c3a;
    --color-primary-950: #122221;
  }

  /* dark mode: shift accent colors lighter so they're visible on gray-900 */
  html.dark {
    --color-primary-300: #a8d6d1;
    --color-primary-400: #82c0ba;
    --color-primary-500: #6aadaa;
    --color-primary-600: #529189;
    --color-primary-950: #0f1f1e;
  }

  /* ── Home: CSS vars for dark-aware inline colors ── */
  .home-card {
    --home-title:    #1e3d38;
    --home-subtitle: rgba(60, 100, 90, 0.55);
  }
  .dark .home-card {
    --home-title:    #c8eeea;
    --home-subtitle: rgba(160, 215, 205, 0.55);
  }

  /* ── Home: misty rain cyan ── */
  .home-bg {
    position: fixed;
    inset: 0;
    z-index: -1;
    background: linear-gradient(145deg, #eef4f2 0%, #e0ece9 50%, #eaf2f0 100%);
  }

  /* diffuse light through rain-wet glass */
  .home-bg::before {
    content: '';
    position: absolute;
    inset: 0;
    background:
      radial-gradient(ellipse 60% 50% at 85% 8%, rgba(160,210,200,0.18) 0%, transparent 70%),
      radial-gradient(ellipse 40% 60% at 12% 88%, rgba(140,190,185,0.10) 0%, transparent 70%);
  }

  /* mist particles — soft, slow drift */
  .mote {
    position: absolute;
    border-radius: 50%;
    background: rgba(120, 175, 168, 0.35);
    animation: mote-drift ease-in-out infinite alternate;
  }
  .m1 { width:3px; height:3px; top:18%; left:72%; animation-duration:9s;  animation-delay:0s;  }
  .m2 { width:2px; height:2px; top:35%; left:20%; animation-duration:13s; animation-delay:3s;  }
  .m3 { width:2px; height:2px; top:60%; left:85%; animation-duration:11s; animation-delay:6s;  }
  .m4 { width:3px; height:3px; top:75%; left:40%; animation-duration:15s; animation-delay:1s;  }
  .m5 { width:2px; height:2px; top:10%; left:50%; animation-duration:10s; animation-delay:4s;  }

  @keyframes mote-drift {
    0%   { transform: translate(0, 0);        opacity: 0.25; }
    100% { transform: translate(10px, -16px); opacity: 0.60; }
  }

  /* gradient border card */
  .home-card {
    position: relative;
    background: rgba(242, 250, 248, 0.88);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border-radius: 1.5rem;
    box-shadow:
      0 2px  4px rgba(60,100,90,0.06),
      0 8px 24px rgba(60,100,90,0.10),
      0 24px 48px rgba(60,100,90,0.07),
      inset 0 1px 0 rgba(255,255,255,0.98);
  }
  .home-card::before {
    content: '';
    position: absolute;
    inset: 0;
    border-radius: inherit;
    padding: 1px;
    background: linear-gradient(
      145deg,
      rgba(120,185,175,0.55) 0%,
      rgba(200,235,230,0.25) 40%,
      rgba(255,255,255,0.10) 60%,
      rgba(100,170,160,0.40) 100%
    );
    -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
    -webkit-mask-composite: xor;
    mask-composite: exclude;
    pointer-events: none;
  }

  /* gradient ring on avatar */
  .home-avatar-ring {
    position: absolute;
    inset: -4px;
    border-radius: 50%;
    padding: 2px;
    background: linear-gradient(135deg, rgba(100,175,165,0.8), rgba(200,235,230,0.4), rgba(80,160,150,0.7));
    -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
    -webkit-mask-composite: xor;
    mask-composite: exclude;
    animation: home-breathe 5s ease-in-out infinite;
  }

  /* decorative divider */
  .home-divider {
    width: 2.5rem;
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(100,165,155,0.45), transparent);
    margin: 0 auto;
  }

  .home-icon-btn {
    position: relative;
    width: 2.6rem; height: 2.6rem;
    background: rgba(242, 252, 250, 0.70);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #3d8878;
    transition: background 0.25s, box-shadow 0.25s, transform 0.2s;
    text-decoration: none;
    box-shadow: 0 2px 8px rgba(60,110,100,0.12), inset 0 1px 0 rgba(255,255,255,0.90);
  }
  .home-icon-btn::before {
    content: '';
    position: absolute;
    inset: 0;
    border-radius: 50%;
    padding: 1px;
    background: linear-gradient(135deg, rgba(100,175,165,0.5), rgba(200,235,230,0.2), rgba(80,160,150,0.4));
    -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
    -webkit-mask-composite: xor;
    mask-composite: exclude;
  }
  .home-icon-btn:hover {
    background: rgba(228, 248, 245, 0.90);
    box-shadow: 0 4px 16px rgba(60,110,100,0.18), inset 0 1px 0 rgba(255,255,255,0.95);
    transform: translateY(-1px);
  }

  @keyframes home-breathe {
    0%, 100% { opacity: 0.5; }
    50%       { opacity: 1;   }
  }

  /* ── Home: dark mode (中性深灰，协调 gray-900) ── */
  .dark .home-bg {
    background: linear-gradient(145deg, #111827 0%, #0f1520 50%, #121827 100%);
  }
  .dark .home-bg::before {
    background:
      radial-gradient(ellipse 60% 50% at 85% 8%, rgba(100,175,165,0.07) 0%, transparent 70%),
      radial-gradient(ellipse 40% 60% at 12% 88%, rgba(80,150,140,0.05) 0%, transparent 70%);
  }
  .dark .mote {
    background: rgba(100, 160, 155, 0.18);
  }
  .dark .home-card {
    --home-title:    #e2e8f0;
    --home-subtitle: rgba(180, 200, 195, 0.55);
    background: rgba(20, 26, 38, 0.88);
    box-shadow:
      0 2px  4px rgba(0,0,0,0.30),
      0 8px 24px rgba(0,0,0,0.28),
      0 24px 48px rgba(0,0,0,0.20),
      inset 0 1px 0 rgba(255,255,255,0.04);
  }
  .dark .home-card::before {
    background: linear-gradient(
      145deg,
      rgba(100,175,165,0.35) 0%,
      rgba(60, 120,112,0.12) 40%,
      rgba(255,255,255,0.02) 60%,
      rgba(80, 155,148,0.25) 100%
    );
  }
  .dark .home-avatar-ring {
    background: linear-gradient(135deg, rgba(100,175,165,0.72), rgba(160,215,205,0.25), rgba(80,155,145,0.58));
  }
  .dark .home-divider {
    background: linear-gradient(90deg, transparent, rgba(100,175,165,0.30), transparent);
  }
  .dark .home-icon-btn {
    background: rgba(24, 32, 46, 0.72);
    color: #82c0ba;
    box-shadow: 0 2px 8px rgba(0,0,0,0.28), inset 0 1px 0 rgba(255,255,255,0.04);
  }
  .dark .home-icon-btn::before {
    background: linear-gradient(135deg, rgba(100,175,165,0.38), rgba(150,210,200,0.10), rgba(80,155,145,0.26));
  }
  .dark .home-icon-btn:hover {
    background: rgba(32, 42, 58, 0.90);
    box-shadow: 0 4px 16px rgba(0,0,0,0.32), inset 0 1px 0 rgba(255,255,255,0.05);
  }

</style>
