#!/usr/bin/env python3
"""Generate 1200x630 OG images with title, branding, and CTA."""
import sys
import textwrap

try:
    from PIL import Image, ImageDraw, ImageFont
except ImportError:
    print("Installing Pillow...")
    import subprocess
    subprocess.check_call([sys.executable, "-m", "pip", "install", "Pillow", "-q"])
    from PIL import Image, ImageDraw, ImageFont


def find_font(names, size):
    """Try font names in order, fall back to default."""
    import os
    paths = [
        os.path.expanduser("~/Library/Fonts"),
        "/System/Library/Fonts",
        "/Library/Fonts",
    ]
    for name in names:
        for d in paths:
            for ext in (".otf", ".ttf"):
                p = os.path.join(d, name + ext)
                if os.path.exists(p):
                    return ImageFont.truetype(p, size)
    return ImageFont.load_default()


SUBTITLE = "Crash Course In Kafka Brain Surgery"


def generate(title, output):
    W, H = 1200, 630
    bg = "#0f172a"
    img = Image.new("RGB", (W, H), bg)
    draw = ImageDraw.Draw(img)

    font_title = find_font(["Inter-SemiBold", "Inter-Bold"], 48)
    font_subtitle = find_font(["Lora-Italic", "Inter-Light"], 20)
    font_sub = find_font(["Inter-Regular", "Inter"], 20)
    font_cta = find_font(["Inter-SemiBold", "Inter-Bold"], 18)

    # Accent line top
    draw.rectangle([0, 0, W, 4], fill="#4F46E5")

    # Blog subtitle
    draw.text((80, 40), SUBTITLE, fill="#64748b", font=font_subtitle)

    # Thin separator
    draw.rectangle([80, 75, 280, 76], fill="#334155")

    # Title — wrap to ~34 chars per line
    lines = textwrap.wrap(title, width=34)
    y = 110
    for line in lines[:5]:
        draw.text((80, y), line, fill="#e2e8f0", font=font_title)
        y += 60

    # Branding
    draw.text((80, 555), "Viktor Gamov  \u00b7  gamov.io", fill="#94a3b8", font=font_sub)

    # CTA button
    draw.rounded_rectangle([900, 515, 1120, 558], radius=8, fill="#4F46E5")
    draw.text((930, 525), "Read more \u2192", fill="#ffffff", font=font_cta)

    img.save(output, "PNG")
    print(f"Created: {output}")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print(f"Usage: {sys.argv[0]} 'Title' output.png")
        sys.exit(1)
    generate(sys.argv[1], sys.argv[2])
