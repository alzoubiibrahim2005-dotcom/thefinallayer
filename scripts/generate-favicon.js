// Converts favicon.svg → apple-touch-icon.png (180x180) + favicon.ico (16,32,48px)
// Run from repo root: node scripts/generate-favicon.js

const sharp   = require('sharp');
const pngToIco = require('png-to-ico');
const fs      = require('fs');
const path    = require('path');

const ROOT = path.join(__dirname, '..');
const SVG  = fs.readFileSync(path.join(ROOT, 'favicon.svg'));

async function main() {
  // apple-touch-icon.png — 180x180 for iOS Safari bookmarks / home screen
  await sharp(SVG).resize(180, 180).png().toFile(path.join(ROOT, 'apple-touch-icon.png'));
  console.log('✓ apple-touch-icon.png (180x180)');

  // favicon-32.png — 32x32 for browser tabs
  await sharp(SVG).resize(32, 32).png().toFile(path.join(ROOT, 'favicon-32.png'));
  console.log('✓ favicon-32.png (32x32)');

  // favicon.ico — multi-size (16, 32, 48) for maximum compatibility
  const sizes = [16, 32, 48];
  const pngBuffers = await Promise.all(
    sizes.map(s => sharp(SVG).resize(s, s).png().toBuffer())
  );
  const ico = await pngToIco(pngBuffers);
  fs.writeFileSync(path.join(ROOT, 'favicon.ico'), ico);
  console.log('✓ favicon.ico (16x16, 32x32, 48x48)');
}

main().catch(err => { console.error(err); process.exit(1); });
