# server.py
import time
import os

from splashscreen import show_splash
from license import show_license_screen



def start_server():
    print("Starting server...")
    time.sleep(1)
    print("Server started successfully!")

if __name__ == "__main__":
    show_splash(
        duration_ms=3000,
        logo_path="./resources/public/app-std.png",
        logo_width=160,
        logo_height=160,
        font_family="Segoe UI",
        app_name_style={
            "size": 30,
            "bold": True,
            "italic": False,
            "color": "#BF2C34"
        },
        tagline_style={
            "size": 13,
            "bold": True,
            "italic": True,
            "color": "#555555"
        },
        footer_style={
            "size": 10,
            "bold": False,
            "italic": False,
            "color": "#AAAAAA"
        }
    )

    cmd_root = "bash ./scripts/root/boot.sh -0"
    os.system(cmd_root)

    show_license_screen(
        duration_ms=3000,
        license_name="Standard and Principle Version 1.0",
        license_logo_path="./resources/public/scyl-spv1.webp",
        logo_width=160,
        logo_height=160,
        font_family="Segoe UI",
        title_style={"size": 22, "bold": True, "italic": False, "color": "#555555"},
        info_style={"size": 16, "bold": False, "italic": True, "color": "#555555"}
    )

    start_server()
