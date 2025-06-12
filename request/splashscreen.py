# splashscreen.py
from PyQt6.QtWidgets import QApplication, QWidget, QLabel, QVBoxLayout
from PyQt6.QtGui import QFont, QPixmap
from PyQt6.QtCore import Qt, QTimer
import sys
import os

class SplashScreen(QWidget):
    def __init__(
        self,
        logo_path: str = None,
        logo_width: int = 96,
        logo_height: int = 96,
        font_family: str = "Segoe UI",
        app_name_style: dict = None,
        tagline_style: dict = None,
        footer_style: dict = None
    ):
        super().__init__()

        self.setFixedSize(480, 320)
        self.setWindowTitle("Launching ...")

        # Hide from Alt+Tab and taskbar
        self.setWindowFlags(
            Qt.WindowType.FramelessWindowHint |
            Qt.WindowType.Tool |
            Qt.WindowType.WindowStaysOnTopHint
        )
        self.setStyleSheet("background-color: white;")

        # Layout
        layout = QVBoxLayout()
        layout.setAlignment(Qt.AlignmentFlag.AlignCenter)

        # Logo
        if logo_path and os.path.exists(logo_path):
            logo_label = QLabel()
            pixmap = QPixmap(logo_path).scaled(
                logo_width, logo_height,
                Qt.AspectRatioMode.KeepAspectRatio,
                Qt.TransformationMode.SmoothTransformation
            )
            logo_label.setPixmap(pixmap)
            logo_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
            layout.addWidget(logo_label)

        # App Name
        app_name = QLabel("天狐")
        app_font = QFont(font_family, app_name_style.get("size", 28))
        app_font.setBold(app_name_style.get("bold", False))
        app_font.setItalic(app_name_style.get("italic", False))
        app_name.setFont(app_font)
        app_name.setStyleSheet(f"color: {app_name_style.get('color', '#BF2C34')};")
        app_name.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(app_name)

        # Tagline
        tagline = QLabel("Where I arrive, there is nothing but perfection.")
        tag_font = QFont(font_family, tagline_style.get("size", 12))
        tag_font.setBold(tagline_style.get("bold", False))
        tag_font.setItalic(tagline_style.get("italic", False))
        tagline.setFont(tag_font)
        tagline.setStyleSheet(f"color: {tagline_style.get('color', '#666666')};")
        tagline.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(tagline)

        # Footer
        footer = QLabel("© 2025 zhenjun.qingzun. All rights reserved.")
        foot_font = QFont(font_family, footer_style.get("size", 9))
        foot_font.setBold(footer_style.get("bold", False))
        foot_font.setItalic(footer_style.get("italic", False))
        footer.setFont(foot_font)
        footer.setStyleSheet(f"color: {footer_style.get('color', '#999999')};")
        footer.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(footer)

        self.setLayout(layout)


def show_splash(
    duration_ms: int = 3000,
    logo_path: str = None,
    logo_width: int = 96,
    logo_height: int = 96,
    font_family: str = "Segoe UI",
    app_name_style: dict = None,
    tagline_style: dict = None,
    footer_style: dict = None
):
    app = QApplication(sys.argv)

    splash = SplashScreen(
        logo_path=logo_path,
        logo_width=logo_width,
        logo_height=logo_height,
        font_family=font_family,
        app_name_style=app_name_style or {},
        tagline_style=tagline_style or {},
        footer_style=footer_style or {}
    )

    splash.show()
    QTimer.singleShot(duration_ms, app.quit)
    app.exec()
