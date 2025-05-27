
// fix-icons.ts
import fs from "fs";
import path from "path";

const iconsDir = "./icons"; // your folder path
const svgFiles = fs.readdirSync(iconsDir).filter(f => f.endsWith(".svg"));

for (const file of svgFiles) {
  const fullPath = path.join(iconsDir, file);
  let content = fs.readFileSync(fullPath, "utf-8");

  // Replace hardcoded fills and strokes
  content = content
    .replace(/fill="#[0-9a-fA-F]{3,6}"/g, 'fill="currentColor"')
    .replace(/stroke="#[0-9a-fA-F]{3,6}"/g, 'stroke="currentColor"');

  fs.writeFileSync(fullPath, content, "utf-8");
  console.log(`✅ Updated ${file}`);
}
